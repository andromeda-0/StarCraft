#!/bin/bash
tmux new -d -s POFullFixed_Heterogeneous_reinforce_commnet
tmux send-keys -t POFullFixed_Heterogeneous_reinforce_commnet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 2 --map saturn.POFullFixed_Heterogeneous --run_id 5.21 --n_steps 20000000" Enter
tmux new -d -s POFull_Heterogeneous_reinforce_commnet
tmux send-keys -t POFull_Heterogeneous_reinforce_commnet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 2 --map saturn.POFull_Heterogeneous --run_id 5.21 --n_steps 20000000" Enter
