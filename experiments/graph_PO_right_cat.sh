#!/bin/bash
tmux new -d -s PORight_Heterogeneous_reinforce
tmux send-keys -t PORight_Heterogeneous_reinforce "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 3 --map saturn.PORight_Heterogeneous --run_id 5.27-cat-gamma-0.9 --n_steps 50000000 --cat_state --gamma 0.9" Enter
tmux new -d -s PORight_Heterogeneous_reinforce_commnet
tmux send-keys -t PORight_Heterogeneous_reinforce_commnet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 4 --map saturn.PORight_Heterogeneous --run_id 5.27-cat-gamma-0.9 --n_steps 50000000 --cat_state --gamma 0.9" Enter
tmux new -d -s PORight_Heterogeneous_reinforce_g2anet
tmux send-keys -t PORight_Heterogeneous_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 5 --map saturn.PORight_Heterogeneous --run_id 5.27-cat-gamma-0.9 --n_steps 50000000 --cat_state --gamma 0.9" Enter
tmux new -d -s PORight_Heterogeneous_qmix
tmux send-keys -t PORight_Heterogeneous_qmix "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 6 --map saturn.PORight_Heterogeneous --run_id 5.27-cat-gamma-0.9 --n_steps 50000000 --cat_state --gamma 0.9" Enter
tmux new -d -s PORight_Heterogeneous_maven
tmux send-keys -t PORight_Heterogeneous_maven "cd ..; conda activate gym_graph; python main.py --alg=maven --device 7 --map saturn.PORight_Heterogeneous --run_id 5.27-cat-gamma-0.9 --n_steps 50000000 --cat_state --gamma 0.9" Enter
