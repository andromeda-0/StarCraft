import os

import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
import pandas

matplotlib.use('qt5agg')


def plot_vanilla(data, key, smooth=1):
    """
    Plot style from https://github.com/openai/spinningup/blob/master/spinup/utils/plot.py
    """
    sns.set_style("whitegrid", {'axes.grid': True, 'axes.edgecolor': 'black'})
    plt.figure()

    if smooth > 1:
        """
        smooth data with moving window average.
        that is,
            smoothed_y[t] = average(y[t-k], y[t-k+1], ..., y[t+k-1], y[t+k])
        where the "smooth" param is width of that window (2k+1)
        """
        y = np.ones(smooth)
        x = np.asarray(data[key])
        z = np.ones(len(x))
        smoothed_x = np.convolve(x, y, 'same') / np.convolve(z, y, 'same')
        data[key] = smoothed_x

    sns.lineplot(data=data, x='time', y=key, ci='sd')
    plt.xlabel('steps')
    plt.ylabel(key)
    sns.despine()
    plt.tight_layout()
    plt.show()


def gather_log(data_dir):
    data = {'time': []}
    item_list = os.listdir(data_dir)
    for i, item in enumerate(item_list):
        data_item = np.load(os.path.join(data_dir, item))
        for k, v in data_item.items():
            if k not in data:
                data[k] = np.zeros(shape=len(item_list) * v.shape[0], dtype=v.dtype)
            data[k][i * v.shape[0]:(i + 1) * v.shape[0]] = v
        data['time'].extend([int(item[:-4])] * v.shape[0])

    return pandas.DataFrame(data)


if __name__ == '__main__':
    data = gather_log('logs/saturn.SaturnTopLeftFixed/reinforce+commnet')
    plot_vanilla(data, 'rewards', smooth=5)
    t = 1
