#!/bin/bash
tmux new -d -s FON_A1D3
tmux send-keys -t FON_A1D3 "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 4 --map fully_observable.FON_A1D3 --run_id non_bc_3 --n_steps 10000000" Enter
tmux new -d -s FON_A3
tmux send-keys -t FON_A3 "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 4 --map fully_observable.FON_A3 --run_id non_bc_3 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport
tmux send-keys -t FON_A1D3_Transport "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 5 --map fully_observable.FON_A1D3_Transport --run_id non_bc_3 --n_steps 10000000" Enter
tmux new -d -s FON_A3_Transport
tmux send-keys -t FON_A3_Transport "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 5 --map fully_observable.FON_A3_Transport --run_id non_bc_3 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Random
tmux send-keys -t FON_A1D3_Random "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 6 --map fully_observable.FON_A1D3_Random --run_id non_bc_3 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport_Random
tmux send-keys -t FON_A1D3_Transport_Random "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 6 --map fully_observable.FON_A1D3_Transport_Random --run_id non_bc_3 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport
tmux send-keys -t FON_A1D3_Transport "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 6 --map fully_observable.FON_A1D3_Transport --run_id non_bc_3 --n_steps 10000000" Enter
tmux new -d -s FON_A3_Transport_Random
tmux send-keys -t FON_A3_Transport_Random "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 7 --map fully_observable.FON_A3_Transport_Random --run_id non_bc_3 --n_steps 10000000" Enter
tmux new -d -s FON_A4_Random
tmux send-keys -t FON_A4_Random "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 7 --map fully_observable.FON_A4_Random --run_id non_bc_3 --n_steps 10000000" Enter
tmux new -d -s FON_A4
tmux send-keys -t FON_A4 "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 7 --map fully_observable.FON_A4 --run_id non_bc_3 --n_steps 10000000" Enter
