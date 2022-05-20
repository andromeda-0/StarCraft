#!/bin/bash
tmux new -d -s POTopLeftFixed_Heterogeneous_reinforce
tmux send-keys -t POTopLeftFixed_Heterogeneous_reinforce "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 4 --map saturn.POTopLeftFixed_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s POTopLeftFixed_Heterogeneous_reinforce_commnet
tmux send-keys -t POTopLeftFixed_Heterogeneous_reinforce_commnet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 5 --map saturn.POTopLeftFixed_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s POTopLeftFixed_Heterogeneous_reinforce_g2anet
tmux send-keys -t POTopLeftFixed_Heterogeneous_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 5 --map saturn.POTopLeftFixed_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s POTopLeftFixed_Heterogeneous_qmix
tmux send-keys -t POTopLeftFixed_Heterogeneous_qmix "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 5 --map saturn.POTopLeftFixed_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s POTopLeftFixed_Heterogeneous_maven
tmux send-keys -t POTopLeftFixed_Heterogeneous_maven "cd ..; conda activate gym_graph; python main.py --alg=maven --device 6 --map saturn.POTopLeftFixed_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s FOTopLeftFixed_Heterogeneous_reinforce
tmux send-keys -t FOTopLeftFixed_Heterogeneous_reinforce "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 6 --map saturn.FOTopLeftFixed_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s FOTopLeftFixed_Heterogeneous_reinforce_commnet
tmux send-keys -t FOTopLeftFixed_Heterogeneous_reinforce_commnet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 6 --map saturn.FOTopLeftFixed_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s FOTopLeftFixed_Heterogeneous_reinforce_g2anet
tmux send-keys -t FOTopLeftFixed_Heterogeneous_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 7 --map saturn.FOTopLeftFixed_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s FOTopLeftFixed_Heterogeneous_qmix
tmux send-keys -t FOTopLeftFixed_Heterogeneous_qmix "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 7 --map saturn.FOTopLeftFixed_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s FOTopLeftFixed_Heterogeneous_maven
tmux send-keys -t FOTopLeftFixed_Heterogeneous_maven "cd ..; conda activate gym_graph; python main.py --alg=maven --device 7 --map saturn.FOTopLeftFixed_Heterogeneous --run_id 5.20 --n_steps 20000000" Enter
