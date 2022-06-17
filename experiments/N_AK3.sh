#!/bin/bash
tmux new -d -s N_AK3_reinforce
tmux send-keys -t N_AK3_reinforce "cd ..; conda activate multi-grid; python main.py --alg=reinforce --device 5 --map star_craft.N_AK3 --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s N_AK3_qmix
tmux send-keys -t N_AK3_qmix "cd ..; conda activate multi-grid; python main.py --alg=qmix --device 6 --map star_craft.N_AK3 --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s N_AK3_maven
tmux send-keys -t N_AK3_maven "cd ..; conda activate multi-grid; python main.py --alg=maven --device 7 --map star_craft.N_AK3 --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s N_AK3_reinforce_commnet
tmux send-keys -t N_AK3_reinforce_commnet "cd ..; conda activate multi-grid; python main.py --alg=reinforce+commnet --device 5 --map star_craft.N_AK3 --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s N_AK3_reinforce_g2anet
tmux send-keys -t N_AK3_reinforce_g2anet "cd ..; conda activate multi-grid; python main.py --alg=reinforce+g2anet --device 6 --map star_craft.N_AK3 --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s N_AK3_reinforce_random
tmux send-keys -t N_AK3_reinforce_random "cd ..; conda activate multi-grid; python main.py --alg=reinforce --device 7 --map star_craft.N_AK3_Random --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s N_AK3_qmix_random
tmux send-keys -t N_AK3_qmix_random "cd ..; conda activate multi-grid; python main.py --alg=qmix --device 1 --map star_craft.N_AK3_Random --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s N_AK3_maven_random
tmux send-keys -t N_AK3_maven_random "cd ..; conda activate multi-grid; python main.py --alg=maven --device 2 --map star_craft.N_AK3_Random --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s N_AK3_reinforce_commnet_random
tmux send-keys -t N_AK3_reinforce_commnet_random "cd ..; conda activate multi-grid; python main.py --alg=reinforce+commnet --device 3 --map star_craft.N_AK3_Random --run_id 6.16 --n_steps 10000000" Enter
tmux new -d -s N_AK3_reinforce_g2anet_random
tmux send-keys -t N_AK3_reinforce_g2anet_random "cd ..; conda activate multi-grid; python main.py --alg=reinforce+g2anet --device 4 --map star_craft.N_AK3_Random --run_id 6.16 --n_steps 10000000" Enter
