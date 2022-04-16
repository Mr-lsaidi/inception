FROM debian:buster-slim

RUN apt-get update
RUN apt-get install redis-server php-redis


RUN sed -i "s/# maxmemory <bytes>/maxmemory 256mb/g" /etc/redis.conf 
RUN sed -i "s/# maxmemory-policy noeviction/maxmemory-policy allkeys-lfu/g" /etc/redis.conf 