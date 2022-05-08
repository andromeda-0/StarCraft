#!/bin/bash
tmux new -d -s FON_A1D3_Transport_Random_reinforce
tmux send-keys -t FON_A1D3_Transport_Random_reinforce "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 0 --map fully_observable.FON_A1D3_Transport_Random --run_id non_bc_5.7 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport_Random_vdn
tmux send-keys -t FON_A1D3_Transport_Random_vdn "cd ..; conda activate lab-torch; python main.py --alg=vdn --device 0 --map fully_observable.FON_A1D3_Transport_Random --run_id non_bc_5.7 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport_Random_qmix
tmux send-keys -t FON_A1D3_Transport_Random_qmix "cd ..; conda activate lab-torch; python main.py --alg=qmix --device 0 --map fully_observable.FON_A1D3_Transport_Random --run_id non_bc_5.7 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport_Random_qtran_base
tmux send-keys -t FON_A1D3_Transport_Random_qtran_base "cd ..; conda activate lab-torch; python main.py --alg=qtran_base --device 0 --map fully_observable.FON_A1D3_Transport_Random --run_id non_bc_5.7 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport_Random_iql
tmux send-keys -t FON_A1D3_Transport_Random_iql "cd ..; conda activate lab-torch; python main.py --alg=iql --device 0 --map fully_observable.FON_A1D3_Transport_Random --run_id non_bc_5.7 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport_Random_maven
tmux send-keys -t FON_A1D3_Transport_Random_maven "cd ..; conda activate lab-torch; python main.py --alg=maven --device 0 --map fully_observable.FON_A1D3_Transport_Random --run_id non_bc_5.7 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport_Random_coma
tmux send-keys -t FON_A1D3_Transport_Random_coma "cd ..; conda activate lab-torch; python main.py --alg=coma --device 0 --map fully_observable.FON_A1D3_Transport_Random --run_id non_bc_5.7 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport_Random_central_v
tmux send-keys -t FON_A1D3_Transport_Random_central_v "cd ..; conda activate lab-torch; python main.py --alg=central_v --device 0 --map fully_observable.FON_A1D3_Transport_Random --run_id non_bc_5.7 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport_Random_reinforce_commnet
tmux send-keys -t FON_A1D3_Transport_Random_reinforce_commnet "cd ..; conda activate lab-torch; python main.py --alg=reinforce+commnet --device 1 --map fully_observable.FON_A1D3_Transport_Random --run_id non_bc_5.7 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport_Random_reinforce_g2anet
tmux send-keys -t FON_A1D3_Transport_Random_reinforce_g2anet "cd ..; conda activate lab-torch; python main.py --alg=reinforce+g2anet --device 1 --map fully_observable.FON_A1D3_Transport_Random --run_id non_bc_5.7 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport_Random_coma_commnet
tmux send-keys -t FON_A1D3_Transport_Random_coma_commnet "cd ..; conda activate lab-torch; python main.py --alg=coma+commnet --device 1 --map fully_observable.FON_A1D3_Transport_Random --run_id non_bc_5.7 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport_Random_coma_g2anet
tmux send-keys -t FON_A1D3_Transport_Random_coma_g2anet "cd ..; conda activate lab-torch; python main.py --alg=coma+g2anet --device 1 --map fully_observable.FON_A1D3_Transport_Random --run_id non_bc_5.7 --n_steps 10000000" Enter
