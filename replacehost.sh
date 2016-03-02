#!/usr/bin/env bash
COINPIT_INT_IP=$1
[ -z "$COINPIT_INT_IP" ] && echo usage: $0 COINPIT_INT_IP && exit 1
grep -v coinpitapp /etc/hosts > /tmp/hosts
echo "$COINPIT_INT_IP coinpitapp" >> /tmp/hosts
mv /tmp/hosts /etc/hosts
service nginx reload
