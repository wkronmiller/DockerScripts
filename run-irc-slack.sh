#!/bin/bash
source credentials.sh
docker pull wkronmiller/irc-slack
docker rm -f irc-slack
docker run --name irc-slack -d \
    -e SLACK_ADMIN_TOKEN=$SLACK_ADMIN_TOKEN \
    -e SLACK_BOT_TOKEN=$SLACK_IRC_BOT_TOKEN \
    -e IRC_NICK='rory' \
    -e IRC_SERVER='irc.rpis.ec' \
    wkronmiller/irc-slack
