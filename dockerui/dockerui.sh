#!/bin/bash


docker run -d --name dockerui -p 10003:80 --privileged -v /root/git/Trial/dockerui/htpasswd:/app/.htpasswd  -v /var/run/docker.sock:/var/run/docker.sock --restart=always rediceli/dockerui
