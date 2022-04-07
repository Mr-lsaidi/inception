FROM alpine:latest

RUN apk update
RUN apk add lighttpd php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo \
    php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml openrc


COPY ./conf/lighttpd.conf /etc/lighttpd/lighttpd.conf
RUN openrc
RUN ls -la /run/
RUN ls -la /run/openrc/
RUN touch /run/openrc/softlevel
CMD openrc && rc-service lighttpd start && rc-update add lighttpd default
