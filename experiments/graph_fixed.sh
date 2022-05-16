#!/bin/bash
tmux new -d -s SaturnTopLeftFixed_reinforce
tmux send-keys -t SaturnTopLeftFixed_reinforce "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 2 --map saturn.SaturnTopLeftFixed --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeftFixed_vdn
tmux send-keys -t SaturnTopLeftFixed_vdn "cd ..; conda activate gym_graph; python main.py --alg=vdn --device 2 --map saturn.SaturnTopLeftFixed --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeftFixed_qmix
tmux send-keys -t SaturnTopLeftFixed_qmix "cd ..; conda activate gym_graph; python main.py --alg=qmix --device 2 --map saturn.SaturnTopLeftFixed --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeftFixed_qtran_base
tmux send-keys -t SaturnTopLeftFixed_qtran_base "cd ..; conda activate gym_graph; python main.py --alg=qtran_base --device 3 --map saturn.SaturnTopLeftFixed --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeftFixed_iql
tmux send-keys -t SaturnTopLeftFixed_iql "cd ..; conda activate gym_graph; python main.py --alg=iql --device 3 --map saturn.SaturnTopLeftFixed --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeftFixed_maven
tmux send-keys -t SaturnTopLeftFixed_maven "cd ..; conda activate gym_graph; python main.py --alg=maven --device 3 --map saturn.SaturnTopLeftFixed --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeftFixed_coma
tmux send-keys -t SaturnTopLeftFixed_coma "cd ..; conda activate gym_graph; python main.py --alg=coma --device 4 --map saturn.SaturnTopLeftFixed --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeftFixed_central_v
tmux send-keys -t SaturnTopLeftFixed_central_v "cd ..; conda activate gym_graph; python main.py --alg=central_v --device 4 --map saturn.SaturnTopLeftFixed --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeftFixed_reinforce_commnet
tmux send-keys -t SaturnTopLeftFixed_reinforce_commnet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 4 --map saturn.SaturnTopLeftFixed --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeftFixed_reinforce_g2anet
tmux send-keys -t SaturnTopLeftFixed_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 5 --map saturn.SaturnTopLeftFixed --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeftFixed_coma_commnet
tmux send-keys -t SaturnTopLeftFixed_coma_commnet "cd ..; conda activate gym_graph; python main.py --alg=coma+commnet --device 5 --map saturn.SaturnTopLeftFixed --run_id non_bc_5.15 --n_steps 10000000" Enter
tmux new -d -s SaturnTopLeftFixed_coma_g2anet
tmux send-keys -t SaturnTopLeftFixed_coma_g2anet "cd ..; conda activate gym_graph; python main.py --alg=coma+g2anet --device 5 --map saturn.SaturnTopLeftFixed --run_id non_bc_5.15 --n_steps 10000000" Enter
