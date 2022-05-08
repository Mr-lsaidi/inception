FROM debian:buster

RUN apt-get update 
RUN apt-get install -y curl wget unzip ftp php php-cli php-fpm php-common php-json php-mysql \
php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath php-redis

COPY ./conf/wp-config.php /

COPY ./tools/script.sh /
RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]
