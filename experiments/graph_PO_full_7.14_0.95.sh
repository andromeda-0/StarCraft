#!/bin/bash
tmux new -d -s POFull_Heterogeneous_reinforce_95
tmux send-keys -t POFull_Heterogeneous_reinforce_95 "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 0 --map saturn.POFull_Heterogeneous --run_id 7.14-95 --n_steps 200000000 --gamma 0.95" Enter
tmux new -d -s POFull_Heterogeneous_reinforce_commnet_95
tmux send-keys -t POFull_Heterogeneous_reinforce_commnet_95 "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 1 --map saturn.POFull_Heterogeneous --run_id 7.14-95 --n_steps 200000000 --gamma 0.95" Enter
tmux new -d -s POFull_Heterogeneous_reinforce_g2anet_95
tmux send-keys -t POFull_Heterogeneous_reinforce_g2anet_95 "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 2 --map saturn.POFull_Heterogeneous --run_id 7.14-95 --n_steps 200000000 --gamma 0.95" Enter
tmux new -d -s POFull_Heterogeneous_qmix_95
tmux send-keys -t POFull_Heterogeneous_qmix_95 "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 5 --map saturn.POFull_Heterogeneous --run_id 7.14-95 --n_steps 200000000 --gamma 0.95" Enter
tmux new -d -s POFull_Heterogeneous_maven_95
tmux send-keys -t POFull_Heterogeneous_maven_95 "cd ..; conda activate gym_graph; python main.py --alg=maven --device 6 --map saturn.POFull_Heterogeneous --run_id 7.14-95 --n_steps 200000000 --gamma 0.95" Enter
