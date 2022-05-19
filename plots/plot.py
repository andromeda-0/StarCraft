import json
import os
from typing import Union

import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import pandas
import seaborn as sns

matplotlib.use('qt5agg')


def plot_vanilla(data, key, smooth=1.0, title='', mode='window', ci: Union[int, str] = 95):
    """

    """
    sns.set_style("whitegrid", {'axes.grid': True, 'axes.edgecolor': 'black'})
    plt.figure()

    if smooth > 1 and mode == 'window':
        """
        smooth data with moving window average.
        that is,
            smoothed_y[t] = average(y[t-k], y[t-k+1], ..., y[t+k-1], y[t+k])
        where the "smooth" param is width of that window (2k+1)
        """
        smooth = int(smooth)
        y = np.ones(smooth)
        x = np.asarray(data[key])
        z = np.ones(len(x))
        smoothed_x = np.convolve(x, y, 'same') / np.convolve(z, y, 'same')
        data[key] = smoothed_x
    elif mode == 'exp':
        data[key] = data[key].ewm(alpha=1 - smooth).mean()

    sns.lineplot(data=data, x='time', y=key, hue='key', ci=ci)
    plt.xlabel('steps')
    plt.ylabel(key)
    plt.title(title)
    plt.legend(loc='upper center', ncol=6, handlelength=1,
               mode="expand", borderaxespad=0., prop={'size': 13})
    sns.despine()
    plt.tight_layout()
    plt.show()


def gather_log(data_dir, key, max_steps=5e6):
    data = {'time': []}
    item_list = sorted([int(x[:-4]) for x in os.listdir(data_dir) if
                        os.path.isfile(os.path.join(data_dir, x))])
    num_items = int(max_steps) // (item_list[1] - item_list[0])
    for i, item in enumerate(item_list):
        if i >= num_items:
            break

        data_item = np.load(os.path.join(data_dir, str(item) + '.npz'))
        for k, v in data_item.items():
            if k not in data:
                data[k] = np.zeros(shape=num_items * v.shape[0], dtype=v.dtype)
            data[k][i * v.shape[0]:(i + 1) * v.shape[0]] = v
        data['time'].extend([item] * v.shape[0])
    data['key'] = [key for _ in range(len(data['time']))]
    return pandas.DataFrame(data)


def parse_logs(key_to_paths, max_steps=5e6):
    df = pandas.concat([gather_log(v, k, max_steps) for k, v in key_to_paths.items()],
                       ignore_index=True)
    return df


if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument('config_path')
    parser.add_argument('--smooth', default=0.9, type=float)
    parser.add_argument('--mode', default='exp')
    parser.add_argument('--steps', default=3.8e6, type=float)
    parser.add_argument('--key', default='M1')
    args = parser.parse_args()

    with open(args.config_path) as f:
        config_dict = json.load(f)

    data = parse_logs(config_dict, args.steps)
    plot_vanilla(data, args.key, smooth=args.smooth, mode=args.mode)
