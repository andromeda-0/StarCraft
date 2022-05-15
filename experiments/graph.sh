#!/bin/bash
tmux new -d -s SaturnRight_reinforce
tmux send-keys -t SaturnRight_reinforce "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 4 --map saturn.SaturnRight --run_id non_bc_5.14 --n_steps 10000000" Enter
tmux new -d -s SaturnRight_vdn
tmux send-keys -t SaturnRight_vdn "cd ..; conda activate gym_graph; python main.py --alg=vdn --device 4 --map saturn.SaturnRight --run_id non_bc_5.14 --n_steps 10000000" Enter
tmux new -d -s SaturnRight_qmix
tmux send-keys -t SaturnRight_qmix "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 4 --map saturn.SaturnRight --run_id non_bc_5.14 --n_steps 10000000" Enter
tmux new -d -s SaturnRight_qtran_base
tmux send-keys -t SaturnRight_qtran_base "cd ..; conda activate gym_graph; python main.py --alg=qtran_base --device 5 --map saturn.SaturnRight --run_id non_bc_5.14 --n_steps 10000000" Enter
tmux new -d -s SaturnRight_iql
tmux send-keys -t SaturnRight_iql "cd ..; conda activate gym_graph; python main.py --alg=iql --device 5 --map saturn.SaturnRight --run_id non_bc_5.14 --n_steps 10000000" Enter
tmux new -d -s SaturnRight_maven
tmux send-keys -t SaturnRight_maven "cd ..; conda activate gym_graph; python main.py --alg=maven --device 5 --map saturn.SaturnRight --run_id non_bc_5.14 --n_steps 10000000" Enter
tmux new -d -s SaturnRight_coma
tmux send-keys -t SaturnRight_coma "cd ..; conda activate gym_graph; python main.py --alg=coma --device 6 --map saturn.SaturnRight --run_id non_bc_5.14 --n_steps 10000000" Enter
tmux new -d -s SaturnRight_central_v
tmux send-keys -t SaturnRight_central_v "cd ..; conda activate gym_graph; python main.py --alg=central_v --device 6 --map saturn.SaturnRight --run_id non_bc_5.14 --n_steps 10000000" Enter
tmux new -d -s SaturnRight_reinforce_commnet
tmux send-keys -t SaturnRight_reinforce_commnet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 6 --map saturn.SaturnRight --run_id non_bc_5.14 --n_steps 10000000" Enter
tmux new -d -s SaturnRight_reinforce_g2anet
tmux send-keys -t SaturnRight_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 7 --map saturn.SaturnRight --run_id non_bc_5.14 --n_steps 10000000" Enter
tmux new -d -s SaturnRight_coma_commnet
tmux send-keys -t SaturnRight_coma_commnet "cd ..; conda activate gym_graph; python main.py --alg=coma+commnet --device 7 --map saturn.SaturnRight --run_id non_bc_5.14 --n_steps 10000000" Enter
tmux new -d -s SaturnRight_coma_g2anet
tmux send-keys -t SaturnRight_coma_g2anet "cd ..; conda activate gym_graph; python main.py --alg=coma+g2anet --device 7 --map saturn.SaturnRight --run_id non_bc_5.14 --n_steps 10000000" Enter
