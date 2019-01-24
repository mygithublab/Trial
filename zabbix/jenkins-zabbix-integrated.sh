#!/bin/bash

echo

docker run --name zabbix-appliance -t \
 -p 10051:10051 \
 -p 80:80 \
 -d --restart=always zabbix/zabbix-appliance:latest \

