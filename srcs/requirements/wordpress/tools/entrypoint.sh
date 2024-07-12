#!/bin/sh

# wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

if [ ! -d /var/www/html/wp-admin ]; then

    # wp-config.php
    envsubst '$$WP_DB_NAME $$WP_DB_USER $$WP_DB_PASS $$DB_HOST $$REDIS_PASS' < /wp-config-tmp.php > /var/www/html/wp-config.php

    # WordPress
    cd /var/www/html
    wp core download
    wp core install --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_ADMIN_PASS}" --admin_email="${WP_EMAIL}"
    wp user create "${WP_DB_USER}" user@wordpress.it --role=author --user_pass="${WP_USER_PASS}"

    # wp theme install astra --activate

    wp plugin install redis-cache --activate
    wp redis enable

    # addgroup wordpress
    # chown -R :wordpress /var/www/html

fi

sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' /etc/php83/php-fpm.d/www.conf
rm -f /wp-config-tmp.php

exec php-fpm83 --nodaemonize
