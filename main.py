import warnings

# noinspection PyUnresolvedReferences
from gym_multigrid.envs import *

from common.arguments import get_centralv_args, get_coma_args, get_commnet_args, get_common_args, \
    get_g2anet_args, get_mixer_args, get_reinforce_args
from runner import Runner

warnings.filterwarnings("ignore")

if __name__ == '__main__':
    args = get_common_args()
    if args.alg.find('coma') > -1:
        args = get_coma_args(args)
    elif args.alg.find('central_v') > -1:
        args = get_centralv_args(args)
    elif args.alg.find('reinforce') > -1:
        args = get_reinforce_args(args)
    else:
        args = get_mixer_args(args)
    if args.alg.find('commnet') > -1:
        args = get_commnet_args(args)
    if args.alg.find('g2anet') > -1:
        args = get_g2anet_args(args)
    env = eval(args.map + '()')
    env_info = env.get_configurations()
    args.n_actions = env_info["n_actions"]
    args.n_agents = env_info["n_agents"]
    args.state_shape = env_info["state_shape"]
    args.obs_shape = env_info["obs_shape"]
    args.episode_limit = env_info["episode_limit"]
    runner = Runner(env, args)
    if args.BC:
        runner.BC()
    else:
        runner.run()
    env.close()
