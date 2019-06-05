#!/bin/bash

docker run -itd --name jenkins -p 10001:8080 -p 50000:50000 --restart=always jenkins/jenkins:lts
