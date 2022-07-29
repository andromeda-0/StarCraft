#!/bin/bash
tmux new -d -s POFull_Heterogeneous_reinforce_95_29
tmux send-keys -t POFull_Heterogeneous_reinforce_95_29 "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 0 --map saturn.POFull_Heterogeneous --run_id 7.29-95 --n_steps 100000000 --gamma 0.95 --evaluate_epoch 10 --evaluate_cycle 200000" Enter
tmux new -d -s POFull_Heterogeneous_reinforce_commnet_95_29
tmux send-keys -t POFull_Heterogeneous_reinforce_commnet_95_29 "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 0 --map saturn.POFull_Heterogeneous --run_id 7.29-95 --n_steps 100000000 --gamma 0.95 --evaluate_epoch 10 --evaluate_cycle 200000" Enter
tmux new -d -s POFull_Heterogeneous_reinforce_g2anet_95_29
tmux send-keys -t POFull_Heterogeneous_reinforce_g2anet_95_29 "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 0 --map saturn.POFull_Heterogeneous --run_id 7.29-95 --n_steps 100000000 --gamma 0.95 --evaluate_epoch 10 --evaluate_cycle 200000" Enter
tmux new -d -s POFull_Heterogeneous_qmix_95_29
tmux send-keys -t POFull_Heterogeneous_qmix_95_29 "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 1 --map saturn.POFull_Heterogeneous --run_id 7.29-95 --n_steps 100000000 --gamma 0.95 --evaluate_epoch 10 --evaluate_cycle 200000" Enter
tmux new -d -s POFull_Heterogeneous_maven_95_29
tmux send-keys -t POFull_Heterogeneous_maven_95_29 "cd ..; conda activate gym_graph; python main.py --alg=maven --device 1 --map saturn.POFull_Heterogeneous --run_id 7.29-95 --n_steps 100000000 --gamma 0.95 --evaluate_epoch 10 --evaluate_cycle 200000" Enter
