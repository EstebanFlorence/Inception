#!/bin/sh

# sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis.conf
sed -i "s|bind 127.0.0.1|bind 10.0.0.4|g" /etc/redis.conf
sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis.conf
sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis.conf
sed -i "s|# requirepass foobared|requirepass ${REDIS_PASS}|g" /etc/redis.conf

exec redis-server /etc/redis.conf
