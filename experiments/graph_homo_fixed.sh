#!/bin/bash
tmux new -d -s POTopLeftFixed_Homogeneous_reinforce
tmux send-keys -t POTopLeftFixed_Homogeneous_reinforce "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 6 --map saturn.POTopLeftFixed_Homogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s POTopLeftFixed_Homogeneous_reinforce_commnet
tmux send-keys -t POTopLeftFixed_Homogeneous_reinforce_commnet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 6 --map saturn.POTopLeftFixed_Homogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s POTopLeftFixed_Homogeneous_reinforce_g2anet
tmux send-keys -t POTopLeftFixed_Homogeneous_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 6 --map saturn.POTopLeftFixed_Homogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s POTopLeftFixed_Homogeneous_qmix
tmux send-keys -t POTopLeftFixed_Homogeneous_qmix "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 6 --map saturn.POTopLeftFixed_Homogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s POTopLeftFixed_Homogeneous_maven
tmux send-keys -t POTopLeftFixed_Homogeneous_maven "cd ..; conda activate gym_graph; python main.py --alg=maven --device 6 --map saturn.POTopLeftFixed_Homogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s FOTopLeftFixed_Homogeneous_reinforce
tmux send-keys -t FOTopLeftFixed_Homogeneous_reinforce "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 7 --map saturn.FOTopLeftFixed_Homogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s FOTopLeftFixed_Homogeneous_reinforce_commnet
tmux send-keys -t FOTopLeftFixed_Homogeneous_reinforce_commnet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 7 --map saturn.FOTopLeftFixed_Homogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s FOTopLeftFixed_Homogeneous_reinforce_g2anet
tmux send-keys -t FOTopLeftFixed_Homogeneous_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 7 --map saturn.FOTopLeftFixed_Homogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s FOTopLeftFixed_Homogeneous_qmix
tmux send-keys -t FOTopLeftFixed_Homogeneous_qmix "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 7 --map saturn.FOTopLeftFixed_Homogeneous --run_id 5.20 --n_steps 20000000" Enter
tmux new -d -s FOTopLeftFixed_Homogeneous_maven
tmux send-keys -t FOTopLeftFixed_Homogeneous_maven "cd ..; conda activate gym_graph; python main.py --alg=maven --device 7 --map saturn.FOTopLeftFixed_Homogeneous --run_id 5.20 --n_steps 20000000" Enter
