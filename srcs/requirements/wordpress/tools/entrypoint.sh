#!/bin/sh

envsubst '$$DB_NAME $$DB_USER $$DB_PASSWORD $$DB_HOST' < /wp-config-tmp.php > /var/www/wp-config.php
