import os

import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
import pandas

matplotlib.use('qt5agg')


def plot_vanilla(data, key, smooth=1.0, title='', mode='window'):
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

    sns.lineplot(data=data, x='time', y=key, hue='key')
    plt.xlabel('steps')
    plt.ylabel(key)
    plt.title(title)
    sns.despine()
    plt.tight_layout()
    plt.show()


def gather_log(data_dir, key, max_steps=5e6):
    data = {'time': []}
    item_list = sorted([int(x[:-4]) for x in os.listdir(data_dir)])
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
    data = parse_logs({
        'reinforce+commnet': 'logs/saturn.SaturnTopLeftFixed/reinforce+commnet/non_bc_5.16',
        'iql': 'logs/saturn.SaturnTopLeftFixed/iql/non_bc_5.16',
    }, 4.5e6)
    plot_vanilla(data, 'M1', smooth=0.6, mode='exp')
    # data = parse_logs({
    #     'coma': 'logs/saturn.SaturnTopLeftFixed/reinforce+commnet/non_bc_5.16',
    #     'coma+commnet': 'logs/saturn.SaturnTopLeftFixed/iql/non_bc_5.16',
    # }, 1.2e6)
    # plot_vanilla(data, 'M1', smooth=0.001, mode='exp')
