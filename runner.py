import os

import numpy as np
import torch.utils.data
from torch.utils.tensorboard import SummaryWriter
from tqdm import tqdm

import common.utils
from agent.agent import Agents, CommAgents
from common.replay_buffer import ReplayBuffer
from common.rollout import CommRolloutWorker, RolloutWorker


class Runner:
    def __init__(self, env, args):
        self.env = env

        if args.alg.find('commnet') > -1 or args.alg.find('g2anet') > -1:  # communication agent
            self.agents = CommAgents(args)
            self.rolloutWorker = CommRolloutWorker(env, self.agents, args)
        else:  # no communication agent
            self.agents = Agents(args)
            self.rolloutWorker = RolloutWorker(env, self.agents, args)
        if not args.evaluate and args.alg.find('coma') == -1 and args.alg.find(
                'central_v') == -1 and args.alg.find(
                'reinforce') == -1:  # these 3 algorithms are on-policy
            self.buffer = ReplayBuffer(args)
        self.args = args

        self.save_path = self.args.result_dir + '/' + args.map + '/' + args.alg + '/' + args.run_id
        if not os.path.exists(self.save_path):
            os.makedirs(self.save_path)

        self.log_path = self.args.log_dir + '/' + args.map + '/' + args.alg + '/' + args.run_id
        if not os.path.exists(self.log_path):
            os.makedirs(self.log_path)

        self.writer = SummaryWriter(self.save_path)

    def run(self):
        time_steps, train_steps, evaluate_steps = 0, 0, -1
        with tqdm(total=self.args.n_steps) as pbar:
            while time_steps < self.args.n_steps:
                # print('Run {}, time_steps {}'.format(num_run, time_steps))
                if time_steps // self.args.evaluate_cycle > evaluate_steps:
                    metrics = self.evaluate(time_steps)
                    self.plt(time_steps, metrics)
                    evaluate_steps += 1
                episodes = []
                # 收集self.args.n_episodes个episodes
                for episode_idx in range(self.args.n_episodes):
                    episode, _, _, steps = self.rolloutWorker.generate_episode(episode_idx)
                    episodes.append(episode)
                    time_steps += steps
                    pbar.update(steps)
                    # print(_)
                # episode的每一项都是一个(1, episode_len, n_agents, 具体维度)四维数组，下面要把所有episode的的obs拼在一起
                episode_batch = episodes[0]
                episodes.pop(0)
                for episode in episodes:
                    for key in episode_batch.keys():
                        episode_batch[key] = np.concatenate((episode_batch[key], episode[key]),
                                                            axis=0)
                if self.args.alg.find('coma') > -1 or self.args.alg.find(
                        'central_v') > -1 or self.args.alg.find('reinforce') > -1:
                    self.agents.train(episode_batch, train_steps, self.rolloutWorker.epsilon)
                    train_steps += 1
                else:
                    self.buffer.store_episode(episode_batch)
                    for train_step in range(self.args.train_steps):
                        mini_batch = self.buffer.sample(
                                min(self.buffer.current_size, self.args.batch_size))
                        self.agents.train(mini_batch, train_steps)
                        train_steps += 1
        metrics = self.evaluate(time_steps)
        self.plt(time_steps, metrics)

    def BC(self):
        print('Behavior Cloning...')
        dataset = common.utils.SaturnSeries(self.args)
        dataloader = torch.utils.data.DataLoader(dataset, batch_size=self.args.BC_batch_size,
                                                 shuffle=True)
        count_actions = torch.zeros(self.args.n_actions)
        bin_actions = torch.bincount(dataset.actions.flatten())
        count_actions[:bin_actions.shape[0]] = bin_actions
        mask_unavailable_actions = count_actions == 0
        count_actions[mask_unavailable_actions] = 1
        weights = 1 / count_actions
        weights[mask_unavailable_actions] = 0
        weights = weights / torch.norm(weights)
        weights.to(self.args.device)

        for epoch in tqdm(range(1, self.args.BC_epochs + 1)):
            total_loss = 0.0
            i = 0
            for i, batch in enumerate(dataloader):
                bx = batch[0].to(self.args.device)
                by = batch[1].to(self.args.device)

                total_loss += self.agents.BC(bx, by, epoch, weights)
            self.writer.add_scalar('BC_RMSE', np.sqrt(total_loss / (i + 1)), epoch)

    def evaluate(self, time_steps):
        metrics = dict()
        episode_rewards = np.zeros(self.args.evaluate_epoch)
        for epoch in range(self.args.evaluate_epoch):
            _, episode_reward, metrics_epoch, _ = self.rolloutWorker.generate_episode(epoch,
                                                                                      evaluate=True,
                                                                                      time_steps=time_steps)
            episode_rewards[epoch] = episode_reward
            for k in metrics_epoch:
                if k not in metrics:
                    metrics[k] = np.zeros(self.args.evaluate_epoch)

                metrics[k][epoch] = metrics_epoch[k]
        metrics['rewards'] = episode_rewards
        return metrics

    def plt(self, num_steps, metrics):
        for k in metrics:
            self.writer.add_scalar(k + '/mean', metrics[k].mean(), num_steps)
            self.writer.add_scalar(k + '/std', metrics[k].std(), num_steps)
            self.writer.add_scalar(k + '/max', metrics[k].max(), num_steps)
            self.writer.add_scalar(k + '/min', metrics[k].min(), num_steps)
        self.writer.flush()
        np.savez_compressed(self.log_path + '/' + str(num_steps) + '.npz', **metrics)
