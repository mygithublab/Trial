#!/bin/bash

echo

#Start empty PostgreSQL server instance

docker run --name postgres-server -t \
      -e POSTGRES_USER="zabbix" \
      -e POSTGRES_PASSWORD="zabbix" \
      -e POSTGRES_DB="zabbix_pwd" \
      --restart=always \
      -d postgres:latest

#Start Zabbix snmptraps instance

docker run --name zabbix-snmptraps -t \
      -v /zbx_instance/snmptraps:/var/lib/zabbix/snmptraps:rw \
      -v /var/lib/zabbix/mibs:/usr/share/snmp/mibs:ro \
      -p 162:162/udp \
      --restart=always \
      -d zabbix/zabbix-snmptraps:latest

#Start Zabbix server instance and link the instance with created PostgreSQL server instance

docker run --name zabbix-server-pgsql -t \
      -e DB_SERVER_HOST="postgres-server" \
      -e POSTGRES_USER="zabbix" \
      -e POSTGRES_PASSWORD="zabbix" \
      -e POSTGRES_DB="zabbix_pwd" \
      -e ZBX_ENABLE_SNMP_TRAPS="true" \
      --link postgres-server:postgres \
      -p 10051:10051 \
      --volumes-from zabbix-snmptraps \
      --restart=always \
      -d zabbix/zabbix-server-pgsql:latest

#Start Zabbix web interface and link the instance with created PostgreSQL server and Zabbix server instances

docker run --name zabbix-web-nginx-pgsql -t \
      -e DB_SERVER_HOST="postgres-server" \
      -e POSTGRES_USER="zabbix" \
      -e POSTGRES_PASSWORD="zabbix" \
      -e POSTGRES_DB="zabbix_pwd" \
      --link postgres-server:postgres \
      --link zabbix-server-pgsql:zabbix-server \
      -p 443:443 \
      -v /etc/ssl/nginx:/etc/ssl/nginx:ro \
      --restart=always \
      -d zabbix/zabbix-web-nginx-pgsql:latest



