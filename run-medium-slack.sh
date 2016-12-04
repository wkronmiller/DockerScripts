#!/bin/bash
source credentials.sh
docker pull wkronmiller/medium-slack
docker rm -f medium-slack
docker run --name medium-slack -d --link hn-redis:redis \
	-e SLACK_URL=$SLACK_URL \
	-e MEDIUM_TOKEN=$MEDIUM_TOKEN \
	-e MEDIUM_ID=$MEDIUM_ID \
	-e MEDIUM_SECRET=$MEDIUM_SECRET \
	wkronmiller/medium-slack
