#!/bin/bash
tmux new -d -s POTopLeft_Heterogeneous_reinforce
tmux send-keys -t POTopLeft_Heterogeneous_reinforce "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 6 --map saturn.POTopLeft_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s POTopLeft_Heterogeneous_reinforce_commnet
tmux send-keys -t POTopLeft_Heterogeneous_reinforce_commnet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 6 --map saturn.POTopLeft_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s POTopLeft_Heterogeneous_reinforce_g2anet
tmux send-keys -t POTopLeft_Heterogeneous_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 6 --map saturn.POTopLeft_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s POTopLeft_Heterogeneous_qmix
tmux send-keys -t POTopLeft_Heterogeneous_qmix "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 6 --map saturn.POTopLeft_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s POTopLeft_Heterogeneous_maven
tmux send-keys -t POTopLeft_Heterogeneous_maven "cd ..; conda activate gym_graph; python main.py --alg=maven --device 6 --map saturn.POTopLeft_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s FOTopLeft_Heterogeneous_reinforce
tmux send-keys -t FOTopLeft_Heterogeneous_reinforce "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 7 --map saturn.FOTopLeft_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s FOTopLeft_Heterogeneous_reinforce_commnet
tmux send-keys -t FOTopLeft_Heterogeneous_reinforce_commnet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 7 --map saturn.FOTopLeft_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s FOTopLeft_Heterogeneous_reinforce_g2anet
tmux send-keys -t FOTopLeft_Heterogeneous_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 7 --map saturn.FOTopLeft_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s FOTopLeft_Heterogeneous_qmix
tmux send-keys -t FOTopLeft_Heterogeneous_qmix "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 7 --map saturn.FOTopLeft_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s FOTopLeft_Heterogeneous_maven
tmux send-keys -t FOTopLeft_Heterogeneous_maven "cd ..; conda activate gym_graph; python main.py --alg=maven --device 7 --map saturn.FOTopLeft_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
