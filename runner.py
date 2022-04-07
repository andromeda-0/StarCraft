import numpy as np
import os

from tqdm import tqdm

from common.rollout import RolloutWorker, CommRolloutWorker
from agent.agent import Agents, CommAgents
from common.replay_buffer import ReplayBuffer
from torch.utils.tensorboard import SummaryWriter


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
        self.metrics = []
        self.episode_rewards = []

        # 用来保存plt和pkl
        self.save_path = self.args.result_dir + '/' + args.map + '/' + args.alg
        if not os.path.exists(self.save_path):
            os.makedirs(self.save_path)

        self.writer = None

    def run(self, num_run):
        self.writer = SummaryWriter(self.save_path + '/' + str(num_run))
        time_steps, train_steps, evaluate_steps = 0, 0, -1
        with tqdm(total=self.args.n_steps) as pbar:
            while time_steps < self.args.n_steps:
                # print('Run {}, time_steps {}'.format(num_run, time_steps))
                if time_steps // self.args.evaluate_cycle > evaluate_steps:
                    metrics, episode_reward = self.evaluate(time_steps)
                    self.metrics.append(metrics)
                    self.episode_rewards.append(episode_reward)
                    self.plt(time_steps, metrics, episode_reward)
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
        metrics, episode_reward = self.evaluate(time_steps)
        self.metrics.append(metrics)
        self.episode_rewards.append(episode_reward)
        self.plt(time_steps, metrics, episode_reward)

    def evaluate(self, time_steps):
        metrics = dict()
        episode_rewards = 0
        for epoch in range(self.args.evaluate_epoch):
            _, episode_reward, metrics_epoch, _ = self.rolloutWorker.generate_episode(epoch,
                                                                                      evaluate=True,
                                                                                      time_steps=time_steps)
            episode_rewards += episode_reward
            for k in metrics_epoch:
                if k in metrics:
                    metrics[k] += metrics_epoch[k]
                else:
                    metrics[k] = metrics_epoch[k]

        for k in metrics:
            metrics[k] = metrics[k] / self.args.evaluate_epoch
        return metrics, episode_rewards / self.args.evaluate_epoch

    def plt(self, num_steps, metrics, episode_reward):
        for k in metrics:
            self.writer.add_scalar(k, metrics[k], num_steps)
        self.writer.add_scalar('Episode_reward', episode_reward, num_steps)
        self.writer.flush()
