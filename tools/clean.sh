#!/bin/zsh

# VOLUMES="/home/$USER/data"
# CERTS="/home/$USER/certs"
# unset VOLUMES CERTS

sed -i '/export VOLUMES="/home\/$USER\/data"/d' ~/.zshrc
sed -i '/export CERTS="/home\/$USER\/certs"/d' ~/.zshrc
sudo rm -rf $VOLUMES $CERTS

sudo sed -i "/127.0.0.1       $USER.42.fr/d" /etc/hosts

echo "Directories and certificates removed."
echo "/etc/hosts entry deleted."