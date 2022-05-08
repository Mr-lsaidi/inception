#!/bin/sh

sed -i "s|.*bind 127.0.0.1 -::1.*|#bind 127.0.0.1 -::1|g" /etc/redis.conf
exec redis-server --maxmemory 256mb --maxmemory-policy allkeys-lru --protected-mode no