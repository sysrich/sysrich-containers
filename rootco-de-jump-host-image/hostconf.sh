#!/bin/bash

# Host configuration script for jump-host, to be run on jump host

mkdir -p /usr/local/jump-host/etc/ssh

cat >/usr/local/jump-host/etc/ssh/sshd_config <<EOL
Port 8282
PermitRootLogin no
AuthorizedKeysFile	.ssh/authorized_keys
PasswordAuthentication no
ChallengeResponseAuthentication no
UsePAM yes
X11Forwarding yes
Subsystem	sftp	/usr/lib/ssh/sftp-server
AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES
AcceptEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT
AcceptEnv LC_IDENTIFICATION LC_ALL
EOL

ssh-keygen -A -f /usr/local/jump-host/

echo "Container prep made, run using podman run -p 8282:8282 --hostname jump-host --name jump-host -v /usr/local/jump-host/etc/ssh:/etc/ssh:ro registry.opensuse.org/home/rbrownsuse/containers/container/rootco-de/jump-host:current"