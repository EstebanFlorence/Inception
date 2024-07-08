#!/bin/sh

if [ ! -d /var/www/html/wp-admin ]; then

    # wp-config.php
    envsubst '$$WP_DB_NAME $$DB_USER $$DB_PASSWORD $$DB_HOST' < /wp-config-tmp.php > /var/www/html/wp-config.php
    rm -f /wp-config-tmp.php

    sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' /etc/php83/php-fpm.d/www.conf

    # wp-cli
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    # WordPress
    cd /var/www/html
    wp core download
    wp core install --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin-user="${WP_ADMIN}" --admin-password="${WP_PASSWORD}" --admin_email="${WP_EMAIL}"

fi

exec php-fpm83 --nodaemonize
