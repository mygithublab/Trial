#!/bin/bash

#To create the docker group and add your user
sudo groupadd docker
sudo usermod -aG docker $USER

#Configure Docker to start on boot
sudo systemctl enable docker

