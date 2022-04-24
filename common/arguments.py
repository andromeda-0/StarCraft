import argparse

import torch

"""
Here are the param for the training

"""


def get_common_args():
    parser = argparse.ArgumentParser()
    # the environment setting
    parser.add_argument('--map', type=str, default='YellowEnv3', help='the map of the game')
    parser.add_argument('--step_mul', type=int, default=8, help='how many steps to make an action')
    parser.add_argument('--replay_dir', type=str, default='replays')
    parser.add_argument('--alg', type=str, default='reinforce+g2anet',
                        help='vdn, coma, central_v, qmix, qtran_base, qtran_alt,'
                             ' reinforce, coma+commnet, central_v+commnet,'
                             ' reinforce+commnet, coma+g2anet, central_v+g2anet,'
                             ' reinforce+g2anet, maven')
    parser.add_argument('--n_steps', type=int, default=2000000, help='total time steps')
    parser.add_argument('--n_episodes', type=int, default=1,
                        help='the number of episodes before once training')
    parser.add_argument('--last_action', type=bool, default=True,
                        help='whether to use the last action to choose action')
    parser.add_argument('--reuse_network', type=bool, default=True,
                        help='whether to use one network for all agents')
    parser.add_argument('--gamma', type=float, default=0.99, help='discount factor')
    parser.add_argument('--optimizer', type=str, default="RMS", help='optimizer')
    parser.add_argument('--evaluate_cycle', type=int, default=50000,
                        help='how often to evaluate the model')
    parser.add_argument('--evaluate_epoch', type=int, default=32,
                        help='number of the epoch to evaluate the agent')
    parser.add_argument('--model_dir', type=str, default='./model',
                        help='model directory of the policy')
    parser.add_argument('--result_dir', type=str, default='./runs',
                        help='result directory of the policy')
    parser.add_argument('--load_model', type=str, default='',
                        help='whether to load the pretrained model')
    parser.add_argument('--evaluate', action='store_true',
                        help='whether to evaluate the model')
    parser.add_argument('--device', type=int, help='GPU ID', default='0')
    parser.add_argument('--run_id', default='0')
    parser.add_argument('--save_cycle', type=int, default=1000)
    parser.add_argument('--BC', action='store_true')
    parser.add_argument('--BC_data_dir', default='BC_data/Yellow3')
    parser.add_argument('--BC_epochs', default=200, type=int)
    parser.add_argument('--BC_batch_size', default=32, type=int)
    parser.add_argument('--BC_save_interval', default=20, type=int)
    args = parser.parse_args()
    # noinspection PyTypeChecker
    args.device = torch.device('cuda:' + str(args.device)) if args.device >= 0 else torch.device(
            'cpu')
    return args


# arguments of coma
def get_coma_args(args):
    # network
    args.rnn_hidden_dim = 64
    args.critic_dim = 128
    args.lr_actor = 1e-4
    args.lr_critic = 1e-3

    # epsilon-greedy
    args.epsilon = 0.5
    args.anneal_epsilon = 0.00064
    args.min_epsilon = 0.02
    args.epsilon_anneal_scale = 'episode'

    # lambda of td-lambda return
    args.td_lambda = 0.8

    # how often to save the model
    args.save_cycle = 5000

    # how often to update the target_net
    args.target_update_cycle = 200

    # prevent gradient explosion
    args.grad_norm_clip = 10

    return args


# arguments of vdn、 qmix、 qtran
def get_mixer_args(args):
    # network
    args.rnn_hidden_dim = 64
    args.qmix_hidden_dim = 32
    args.two_hyper_layers = False
    args.hyper_hidden_dim = 64
    args.qtran_hidden_dim = 64
    args.lr = 5e-4

    # epsilon greedy
    args.epsilon = 1
    args.min_epsilon = 0.05
    anneal_steps = 50000
    args.anneal_epsilon = (args.epsilon - args.min_epsilon) / anneal_steps
    args.epsilon_anneal_scale = 'step'

    # the number of the train steps in one epoch
    args.train_steps = 1

    # experience replay
    args.batch_size = 32
    args.buffer_size = 500  # int(5e3) TODO

    # how often to save the model
    args.save_cycle = 5000

    # how often to update the target_net
    args.target_update_cycle = 200

    # QTRAN lambda
    args.lambda_opt = 1
    args.lambda_nopt = 1

    # prevent gradient explosion
    args.grad_norm_clip = 10

    # MAVEN
    args.noise_dim = 16
    args.lambda_mi = 0.001
    args.lambda_ql = 1
    args.entropy_coefficient = 0.001
    return args


# arguments of central_v
def get_centralv_args(args):
    # network
    args.rnn_hidden_dim = 64
    args.critic_dim = 128
    args.lr_actor = 1e-4
    args.lr_critic = 1e-3

    # epsilon-greedy
    args.epsilon = 0.5
    args.anneal_epsilon = 0.00064
    args.min_epsilon = 0.02
    args.epsilon_anneal_scale = 'episode'

    # lambda of td-lambda return
    args.td_lambda = 0.8

    # how often to save the model
    args.save_cycle = 5000

    # how often to update the target_net
    args.target_update_cycle = 200

    # prevent gradient explosion
    args.grad_norm_clip = 10

    return args


# arguments of reinforce
def get_reinforce_args(args):
    # network
    args.rnn_hidden_dim = 64
    args.lr_actor = 1e-4
    # reinforce has no critic!

    # epsilon-greedy
    args.epsilon = 0.5
    args.anneal_epsilon = 0.00064
    args.min_epsilon = 0.02
    args.epsilon_anneal_scale = 'episode'

    # prevent gradient explosion
    args.grad_norm_clip = 10

    return args


# arguments of coma+commnet
def get_commnet_args(args):
    if args.map == '3m':
        args.k = 2
    else:
        args.k = 3
    return args


def get_g2anet_args(args):
    args.attention_dim = 32
    args.hard = True
    return args
