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
    fig = plt.figure()
    fig.canvas.set_window_title(title.replace(':', '-').replace(' ', '-'))

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
    data = dict()
    item_list = sorted([int(x[:-4]) for x in os.listdir(data_dir) if
                        os.path.isfile(os.path.join(data_dir, x))])
    num_items = int(max_steps) // (item_list[1] - item_list[0])

    sample_data = np.load(os.path.join(data_dir, str(item_list[0]) + '.npz'))
    v_shape = list(sample_data.values())[0].shape[0]
    for k, v in sample_data.items():
        data[k] = np.empty(num_items * v_shape, dtype=v.dtype)
        data[k][:] = np.nan
    data['time'] = np.zeros(num_items * v_shape, dtype=np.float)

    for i, item in enumerate(item_list):
        if i >= num_items:
            break

        data_item = np.load(os.path.join(data_dir, str(item) + '.npz'))
        for k, v in data_item.items():
            # if k not in data:
            #     data[k] = np.zeros(shape=num_items * v.shape[0], dtype=v.dtype)
            data[k][i * v_shape:(i + 1) * v_shape] = v
        # data['time'].extend([item] * v.shape[0])
        data['time'][i * v_shape:(i + 1) * v_shape] = item
    data['key'] = [key for _ in range(len(data['time']))]
    df = pandas.DataFrame(data)
    return df


def parse_logs(key_to_paths, max_steps=5e6):
    df = pandas.concat([gather_log(v, k, max_steps) for k, v in key_to_paths.items()],
                       ignore_index=True)
    return df


if __name__ == '__main__':
    import argparse
    import yaml

    parser = argparse.ArgumentParser()
    parser.add_argument('config_path')

    args = parser.parse_args()

    with open(args.config_path) as f:
        config_dict = yaml.safe_load(f)

    if 'steps' not in config_dict:
        config_dict['steps'] = int(2e7)
    if 'smooth_val' not in config_dict:
        config_dict['smooth_val'] = 0
    if 'smooth_mode' not in config_dict:
        config_dict['smooth_mode'] = 'window'

    data = parse_logs(config_dict['paths'], config_dict['steps'])
    plot_vanilla(data, config_dict['metric'], smooth=config_dict['smooth_val'],
                 mode=config_dict['smooth_mode'], title=config_dict['title'])
