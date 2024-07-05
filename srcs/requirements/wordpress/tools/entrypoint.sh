#!/bin/sh

if [ -d /var/www/html ]; then

    envsubst '$$DB_NAME $$DB_USER $$DB_PASSWORD $$DB_HOST' < /wp-config-tmp.php > /var/www/html/wp-config.php

    if [ $? -eq 0 ]; then
        rm -f /wp-config-tmp.php
    else
        echo "envsubst for wp-config.php failed."
        exit 1
    fi

    echo "Installing wp-cli..."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    echo "Installing WordPress..."
    cd /var/www/html
    wp core download
    # wp core install --url=https://localhost --title="${WP_TITLE}" --admin-user="${WP_ADMIN}" --admin-password="${WP_PASSWORD}"

else
    echo "/var/www/html not found."

fi