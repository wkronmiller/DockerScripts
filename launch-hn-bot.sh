#!/bin/bash
source credentials.sh
docker pull wkronmiller/hn-slack
docker rm -f hn-slack
docker run -d --name hn-slack --link hn-redis:redis -e SLACK_URL=$SLACK_URL wkronmiller/hn-slack
