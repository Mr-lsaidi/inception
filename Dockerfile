From alpine:latest

COPY nginx.conf ./tmp
COPY index.html ./tmp
COPY setup_openrc.sh ./tmp
COPY run.sh ./tmp

RUN apk update && \
    apk add nginx curl openrc && \
    adduser -D -g 'www' www && \
    mkdir /www && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www && \
    mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig && \
    sh tmp/run.sh


RUN openrc
RUN ls -la /run/
RUN ls -la /run/openrc/
RUN touch /run/openrc/softlevel

cmd sh tmp/setup_openrc.sh
