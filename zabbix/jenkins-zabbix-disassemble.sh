#!/bin/bash

echo 

#Start empty MySQL server instance

docker run --name mysql-server -t \
      --restart=always \
      -e MYSQL_DATABASE="zabbix" \
      -e MYSQL_USER="zabbix" \
      -e MYSQL_PASSWORD="zabbix_pwd" \
      -e MYSQL_ROOT_PASSWORD="root_pwd" \
      -d mysql:5.7 \
      --character-set-server=utf8 --collation-server=utf8_bin

#Start Zabbix Java gateway instance

docker run --name zabbix-java-gateway -t \
      --restart=always \
      -d zabbix/zabbix-java-gateway:latest

#Start Zabbix server instance and link the instance with created MySQL server instance

docker run --name zabbix-server-mysql -t \
      -e DB_SERVER_HOST="mysql-server" \
      -e MYSQL_DATABASE="zabbix" \
      -e MYSQL_USER="zabbix" \
      -e MYSQL_PASSWORD="zabbix_pwd" \
      -e MYSQL_ROOT_PASSWORD="root_pwd" \
      -e ZBX_JAVAGATEWAY="zabbix-java-gateway" \
      --link mysql-server:mysql \
      --link zabbix-java-gateway:zabbix-java-gateway \
      -p 10051:10051 \
      --restart=always \
      -d zabbix/zabbix-server-mysql:latest

#Start Zabbix web interface and link the instance with created MySQL server and Zabbix server instances

docker run --name zabbix-web-nginx-mysql -t \
      -e DB_SERVER_HOST="mysql-server" \
      -e MYSQL_DATABASE="zabbix" \
      -e MYSQL_USER="zabbix" \
      -e MYSQL_PASSWORD="zabbix_pwd" \
      -e MYSQL_ROOT_PASSWORD="root_pwd" \
      -e PHP_TZ="Asia/Shanghai" \
      --link mysql-server:mysql \
      --link zabbix-server-mysql:zabbix-server \
      -p 80:80 \
      --restart=always \
      -d zabbix/zabbix-web-nginx-mysql:latest

#Setup timezone to Shanghai

docker cp /usr/share/zoneinfo/Asia/Shanghai zabbix-server-mysql:/etc/localtime


#Start Zabbix agnet

docker run --name zabbix-agent --link zabbix-server-mysql:zabbix-server --privileged -d --restart=always zabbix/zabbix-agent:alpine-4.0-latest


