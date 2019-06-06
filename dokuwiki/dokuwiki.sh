#!/bin/bash

#If you haven't done this before, create a new network for the application:

#docker network create dokuwiki-tier

#Run the dokuwiki in the contatiner:
docker run -d -p 10005:80 -p 443:443 --name dokuwiki \
  -e DOKUWIKI_USERNAME=dokuwiki \
  -e DOKUWIKI_FULL_NAME=superuser \
  -e DOKUWIKI_PASSWORD=cdcmcc \
  -e DOKUWIKI_EMAIL=mygithublab@126.com \
  -e DOKUWIKI_WIKI_NAME=CDC-WIKI \
  --net dokuwiki-tier \
  --volume /root/dokuwiki-persistence:/bitnami/dokuwiki \
  --restart=always \
  bitnami/dokuwiki:latest


#Take a snapshot of the appliction state

#rsync -a /root/dokuwiki-persistence /root/dokuwiki-persistence.bkp.$(date +%Y%m%d-%H.%M.%S)
