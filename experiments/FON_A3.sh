#!/bin/bash
tmux new -d -s FON_A3_reinforce
tmux send-keys -t FON_A3_reinforce "cd ..; conda activate multi-grid; python main.py --alg=reinforce --device 0 --map fully_observable.FON_A3 --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s FON_A3_qmix
tmux send-keys -t FON_A3_qmix "cd ..; conda activate multi-grid; python main.py --alg=qmix --device 1 --map fully_observable.FON_A3 --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s FON_A3_maven
tmux send-keys -t FON_A3_maven "cd ..; conda activate multi-grid; python main.py --alg=maven --device 2 --map fully_observable.FON_A3 --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s FON_A3_reinforce_commnet
tmux send-keys -t FON_A3_reinforce_commnet "cd ..; conda activate multi-grid; python main.py --alg=reinforce+commnet --device 3 --map fully_observable.FON_A3 --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s FON_A3_reinforce_g2anet
tmux send-keys -t FON_A3_reinforce_g2anet "cd ..; conda activate multi-grid; python main.py --alg=reinforce+g2anet --device 4 --map fully_observable.FON_A3 --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s FON_A3_reinforce_random
tmux send-keys -t FON_A3_reinforce_random "cd ..; conda activate multi-grid; python main.py --alg=reinforce --device 4 --map fully_observable.FON_A3_Random --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s FON_A3_qmix_random
tmux send-keys -t FON_A3_qmix_random "cd ..; conda activate multi-grid; python main.py --alg=qmix --device 3 --map fully_observable.FON_A3_Random --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s FON_A3_maven_random
tmux send-keys -t FON_A3_maven_random "cd ..; conda activate multi-grid; python main.py --alg=maven --device 2 --map fully_observable.FON_A3_Random --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s FON_A3_reinforce_commnet_random
tmux send-keys -t FON_A3_reinforce_commnet_random "cd ..; conda activate multi-grid; python main.py --alg=reinforce+commnet --device 1 --map fully_observable.FON_A3_Random --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s FON_A3_reinforce_g2anet_random
tmux send-keys -t FON_A3_reinforce_g2anet_random "cd ..; conda activate multi-grid; python main.py --alg=reinforce+g2anet --device 0 --map fully_observable.FON_A3_Random --run_id 6.16 --n_steps 10000000" Enter
