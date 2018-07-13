#!/bin/bash

echo "container START"

echo "sshd START"
/usr/sbin/sshd -i

# Wait 15 seconds, then kill sshd as soon as no one is connected
echo "15s wait for initial login"
sleep 15s

echo "login monitor"
until [ $(who | wc -l) = 0 ]; do
  :
done

echo "no users logged in, kill sshd"
/sbin/killproc sshd

echo "container END"