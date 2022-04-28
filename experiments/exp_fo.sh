#!/bin/bash
tmux new -d -s FON_A1D3_1e-4
tmux send-keys -t FON_A1D3_1e-4 "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 6 --map fully_observable.FON_A1D3 --run_id non_bc_2 --n_steps 10000000" Enter
tmux new -d -s FON_A3_1e-4
tmux send-keys -t FON_A3_1e-4 "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 7 --map fully_observable.FON_A3 --run_id non_bc_2 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport_1e-4
tmux send-keys -t FON_A1D3_Transport_1e-4 "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 6 --map fully_observable.FON_A1D3_Transport --run_id non_bc_2 --n_steps 10000000" Enter
tmux new -d -s FON_A3_Transport_1e-4
tmux send-keys -t FON_A3_Transport_1e-4 "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 7 --map fully_observable.FON_A3_Transport --run_id non_bc_2 --n_steps 10000000" Enter
