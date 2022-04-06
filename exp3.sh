#!/bin/bash
tmux new -d -s coma
tmux send-keys -t coma "conda activate lab-torch; python main.py --alg=coma --device 5 --map YellowEnv3" Enter
tmux new -d -s iql
tmux send-keys -t iql "conda activate lab-torch; python main.py --alg=iql --device 5 --map YellowEnv3" Enter
tmux new -d -s central_v
tmux send-keys -t central_v "conda activate lab-torch; python main.py --alg=central_v --device 6 --map YellowEnv3" Enter
tmux new -d -s vdn
tmux send-keys -t vdn "conda activate lab-torch; python main.py --alg=vdn --device 6 --map YellowEnv3" Enter
tmux new -d -s qmix
tmux send-keys -t qmix "conda activate lab-torch; python main.py --alg=qmix --device 7 --map YellowEnv3" Enter
tmux new -d -s maven
tmux send-keys -t maven "conda activate lab-torch; python main.py --alg=maven --device 7 --map YellowEnv3" Enter
