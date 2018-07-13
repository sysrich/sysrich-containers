#!/bin/bash

echo "DEBUG: Keygen"
# TODO: Make keys persistant
/usr/sbin/sshd-gen-keys-start

echo "DEBUG: SSHD start"
/usr/sbin/sshd

# Wait 1 minute, then kill sshd as soon as no one is connected
echo "DEBUG: 30s sleep"
sleep 30s

echo "DEBUG: Login check"
until [ $(who | wc -l) = 0 ]; do
  :
done

echo "DEBUG: Kill sshd"
/sbin/killproc sshd