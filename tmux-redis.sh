#!/bin/sh



tmux has-session -t servers 2>/dev/null
if [ $? != 0 ]
then
	tmux new -s redis -n servers -d
	tmux send-keys -t redis 'cd /tmp' C-m
	tmux send-keys -t redis 'redis-server --bind 0.0.0.0 --port 6500' C-m
	tmux split-window -v -tservers
	tmux split-window -v -tservers
	tmux send-keys -t redis:1.2 'cd /tmp' C-m
	tmux send-keys -t redis:1.2 'redis-server --bind 0.0.0.0 --port 6501' C-m
	tmux send-keys -t redis:1.3 'cd /tmp' C-m
	tmux send-keys -t redis:1.3 'redis-server --bind 0.0.0.0 --port 6502' C-m
	tmux select-layout -tservers main-horizontal
	tmux new-window -n sentinel -t redis
	tmux split-window -v -t sentinel
	tmux split-window -v -t sentinel
	tmux send-keys -t redis:2.1  'redis-server sentinel-1.conf --sentinel' C-m
	tmux send-keys -t redis:2.2  'redis-server sentinel-2.conf --sentinel' C-m
	tmux send-keys -t redis:2.3  'redis-server sentinel-3.conf --sentinel' C-m
	tmux select-layout -t sentinel main-horizontal
	tmux new-window -n console -t redis
	tmux split-window -v -t console
	tmux send-keys -t redis:3.1 'redis-cli -p 26379' C-m
	tmux select-pane -t redis:3.1
fi
tmux attach -t redis
