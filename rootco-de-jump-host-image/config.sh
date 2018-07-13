#!/bin/bash

#======================================
# Functions...
#--------------------------------------
test -f /.kconfig && . /.kconfig
test -f /.profile && . /.profile

#======================================
# Greeting...
#--------------------------------------
echo "Configure image: [$kiwi_iname]..."

#======================================
# Fix user permissions
#--------------------------------------
baseSetupUserPermissions

#======================================
# Fix utmp
#--------------------------------------
touch /var/run/utmp
chgrp -v utmp /var/run/utmp
chmod -v 664 /var/run/utmp

exit 0
