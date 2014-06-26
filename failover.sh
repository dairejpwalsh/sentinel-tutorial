#!/bin/bash


# We get from sentiel the following arguments:
# <master-name> <role> <state> <from-ip> <from-port> <to-ip> <to-port>
# Currently, state is always "failover" and role will be either observer
# or leader

PODNAME="$1"
ROLE="$2"
STATE="$3"
OLDIP="$4"
OLDPORT="$5"
NEWIP="$6"
NEWPORT="$7"

echo "[$PODNAME] Failover occured from $OLDIP:$OLDPORT to $NEWIP:$NEWPORT" >>/tmp/failovers.log
if [ "$ROLE" = "leader" ] ; then
  echo "[$PODNAME] As leader I should so something here" >>/tmp/failovers.log
fi
