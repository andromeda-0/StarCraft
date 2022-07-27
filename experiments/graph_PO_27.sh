#!/bin/bash
tmux new -d -s PORight_Heterogeneous_reinforce_g2anet
tmux send-keys -t PORight_Heterogeneous_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 0 --map saturn.PORight_Heterogeneous --run_id 7.27 --n_steps 100000000 --gamma 0.7 --evaluate_epoch 10 --evaluate_cycle 200000" Enter
tmux new -d -s POMiddle_Heterogeneous_reinforce_g2anet
tmux send-keys -t POMiddle_Heterogeneous_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 1 --map saturn.POMiddle_Heterogeneous --run_id 7.27 --n_steps 100000000 --gamma 0.7 --evaluate_epoch 10 --evaluate_cycle 200000" Enter
tmux new -d -s POLeft_Heterogeneous_reinforce_g2anet
tmux send-keys -t POLeft_Heterogeneous_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 2 --map saturn.POLeft_Heterogeneous --run_id 7.27 --n_steps 100000000 --gamma 0.7 --evaluate_epoch 10 --evaluate_cycle 200000" Enter
