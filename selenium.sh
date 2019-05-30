#!/bin/bash

docker run -d -p 4444:4444 -v /dev/shm:/dev/shm --restart=always selenium/standalone-chrome:3.141.59-oxygen
