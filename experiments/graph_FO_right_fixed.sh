#!/bin/bash
tmux new -d -s FORightFixed_Heterogeneous_reinforce
tmux send-keys -t FORightFixed_Heterogeneous_reinforce "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 2 --map saturn.FORightFixed_Heterogeneous --run_id 5.21 --n_steps 20000000" Enter
tmux new -d -s FORightFixed_Heterogeneous_reinforce_commnet
tmux send-keys -t FORightFixed_Heterogeneous_reinforce_commnet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 2 --map saturn.FORightFixed_Heterogeneous --run_id 5.21 --n_steps 20000000" Enter
tmux new -d -s FORightFixed_Heterogeneous_reinforce_g2anet
tmux send-keys -t FORightFixed_Heterogeneous_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 2 --map saturn.FORightFixed_Heterogeneous --run_id 5.21 --n_steps 20000000" Enter
tmux new -d -s FORightFixed_Heterogeneous_qmix
tmux send-keys -t FORightFixed_Heterogeneous_qmix "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 2 --map saturn.FORightFixed_Heterogeneous --run_id 5.21 --n_steps 20000000" Enter
tmux new -d -s FORightFixed_Heterogeneous_maven
tmux send-keys -t FORightFixed_Heterogeneous_maven "cd ..; conda activate gym_graph; python main.py --alg=maven --device 4 --map saturn.FORightFixed_Heterogeneous --run_id 5.21 --n_steps 20000000" Enter
