From alpine:latest

COPY ./conf/nginx.conf ./tmp 
COPY ./conf/ssl/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt 
COPY ./conf/ssl/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key

RUN apk update && \
    apk add nginx curl openrc && \
    adduser -D -g 'www' www && \
    mkdir /www && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www

RUN mv tmp/nginx.conf /etc/nginx/nginx.conf

CMD [ "nginx",  "-g", "daemon off;" ]

