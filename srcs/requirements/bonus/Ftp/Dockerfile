FROM alpine

RUN	apk update && apk upgrade && apk add --no-cache vsftpd

COPY ./conf/vsftpd.conf /
COPY ./tools/script.sh /
RUN	 chmod +x /script.sh

ENTRYPOINT ["/script.sh"]