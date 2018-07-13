#!/bin/bash

echo "DEBUG: Keygen"
# TODO: Make keys persistant
/usr/sbin/sshd-gen-keys-start

echo "DEBUG: Trigger monitor"
/usr/local/bin/monitor.sh &

echo "DEBUG: SSHD start"
/usr/sbin/sshd

# Wait 1 minute, then kill sshd as soon as no one is connected
echo "DEBUG: 1m sleep"
sleep 1m

echo "DEBUG: Login check"
until [ $(who | wc -l) = 0 ]; do
  :
done

echo "DEBUG: Kill sshd"
/sbin/killproc sshd