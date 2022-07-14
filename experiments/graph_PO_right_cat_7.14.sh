#!/bin/bash
tmux new -d -s PORight_Heterogeneous_reinforce_cat
tmux send-keys -t PORight_Heterogeneous_reinforce_cat "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 4 --map saturn.PORight_Heterogeneous --run_id 7.14-cat --n_steps 200000000 --cat_state --gamma 0.7" Enter
tmux new -d -s PORight_Heterogeneous_reinforce_commnet_cat
tmux send-keys -t PORight_Heterogeneous_reinforce_commnet_cat "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 3 --map saturn.PORight_Heterogeneous --run_id 7.14-cat --n_steps 200000000 --cat_state --gamma 0.7" Enter
tmux new -d -s PORight_Heterogeneous_reinforce_g2anet_cat
tmux send-keys -t PORight_Heterogeneous_reinforce_g2anet_cat "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 2 --map saturn.PORight_Heterogeneous --run_id 7.14-cat --n_steps 200000000 --cat_state --gamma 0.7" Enter
tmux new -d -s PORight_Heterogeneous_qmix_cat
tmux send-keys -t PORight_Heterogeneous_qmix_cat "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 1 --map saturn.PORight_Heterogeneous --run_id 7.14-cat --n_steps 200000000 --cat_state --gamma 0.7" Enter
tmux new -d -s PORight_Heterogeneous_maven_cat
tmux send-keys -t PORight_Heterogeneous_maven_cat "cd ..; conda activate gym_graph; python main.py --alg=maven --device 0 --map saturn.PORight_Heterogeneous --run_id 7.14-cat --n_steps 200000000 --cat_state --gamma 0.7" Enter
