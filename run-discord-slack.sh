#!/bin/bash
source credentials.sh
docker pull wkronmiller/discord-slack
docker rm -f discord-slack
docker run --name discord-slack -d \
    -e DISCORD_TOKEN=$DISCORD_TOKEN \
    -e SLACK_ADMIN_TOKEN=$SLACK_ADMIN_TOKEN \
    -e SLACK_BOT_TOKEN=$SLACK_DISCORD_TOKEN \
    wkronmiller/discord-slack
