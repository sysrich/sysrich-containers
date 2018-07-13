#!/bin/bash

echo "DEBUG: Keygen"
# TODO: Make keys persistant
/usr/sbin/sshd-gen-keys-start

echo "DEBUG: pts check"
ls /dev/pts

echo "DEBUG: SSHD start"
/usr/sbin/sshd

echo "DEBUG: pts check"
ls /dev/pts

# Wait 1 minute, then kill sshd as soon as no one is connected
echo "DEBUG: 1m sleep"
sleep 1m

echo "DEBUG: Login check"
ls /dev/pts
until [ $(ls /dev/pts | wc -l) < 1 ]; do
  :
done

echo "DEBUG: Kill sshd"
/sbin/killproc sshd