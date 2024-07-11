#!/bin/sh

envsubst '$$DB_USER' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

exec nginx -g 'daemon off;'