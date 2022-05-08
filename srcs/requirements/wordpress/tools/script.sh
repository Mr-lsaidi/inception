#!/bin/bash

mkdir -p /www
cd /www && wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz

mv /wp-config.php /www/wordpress/


sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.3/fpm/pool.d/www.conf


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp


wp --path=/www/wordpress/ plugin install redis-cache --activate --allow-root
wp --path=/www/wordpress/ redis update-dropin --allow-root

service php7.3-fpm start
 
service php7.3-fpm stop 
/usr/sbin/php-fpm7.3 -F -R