From alpine:latest

COPY ./conf/nginx.conf ./tmp
COPY ./tools/index.html ./tmp
COPY ./tools/run.sh ./tmp

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

CMD [ "nginx",  "-g", "daemon off;" ]
