FROM nginx:latest   
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf 
COPY ./conf/ssl/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt 
COPY ./conf/ssl/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
CMD [ "nginx",  "-g", "daemon off;" ]