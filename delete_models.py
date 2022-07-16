import os

if __name__ == '__main__':
    root_dir = 'model'
    for map_dir in os.listdir(root_dir):
        map_root = os.path.join(root_dir, map_dir)
        for alg_dir in os.listdir(map_root):
            alg_root = os.path.join(map_root, alg_dir)
            for run_dir in os.listdir(alg_root):
                run_root = os.path.join(alg_root, run_dir)
                model_items = os.listdir(run_root)
                model_items.sort(key=lambda x: int(x.partition('_')[0]))

                for model_item in model_items[:-100]:
                    print(model_item)
                    os.remove(os.path.join(run_root, model_item))
