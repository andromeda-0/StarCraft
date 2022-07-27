from dataclasses import *

import torch

from common.arguments import get_g2anet_args

from network.g2anet import G2ANet

from torch.onnx import export


@dataclass
class Arguments:
    # env properties
    entry_point: str = 'gym_multigrid.envs.fully_observable:FON_A3_Random'
    # NN
    rnn_hidden_dim: int = 64
    lr_actor: float = 1e-4
    lr_critic: float = 1e-3
    # RL
    use_agent_id: bool = True
    last_action: bool = True
    n_steps: int = int(1e7)
    n_episodes: int = 1
    gamma: float = 0.99
    # Experiments
    evaluate_cycle: int = 50000
    evaluate_epoch: int = 16
    save_cycle: int = 10
    model_dir: str = './models'
    replay_dir: str = './replays'
    result_dir: str = './runs'
    log_dir: str = './logs'
    device: str = 'cpu'
    run_id: str = '0'
    evaluate: bool = False
    load_model: str = ''
    greedy_evaluate: bool = False
    BC: bool = False
    BC_save_interval = 50
    # properties that must be defined by the child classes
    alg: str = field(init=False)
    # env properties that should be initialized after the env is created
    n_actions: int = field(init=False)
    n_agents: int = field(init=False)
    state_shape: int = field(init=False)
    obs_shape: tuple = field(init=False)
    episode_limit: int = field(init=False)

    def __str__(self):
        return self.__repr__().replace(' ', '')


if __name__ == '__main__':
    a = get_g2anet_args(Arguments())
    a.input_shape = 32
    a.rnn_hidden_dim = 32
    a.rnn_hidden_dim = 64
    a.n_agents = 3
    a.n_actions = 20
    b = G2ANet(32, a)

    print(b)

    export(b, (torch.zeros(10 * 3, 32), torch.zeros(10 * 3 * 64)), 'g2anet.onnx', opset_version=14)
