#!/bin/bash
tmux new -d -s coma-nw3
tmux send-keys -t coma-nw3 "cd ..; conda activate lab-torch; python main.py --alg=coma --device 4 --map FYN_AK3" Enter
tmux new -d -s iql-nw3
tmux send-keys -t iql-nw3 "cd ..; conda activate lab-torch; python main.py --alg=iql --device 4 --map FYN_AK3" Enter
tmux new -d -s central_v-nw3
tmux send-keys -t central_v-nw3 "cd ..; conda activate lab-torch; python main.py --alg=central_v --device 5 --map FYN_AK3" Enter
tmux new -d -s vdn-nw3
tmux send-keys -t vdn-nw3 "cd ..; conda activate lab-torch; python main.py --alg=vdn --device 5 --map FYN_AK3" Enter
tmux new -d -s qmix-nw3
tmux send-keys -t qmix-nw3 "cd ..; conda activate lab-torch; python main.py --alg=qmix --device 6 --map FYN_AK3" Enter
tmux new -d -s maven-nw3
tmux send-keys -t maven-nw3 "cd ..; conda activate lab-torch; python main.py --alg=maven --device 6 --map FYN_AK3" Enter
tmux new -d -s reinforce-nw3
tmux send-keys -t reinforce-nw3 "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 7 --map FYN_AK3" Enter
tmux new -d -s reinforce-g2anet-nw3
tmux send-keys -t reinforce-g2anet-nw3 "cd ..; conda activate lab-torch; python main.py --alg=reinforce+g2anet --device 7 --map FYN_AK3" Enter
tmux new -d -s reinforce-commnet-nw3
tmux send-keys -t reinforce-commnet-nw3 "cd ..; conda activate lab-torch; python main.py --alg=reinforce+commnet --device 7 --map FYN_AK3" Enter
