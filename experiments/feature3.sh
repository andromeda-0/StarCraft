#!/bin/bash
tmux new -d -s coma-f3
tmux send-keys -t coma-f3 "cd ..; conda activate lab-torch; python main.py --alg=coma --device 4 --map FYN_AK3" Enter
tmux new -d -s iql-f3
tmux send-keys -t iql-f3 "cd ..; conda activate lab-torch; python main.py --alg=iql --device 4 --map FYN_AK3" Enter
tmux new -d -s central_v-f3
tmux send-keys -t central_v-f3 "cd ..; conda activate lab-torch; python main.py --alg=central_v --device 5 --map FYN_AK3" Enter
tmux new -d -s vdn-f3
tmux send-keys -t vdn-f3 "cd ..; conda activate lab-torch; python main.py --alg=vdn --device 5 --map FYN_AK3" Enter
tmux new -d -s qmix-f3
tmux send-keys -t qmix-f3 "cd ..; conda activate lab-torch; python main.py --alg=qmix --device 6 --map FYN_AK3" Enter
tmux new -d -s maven-f3
tmux send-keys -t maven-f3 "cd ..; conda activate lab-torch; python main.py --alg=maven --device 6 --map FYN_AK3" Enter
tmux new -d -s reinforce-f3
tmux send-keys -t reinforce-f3 "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 7 --map FYN_AK3" Enter
tmux new -d -s reinforce-g2anet-f3
tmux send-keys -t reinforce-g2anet-f3 "cd ..; conda activate lab-torch; python main.py --alg=reinforce+g2anet --device 7 --map FYN_AK3" Enter
tmux new -d -s reinforce-commnet-f3
tmux send-keys -t reinforce-commnet-f3 "cd ..; conda activate lab-torch; python main.py --alg=reinforce+commnet --device 7 --map FYN_AK3" Enter
