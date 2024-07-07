#!/bin/sh

# Use envsubst to replace environment variables in the nginx.conf.template
envsubst '$$DB_USER' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Start Nginx in the foreground
exec nginx -g 'daemon off;'