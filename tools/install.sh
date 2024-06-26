#!/bin/zsh

openssl version > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "OpenSSL is not installed. Installing OpenSSL..."

    if [ -x "$(command -v apt)" ]; then
        sudo apt update && sudo apt install -y openssl
        echo "OpenSSL has been installed successfully."
    else
        echo "Unsupported package manager. Please install OpenSSL manually."
        # exit 1
    fi
fi


if ! grep -q "127.0.0.1       $USER.42.fr" /etc/hosts; then
    echo "Setting domain name as $USER.42.fr..."
    echo "127.0.0.1       $USER.42.fr" | sudo tee -a /etc/hosts > /dev/null
fi


# export VOLUMES="/home/$USER/data"
# export CERTS="/home/$USER/certs"

echo 'export VOLUMES="/home/$USER/data"' >> ~/.zshrc
echo 'export CERTS="/home/$USER/certs"' >> ~/.zshrc

if [ ! -d $VOLUMES ]; then
    mkdir -p $VOLUMES/db $VOLUMES/wp
    sudo chmod 777 $VOLUMES
    echo "Created directories for volumes and certificates."
fi

if [ ! -d $CERTS ]; then
    mkdir -p $CERTS
    openssl req -x509 -newkey rsa:4096 -days 365 -nodes \
            -out $CERTS/$USER.crt \
            -keyout $CERTS/$USER.key \
            -subj "/C=IT/L=Firenze/O=42/OU=student/CN=$USER.42.fr"
fi

if [ $? -eq 0 ]; then
    echo "OpenSSL certificates available in $CERTS folder."
    echo "Volumes available in $VOLUMES folder."
else
    echo "OpenSSL command failed."
fi