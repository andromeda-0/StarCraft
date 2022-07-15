#!/bin/bash
tmux new -d -s POLeft_Heterogeneous_reinforce
tmux send-keys -t POLeft_Heterogeneous_reinforce "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 3 --map saturn.POLeft_Heterogeneous --run_id 7.14 --n_steps 200000000 --gamma 0.7" Enter
tmux new -d -s POLeft_Heterogeneous_reinforce_commnet
tmux send-keys -t POLeft_Heterogeneous_reinforce_commnet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 1 --map saturn.POLeft_Heterogeneous --run_id 7.14 --n_steps 200000000 --gamma 0.7" Enter
tmux new -d -s POLeft_Heterogeneous_reinforce_g2anet
tmux send-keys -t POLeft_Heterogeneous_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 2 --map saturn.POLeft_Heterogeneous --run_id 7.14 --n_steps 200000000 --gamma 0.7" Enter
tmux new -d -s POLeft_Heterogeneous_qmix
tmux send-keys -t POLeft_Heterogeneous_qmix "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 5 --map saturn.POLeft_Heterogeneous --run_id 7.14 --n_steps 200000000 --gamma 0.7" Enter
tmux new -d -s POLeft_Heterogeneous_maven
tmux send-keys -t POLeft_Heterogeneous_maven "cd ..; conda activate gym_graph; python main.py --alg=maven --device 6 --map saturn.POLeft_Heterogeneous --run_id 7.14 --n_steps 200000000 --gamma 0.7" Enter
tmux new -d -s POLeft_Heterogeneous_reinforce_cat
tmux send-keys -t POLeft_Heterogeneous_reinforce_cat "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 7 --map saturn.POLeft_Heterogeneous --run_id 7.14-cat --n_steps 200000000 --cat_state --gamma 0.7" Enter
tmux new -d -s POLeft_Heterogeneous_reinforce_commnet_cat
tmux send-keys -t POLeft_Heterogeneous_reinforce_commnet_cat "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 0 --map saturn.POLeft_Heterogeneous --run_id 7.14-cat --n_steps 200000000 --cat_state --gamma 0.7" Enter
tmux new -d -s POLeft_Heterogeneous_reinforce_g2anet_cat
tmux send-keys -t POLeft_Heterogeneous_reinforce_g2anet_cat "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 1 --map saturn.POLeft_Heterogeneous --run_id 7.14-cat --n_steps 200000000 --cat_state --gamma 0.7" Enter
tmux new -d -s POLeft_Heterogeneous_qmix_cat
tmux send-keys -t POLeft_Heterogeneous_qmix_cat "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 2 --map saturn.POLeft_Heterogeneous --run_id 7.14-cat --n_steps 200000000 --cat_state --gamma 0.7" Enter
tmux new -d -s POLeft_Heterogeneous_maven_cat
tmux send-keys -t POLeft_Heterogeneous_maven_cat "cd ..; conda activate gym_graph; python main.py --alg=maven --device 5 --map saturn.POLeft_Heterogeneous --run_id 7.14-cat --n_steps 200000000 --cat_state --gamma 0.7" Enter
