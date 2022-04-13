#!/bin/bash
tmux new -d -s coma-5
tmux send-keys -t coma-5 "cd ..; conda activate lab-torch; python main.py --alg=coma --device 4 --map YellowEnv5_Atomic" Enter
tmux new -d -s iql-5
tmux send-keys -t iql-5 "cd ..; conda activate lab-torch; python main.py --alg=iql --device 4 --map YellowEnv5_Atomic" Enter
tmux new -d -s central_v-5
tmux send-keys -t central_v-5 "cd ..; conda activate lab-torch; python main.py --alg=central_v --device 5 --map YellowEnv5_Atomic" Enter
tmux new -d -s vdn-5
tmux send-keys -t vdn-5 "cd ..; conda activate lab-torch; python main.py --alg=vdn --device 5 --map YellowEnv5_Atomic" Enter
tmux new -d -s qmix-5
tmux send-keys -t qmix-5 "cd ..; conda activate lab-torch; python main.py --alg=qmix --device 6 --map YellowEnv5_Atomic" Enter
tmux new -d -s maven-5
tmux send-keys -t maven-5 "cd ..; conda activate lab-torch; python main.py --alg=maven --device 6 --map YellowEnv5_Atomic" Enter
tmux new -d -s reinforce-5
tmux send-keys -t reinforce-5 "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 6 --map YellowEnv5_Atomic" Enter
tmux new -d -s reinforce-g2anet-5
tmux send-keys -t reinforce-g2anet-5 "cd ..; conda activate lab-torch; python main.py --alg=reinforce+g2anet --device 7 --map YellowEnv5_Atomic" Enter
tmux new -d -s reinforce-commnet-5
tmux send-keys -t reinforce-commnet-5 "cd ..; conda activate lab-torch; python main.py --alg=reinforce+commnet --device 7 --map YellowEnv5_Atomic" Enter
