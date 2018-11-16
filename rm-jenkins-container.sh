#!/bin/bash

docker rm -f jenkins

docker rmi jenkins

userdel -r jenkins

rm -rf /home/jenkins
