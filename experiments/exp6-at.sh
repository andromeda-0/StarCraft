#!/bin/bash
tmux new -d -s coma-6
tmux send-keys -t coma-6 "cd ..; conda activate lab-torch; python main.py --alg=coma --device 4 --map YellowEnv6_Atomic_Single" Enter
tmux new -d -s iql-6
tmux send-keys -t iql-6 "cd ..; conda activate lab-torch; python main.py --alg=iql --device 4 --map YellowEnv6_Atomic_Single" Enter
tmux new -d -s central_v-6
tmux send-keys -t central_v-6 "cd ..; conda activate lab-torch; python main.py --alg=central_v --device 5 --map YellowEnv6_Atomic_Single" Enter
tmux new -d -s vdn-6
tmux send-keys -t vdn-6 "cd ..; conda activate lab-torch; python main.py --alg=vdn --device 5 --map YellowEnv6_Atomic_Single" Enter
tmux new -d -s qmix-6
tmux send-keys -t qmix-6 "cd ..; conda activate lab-torch; python main.py --alg=qmix --device 6 --map YellowEnv6_Atomic_Single" Enter
tmux new -d -s maven-6
tmux send-keys -t maven-6 "cd ..; conda activate lab-torch; python main.py --alg=maven --device 6 --map YellowEnv6_Atomic_Single" Enter
tmux new -d -s reinforce-6
tmux send-keys -t reinforce-6 "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 7 --map YellowEnv6_Atomic_Single" Enter
tmux new -d -s reinforce-g2anet-6
tmux send-keys -t reinforce-g2anet-6 "cd ..; conda activate lab-torch; python main.py --alg=reinforce+g2anet --device 7 --map YellowEnv6_Atomic_Single" Enter
tmux new -d -s reinforce-commnet-6
tmux send-keys -t reinforce-commnet-6 "cd ..; conda activate lab-torch; python main.py --alg=reinforce+commnet --device 7 --map YellowEnv6_Atomic_Single" Enter
