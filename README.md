sentinel-tutorial
=================

Sample code/scripts for the sentinel tutorial on redis.com


# Failover Script
The tutorial gives a very simple script to be called on failvoer actions. THis
script simply logs events to /tmp/failovers.log. To use it, edit the sentinel
config files to have the full path to it and fire up the sentinels.


# TMUX Usage
If you have Tmux installed, running the tmux-redis.sh script in this directory will:

1. Fire up three redis servers. They will be on port 6500, 6501, and 6502.
   These will be in the first window, named 'servers'

2. Fire up three redis-sentinel servers using the "sentinel-N.conf" config
   files. These will be in the second window, names 'sentinel'

3. Open a third window, named 'console', split it and open a redis-cli
   connection to the first sentinel, a console in the second pane.
