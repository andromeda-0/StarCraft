#!/bin/bash
tmux new -d -s FON_A1D3_Random_reinforce
tmux send-keys -t FON_A1D3_Random_reinforce "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 6 --map fully_observable.FON_A1D3_Random --run_id non_bc_5.7 --n_steps 10000000" Enter
tmux new -d -s FON_A1D3_Transport_Random_reinforce
tmux send-keys -t FON_A1D3_Transport_Random_reinforce "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 6 --map fully_observable.FON_A1D3_Transport_Random --run_id non_bc_5.7 --n_steps 10000000" Enter
