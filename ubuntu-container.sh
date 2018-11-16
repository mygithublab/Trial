#!/bin/bash

docker run -itd --name ubuntu_jenkins -p 10010:8080 -p 10011:50000 -p 10012:22 --restart=always ubuntu
