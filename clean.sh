#!/bin/zsh

# VOLUMES="/home/$USER/data"
# CERTS="/home/$USER/certs"

sudo rm -rf $VOLUMES $CERTS
unset VOLUMES CERTS

# Remove the entry from /etc/hosts
# Note: Use with caution. This command uses sudo.
sudo sed -i "/127.0.0.1       $USER.42.fr/d" /etc/hosts

echo "Directories and certificates removed. /etc/hosts entry deleted."