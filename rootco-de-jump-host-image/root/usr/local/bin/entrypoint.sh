#!/bin/bash

echo "$(date -Iseconds). container START"
echo "$(date -Iseconds). sshd-gen-keys-start"
/usr/sbin/sshd-gen-keys-start

echo "$(date -Iseconds). sshd START"
/usr/sbin/sshd

# Wait 15 seconds, then kill sshd as soon as no one is connected
echo "$(date -Iseconds). 15s wait for initial login"
sleep 15s

echo "$(date -Iseconds). login monitor"
until [ $(who | wc -l) = 0 ]; do
  :
done

echo "$(date -Iseconds). no users logged in, kill sshd"
/sbin/killproc sshd

echo "$(date -Iseconds). container END"