import inspect
import functools
import os
from typing import Optional

import numpy as np
import torch
import torch.utils.data
import torch.nn.functional

from torch.utils.data.dataset import T_co


def store_args(method):
    """Stores provided method args as instance attributes.
    """
    argspec = inspect.getfullargspec(method)
    defaults = {}
    if argspec.defaults is not None:
        defaults = dict(
                zip(argspec.args[-len(argspec.defaults):], argspec.defaults))
    if argspec.kwonlydefaults is not None:
        defaults.update(argspec.kwonlydefaults)
    arg_names = argspec.args[1:]

    @functools.wraps(method)
    def wrapper(*positional_args, **keyword_args):
        self = positional_args[0]
        # Get default arg values
        args = defaults.copy()
        # Add provided arg values
        for name, value in zip(arg_names, positional_args[1:]):
            args[name] = value
        args.update(keyword_args)
        self.__dict__.update(args)
        return method(*positional_args, **keyword_args)

    return wrapper


def td_lambda_target(batch, max_episode_len, q_targets, args):
    # batch.shep = (episode_num, max_episode_len， n_agents，n_actions)
    # q_targets.shape = (episode_num, max_episode_len， n_agents)
    episode_num = batch['o'].shape[0]
    mask = (1 - batch["padded"].float()).repeat(1, 1, args.n_agents)
    terminated = (1 - batch["terminated"].float()).repeat(1, 1, args.n_agents)
    r = batch['r'].repeat((1, 1, args.n_agents))
    # --------------------------------------------------n_step_return---------------------------------------------------
    '''
    1. 每条经验都有若干个n_step_return，所以给一个最大的max_episode_len维度用来装n_step_return
    最后一维,第n个数代表 n+1 step。
    2. 因为batch中各个episode的长度不一样，所以需要用mask将多出的n-step return置为0，
    否则的话会影响后面的lambda return。第t条经验的lambda return是和它后面的所有n-step return有关的，
    如果没有置0，在计算td-error后再置0是来不及的
    3. terminated用来将超出当前episode长度的q_targets和r置为0
    '''
    n_step_return = torch.zeros((episode_num, max_episode_len, args.n_agents, max_episode_len))
    for transition_idx in range(max_episode_len - 1, -1, -1):
        # 最后计算1 step return
        n_step_return[:, transition_idx, :, 0] = (r[:, transition_idx]
                                                  + args.gamma * q_targets[:, transition_idx]
                                                  * terminated[:, transition_idx]) * \
                                                 mask[:, transition_idx]
        # 经验transition_idx上的obs有max_episode_len - transition_idx个return, 分别计算每种step return
        # 同时要注意n step return对应的index为n-1
        for n in range(1, max_episode_len - transition_idx):
            # t时刻的n step return =r + gamma * (t + 1 时刻的 n-1 step return)
            # n=1除外, 1 step return =r + gamma * (t + 1 时刻的 Q)
            n_step_return[:, transition_idx, :, n] = (r[:, transition_idx]
                                                      + args.gamma *
                                                      n_step_return[:, transition_idx + 1, :,
                                                      n - 1]) \
                                                     * mask[:, transition_idx]
    # --------------------------------------------------n_step_return---------------------------------------------------

    # --------------------------------------------------lambda return---------------------------------------------------
    '''
    lambda_return.shape = (episode_num, max_episode_len，n_agents)
    '''
    lambda_return = torch.zeros((episode_num, max_episode_len, args.n_agents))
    for transition_idx in range(max_episode_len):
        returns = torch.zeros((episode_num, args.n_agents))
        for n in range(1, max_episode_len - transition_idx):
            returns += pow(args.td_lambda, n - 1) * n_step_return[:, transition_idx, :, n - 1]
        lambda_return[:, transition_idx] = (1 - args.td_lambda) * returns + \
                                           pow(args.td_lambda,
                                               max_episode_len - transition_idx - 1) * \
                                           n_step_return[:, transition_idx, :,
                                           max_episode_len - transition_idx - 1]
    # --------------------------------------------------lambda return---------------------------------------------------
    return lambda_return


class SaturnSet(torch.utils.data.dataset.Dataset):
    def __init__(self, args):
        self.data_dir = args.BC_data_dir
        self.actions: Optional[torch.Tensor] = None
        self.features: Optional[torch.Tensor] = None

    def input_dims(self):
        return self.features.size()[-1]

    def num_agent(self):
        return self.actions.size()[-1]

    def __len__(self):
        return self.actions.shape[0]

    def __getitem__(self, index) -> T_co:
        return self.features[index], self.actions[index]


class SaturnSeries(SaturnSet):
    def __init__(self, args):
        super(SaturnSeries, self).__init__(args)
        file_names = os.listdir(self.data_dir)
        data = [np.load(os.path.join(self.data_dir, file_name), allow_pickle=True) for file_name in
                file_names if file_name[-4:] == '.npz']
        # Note that data[t] stores a[t] and s[t+1]
        actions = torch.tensor(np.stack([x['actions'] for x in data]),
                               dtype=torch.long)  # Nx(T+1)xn_agents
        self.actions = actions[:, 1:, :]  # NxTxn_agents

        features = torch.tensor(np.stack([x['normalized_obs'][:-1] for x in data]),
                                dtype=torch.float)  # NxTxn_agents xWxHxC
        self.features = torch.flatten(features, start_dim=3)  # NxTxn_agents x(WHC)
        if args.last_action:
            # append a_{t-1} (onehot) to s_t
            last_actions = torch.nn.functional.one_hot(actions[:, :-1, :],
                                                       num_classes=args.n_actions)  # NxTxn_agents xn_actions
            self.features = torch.cat([self.features, last_actions],
                                      dim=-1)  # NxTxn_agents x(WHC+n_actions)
        if args.reuse_network:
            agent_ids = torch.eye(args.n_agents).unsqueeze(0).unsqueeze(0).expand(
                    self.features.shape[0], self.features.shape[1], -1, -1)
            # NxTxn_agents x n_agents
            self.features = torch.cat([self.features, agent_ids], dim=-1)
