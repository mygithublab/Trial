#!/bin/bash

docker run -d -p 10005:80 -p 443:443 --name dokuwiki \
  -e DOKUWIKI_USERNAME=dokuwiki \
  -e DOKUWIKI_FULL_NAME=superuser \
  -e DOKUWIKI_PASSWORD=dokuwiki \
  -e DOKUWIKI_EMAIL=mygithublab@126.com \
  -e DOKUWIKI_WIKI_NAME=CDC-WIKI \
  --net dokuwiki-tier \
  --volume /path/to/dokuwiki-persistence:/bitnami/dokuwiki \
  --restart=always \
  bitnami/dokuwiki:latest
