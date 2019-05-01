#!/bin/bash

echo

useradd -U -u 1000 jenkins

docker run -itd --name jenkins -p 10001:8080 -p 10002:50000 -v /home/jenkins:/var/jenkins_home --restart=always jenkins/jenkins:lts
