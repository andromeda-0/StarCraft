from gym_multigrid.envs.star_craft import *

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
    args.n_actions = env_info["n_actions"] - 1  # forced_drop should not be used
    args.n_agents = env_info["n_agents"]
    args.state_shape = env_info["state_shape"]
    args.obs_shape = env_info["obs_shape"]
    args.episode_limit = env_info["episode_limit"]
    runner = Runner(env, args)
    if not args.evaluate:
        runner.run(args.run_id)
    else:
        metrics, _ = runner.evaluate()
        print('The M1 of {} is  {}'.format(args.alg, metrics['M1']))
    env.close()
