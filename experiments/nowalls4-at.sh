#!/bin/bash
tmux new -d -s coma-nw4
tmux send-keys -t coma-nw4 "cd ..; conda activate lab-torch; python main.py --alg=coma --device 4 --map NoWalls4_Atomic" Enter
tmux new -d -s iql-nw4
tmux send-keys -t iql-nw4 "cd ..; conda activate lab-torch; python main.py --alg=iql --device 4 --map NoWalls4_Atomic" Enter
tmux new -d -s central_v-nw4
tmux send-keys -t central_v-nw4 "cd ..; conda activate lab-torch; python main.py --alg=central_v --device 5 --map NoWalls4_Atomic" Enter
tmux new -d -s vdn-nw4
tmux send-keys -t vdn-nw4 "cd ..; conda activate lab-torch; python main.py --alg=vdn --device 5 --map NoWalls4_Atomic" Enter
tmux new -d -s qmix-nw4
tmux send-keys -t qmix-nw4 "cd ..; conda activate lab-torch; python main.py --alg=qmix --device 6 --map NoWalls4_Atomic" Enter
tmux new -d -s maven-nw4
tmux send-keys -t maven-nw4 "cd ..; conda activate lab-torch; python main.py --alg=maven --device 6 --map NoWalls4_Atomic" Enter
tmux new -d -s reinforce-nw4
tmux send-keys -t reinforce-nw4 "cd ..; conda activate lab-torch; python main.py --alg=reinforce --device 6 --map NoWalls4_Atomic" Enter
tmux new -d -s reinforce-g2anet-nw4
tmux send-keys -t reinforce-g2anet-nw4 "cd ..; conda activate lab-torch; python main.py --alg=reinforce+g2anet --device 7 --map NoWalls4_Atomic" Enter
tmux new -d -s reinforce-commnet-nw4
tmux send-keys -t reinforce-commnet-nw4 "cd ..; conda activate lab-torch; python main.py --alg=reinforce+commnet --device 7 --map NoWalls4_Atomic" Enter
