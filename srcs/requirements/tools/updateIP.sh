#!/bin/sh

IP=`hostname -I | awk '{print $1}'`

sed -i "s/<<IP>>/https:\/\/$IP/g" ./srcs/requirements/mariadb/conf/db.sql 