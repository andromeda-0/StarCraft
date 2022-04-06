#!/bin/bash
tmux new -d -s coma-3
tmux send-keys -t coma-3 "conda activate lab-torch; python main.py --alg=coma --device 5 --map YellowEnv3" Enter
tmux new -d -s iql-3
tmux send-keys -t iql-3 "conda activate lab-torch; python main.py --alg=iql --device 5 --map YellowEnv3" Enter
tmux new -d -s central_v-3
tmux send-keys -t central_v-3 "conda activate lab-torch; python main.py --alg=central_v --device 6 --map YellowEnv3" Enter
tmux new -d -s vdn-3
tmux send-keys -t vdn-3 "conda activate lab-torch; python main.py --alg=vdn --device 6 --map YellowEnv3" Enter
tmux new -d -s qmix-3
tmux send-keys -t qmix-3 "conda activate lab-torch; python main.py --alg=qmix --device 7 --map YellowEnv3" Enter
tmux new -d -s maven-3
tmux send-keys -t maven-3 "conda activate lab-torch; python main.py --alg=maven --device 7 --map YellowEnv3" Enter
