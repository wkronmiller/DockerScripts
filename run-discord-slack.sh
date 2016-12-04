#!/bin/bash
docker pull wkronmiller/discord-slack
docker rm -f discord-slack
docker run --name discord-slack -d --link hn-redis:redis \
    -e DISCORD_CHANNEL_ID='135901657513852929' \
    -e DISCORD_TOKEN=$DISCORD_TOKEN \
    -e DISCORD_BOT_NAME='Rory' \
    -e SLACK_TOKEN=$SLACK_DISCORD_TOKEN \
    -e SLACK_HOOK_URL=$SLACK_URL \
    -e SLACK_CHANNEL_ID='C38LB145A' \
    -e SLACK_USER='U2MHZ4796' \
    wkronmiller/discord-slack
