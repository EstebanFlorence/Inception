#!/bin/sh

if [ ! -d /var/www/html/wp-admin ]; then

    # wp-config.php
    envsubst '$$DB_NAME $$DB_USER $$DB_PASSWORD $$DB_HOST' < /wp-config-tmp.php > /var/www/html/wp-config.php
    rm -f /wp-config-tmp.php

    # wp-cli
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    # WordPress
    cd /var/www/html
    wp core download
    # wp core install --dbhost=mariadb --title="${WP_TITLE}" --admin-user="${WP_ADMIN}" --admin-password="${WP_PASSWORD}" 

else
    echo "WordPress already installed."

fi