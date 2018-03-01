#!/bin/bash

docker network create exnet2

docker create -v /var/lib/mysql -v /var/www/html --network exnet2 --name datacontainer jackyalt/datacontainer-wp-db 

docker run -d -p 8080:80 --volumes-from datacontainer --network exnet2 --name apache jackyalt/httpd-php

docker run --name db -p 3306:3306 -d -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE1=wordpress -e MYSQL_USER1=wpress -e MYSQL_PASSWORD1=wpress --network exnet2 --volumes-from datacontainer orboan/dcsss-mariadb

