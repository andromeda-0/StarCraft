#!/bin/bash
tmux new -d -s coma-f4
tmux send-keys -t coma-f4 "cd ..; conda activate lab-torch; python main.py --alg=coma --device 4 --map FYN_AK4" Enter
tmux new -d -s iql-f4
tmux send-keys -t iql-f4 "cd ..; conda activate lab-torch; python main.py --alg=iql --device 4 --map FYN_AK4" Enter
tmux new -d -s central_v-f4
tmux send-keys -t central_v-f4 "cd ..; conda activate lab-torch; python main.py --alg=central_v --device 5 --map FYN_AK4" Enter
tmux new -d -s vdn-f4
tmux send-keys -t vdn-f4 "cd ..; conda activate lab-torch; python main.py --alg=vdn --device 5 --map FYN_AK4" Enter
tmux new -d -s qmix-f4
tmux send-keys -t qmix-f4 "cd ..; conda activate lab-torch; python main.py --alg=qmix --device 6 --map FYN_AK4" Enter
tmux new -d -s maven-f4
tmux send-keys -t maven-f4 "cd ..; conda activate lab-torch; python main.py --alg=maven --device 6 --map FYN_AK4" Enter
tmux new -d -s reinforce-f4
tmux send-keys -t reinforce-f4 "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 6 --map FYN_AK4" Enter
tmux new -d -s reinforce-g2anet-f4
tmux send-keys -t reinforce-g2anet-f4 "cd ..; conda activate lab-torch; python main.py --alg=reinforce+g2anet --device 7 --map FYN_AK4" Enter
tmux new -d -s reinforce-commnet-f4
tmux send-keys -t reinforce-commnet-f4 "cd ..; conda activate lab-torch; python main.py --alg=reinforce+commnet --device 7 --map FYN_AK4" Enter
