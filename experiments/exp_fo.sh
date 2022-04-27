#!/bin/bash
tmux new -d -s FON_A1D3
tmux send-keys -t FON_A1D3 "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 4 --map fully_observable.FON_A1D3 --run_id non_bc" Enter
tmux new -d -s FON_A3
tmux send-keys -t FON_A3 "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 5 --map fully_observable.FON_A3 --run_id non_bc" Enter
tmux new -d -s FON_A1D3_Transport
tmux send-keys -t FON_A1D3_Transport "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 6 --map fully_observable.FON_A1D3_Transport --run_id non_bc" Enter
tmux new -d -s FON_A3_Transport
tmux send-keys -t FON_A3_Transport "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 7 --map fully_observable.FON_A3_Transport --run_id non_bc" Enter
