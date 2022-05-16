#!/bin/bash
tmux new -d -s SaturnTopLeft_reinforce
tmux send-keys -t SaturnTopLeft_reinforce "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 2 --map saturn.SaturnTopLeft --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeft_vdn
tmux send-keys -t SaturnTopLeft_vdn "cd ..; conda activate gym_graph; python main.py --alg=vdn --device 2 --map saturn.SaturnTopLeft --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeft_qmix
tmux send-keys -t SaturnTopLeft_qmix "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 2 --map saturn.SaturnTopLeft --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeft_qtran_base
tmux send-keys -t SaturnTopLeft_qtran_base "cd ..; conda activate gym_graph; python main.py --alg=qtran_base --device 3 --map saturn.SaturnTopLeft --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeft_iql
tmux send-keys -t SaturnTopLeft_iql "cd ..; conda activate gym_graph; python main.py --alg=iql --device 3 --map saturn.SaturnTopLeft --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeft_maven
tmux send-keys -t SaturnTopLeft_maven "cd ..; conda activate gym_graph; python main.py --alg=maven --device 3 --map saturn.SaturnTopLeft --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeft_coma
tmux send-keys -t SaturnTopLeft_coma "cd ..; conda activate gym_graph; python main.py --alg=coma --device 4 --map saturn.SaturnTopLeft --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeft_central_v
tmux send-keys -t SaturnTopLeft_central_v "cd ..; conda activate gym_graph; python main.py --alg=central_v --device 4 --map saturn.SaturnTopLeft --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeft_reinforce_commnet
tmux send-keys -t SaturnTopLeft_reinforce_commnet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 4 --map saturn.SaturnTopLeft --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeft_reinforce_g2anet
tmux send-keys -t SaturnTopLeft_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 5 --map saturn.SaturnTopLeft --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeft_coma_commnet
tmux send-keys -t SaturnTopLeft_coma_commnet "cd ..; conda activate gym_graph; python main.py --alg=coma+commnet --device 5 --map saturn.SaturnTopLeft --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeft_coma_g2anet
tmux send-keys -t SaturnTopLeft_coma_g2anet "cd ..; conda activate gym_graph; python main.py --alg=coma+g2anet --device 5 --map saturn.SaturnTopLeft --run_id non_bc_5.15 --n_steps 10000000" Enter
