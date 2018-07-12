#!/bin/bash

echo "DEBUG: Keygen"
# TODO: Make keys persistant
/usr/sbin/sshd-gen-keys-start

echo "DEBUG: SSHD start"
/usr/sbin/sshd -D

# Wait 1 minute, then kill sshd if no one connected
echo "DEBUG: 1m sleep"
sleep 1m

echo "DEBUG: Login check"
if [ $(who | wc -l) = 0 ]
  then /sbin/killproc sshd
fi
