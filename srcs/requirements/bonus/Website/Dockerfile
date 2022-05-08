FROM alpine

RUN apk update 
RUN apk add apache2

# change the listener PORT of the apache2 server
RUN sed -i 's/Listen 80/Listen 8080/g' /etc/apache2/httpd.conf
# change the ServerName of the apache2 server
RUN sed -i 's/#ServerName www.example.com:80/ServerName 127.0.0.1/g' /etc/apache2/httpd.conf
# change in the defualt html
RUN sed -i "s/It works!/Hello it' lsaidi my webserver works!/g" var/www/localhost/htdocs/index.html

ENTRYPOINT ["/usr/sbin/httpd" ,"-D", "FOREGROUND", "-f", "/etc/apache2/httpd.conf"]