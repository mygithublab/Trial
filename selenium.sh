#!/bin/bash

docker run -d --name selenium -p 10004:4444 -v /dev/shm:/dev/shm --restart=always selenium/standalone-chrome:3.141.59-oxygen
