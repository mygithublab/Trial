#!/bin/bash

docker run -d --name=grafana -p 10002:3000 --restart=always  grafana/grafana
