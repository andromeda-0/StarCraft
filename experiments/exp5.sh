#!/bin/bash
tmux new -d -s coma
tmux send-keys -t coma "cd ..; conda activate lab-torch; python main.py --alg=coma --device 4 --map YellowEnv5" Enter
tmux new -d -s iql
tmux send-keys -t iql "cd ..; conda activate lab-torch; python main.py --alg=iql --device 4 --map YellowEnv5" Enter
tmux new -d -s central_v
tmux send-keys -t central_v "cd ..; conda activate lab-torch; python main.py --alg=central_v --device 5 --map YellowEnv5" Enter
tmux new -d -s vdn
tmux send-keys -t vdn "cd ..; conda activate lab-torch; python main.py --alg=vdn --device 5 --map YellowEnv5" Enter
tmux new -d -s qmix
tmux send-keys -t qmix "cd ..; conda activate lab-torch; python main.py --alg=qmix --device 6 --map YellowEnv5" Enter
tmux new -d -s maven
tmux send-keys -t maven "cd ..; conda activate lab-torch; python main.py --alg=maven --device 6 --map YellowEnv5" Enter
tmux new -d -s reinforce
tmux send-keys -t reinforce "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 6 --map YellowEnv5" Enter
tmux new -d -s reinforce-g2anet
tmux send-keys -t reinforce-g2anet "cd ..; conda activate lab-torch; python main.py --alg=reinforce+g2anet --device 7 --map YellowEnv5" Enter
tmux new -d -s reinforce-commnet
tmux send-keys -t reinforce-commnet "cd ..; conda activate lab-torch; python main.py --alg=reinforce+commnet --device 7 --map YellowEnv5" Enter
