#!/bin/bash
tmux new -d -s SaturnTopLeftFixed600_reinforce
tmux send-keys -t SaturnTopLeftFixed600_reinforce "cd ..; conda activate gym_graph; python main.py --alg=reinforce --device 5 --map saturn.SaturnTopLeftFixed600 --run_id non_bc_5.18 --n_steps 20000000" Enter
tmux new -d -s SaturnTopLeftFixed600_coma
tmux send-keys -t SaturnTopLeftFixed600_coma "cd ..; conda activate gym_graph; python main.py --alg=coma --device 5 --map saturn.SaturnTopLeftFixed600 --run_id non_bc_5.18 --n_steps 20000000" Enter
tmux new -d -s SaturnTopLeftFixed600_reinforce_commnet
tmux send-keys -t SaturnTopLeftFixed600_reinforce_commnet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+commnet --device 5 --map saturn.SaturnTopLeftFixed600 --run_id non_bc_5.18 --n_steps 20000000" Enter
tmux new -d -s SaturnTopLeftFixed600_reinforce_g2anet
tmux send-keys -t SaturnTopLeftFixed600_reinforce_g2anet "cd ..; conda activate gym_graph; python main.py --alg=reinforce+g2anet --device 5 --map saturn.SaturnTopLeftFixed600 --run_id non_bc_5.18 --n_steps 20000000" Enter
tmux new -d -s SaturnTopLeftFixed600_coma_commnet
tmux send-keys -t SaturnTopLeftFixed600_coma_commnet "cd ..; conda activate gym_graph; python main.py --alg=coma+commnet --device 5 --map saturn.SaturnTopLeftFixed600 --run_id non_bc_5.18 --n_steps 20000000" Enter
tmux new -d -s SaturnTopLeftFixed600_coma_g2anet
tmux send-keys -t SaturnTopLeftFixed600_coma_g2anet "cd ..; conda activate gym_graph; python main.py --alg=coma+g2anet --device 5 --map saturn.SaturnTopLeftFixed600 --run_id non_bc_5.18 --n_steps 20000000" Enter
tmux new -d -s SaturnTopLeftFixed600_iql
tmux send-keys -t SaturnTopLeftFixed600_iql "cd ..; conda activate gym_graph; python main.py --alg=iql --device 5 --map saturn.SaturnTopLeftFixed600 --run_id non_bc_5.18 --n_steps 20000000" Enter
tmux new -d -s SaturnTopLeftFixed600_central_v
tmux send-keys -t SaturnTopLeftFixed600_central_v "cd ..; conda activate gym_graph; python main.py --alg=central_v --device 5 --map saturn.SaturnTopLeftFixed600 --run_id non_bc_5.18 --n_steps 20000000" Enter
