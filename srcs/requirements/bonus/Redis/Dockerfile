FROM alpine:latest

# Update and Onstall dependencies
RUN apk --update add redis


RUN sed -i "s/# maxmemory <bytes>/maxmemory 256mb/g" /etc/redis.conf 
RUN sed -i "s/# maxmemory-policy noeviction/maxmemory-policy allkeys-lfu/g" /etc/redis.conf 

COPY ./tools/script.sh /
RUN chmod +x /script.sh
ENTRYPOINT ["/script.sh"]