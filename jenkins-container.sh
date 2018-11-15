#!/bin/bash

useradd -U -u 1000 jenkins

docker run -itd --name jenkins -p 10001:8080 -p 10002:50000 -v /home/jenkins:/var/jenkins_home --restart=always jenkins:2.60.2


