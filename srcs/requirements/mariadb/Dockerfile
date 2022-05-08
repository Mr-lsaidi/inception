FROM alpine:3.14.2

RUN apk update && apk add openrc mariadb mariadb-client 
RUN openrc && touch /run/openrc/softlevel

#copy the init database 
COPY ./conf/db.sql /

COPY ./tools/script.sh /
RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]