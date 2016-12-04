#!/bin/bash
source credentials.sh
docker pull wkronmiller/rss-slack
docker rm -f rss-slack-ieee
docker run --name rss-slack-ieee -d --link hn-redis:redis \
    -e SLACK_CHANNEL='ieee-spectrum' \
    -e SLACK_URL=$SLACK_URL \
    -e RSS_URLS='http://spectrum.ieee.org/rss/telecom/fulltext,http://spectrum.ieee.org/rss/robotics/fulltext,http://spectrum.ieee.org/rss/aerospace/fulltext' \
    -e RSS_FEED_NAMES='IEEE-Telecoms,IEEE-Robotics,IEEE-Aerospace' \
    wkronmiller/rss-slack
docker rm -f rss-slack-slate
docker run --name rss-slack-slate -d --link hn-redis:redis \
    -e SLACK_CHANNEL='slate-magazine' \
    -e SLACK_URL=$SLACK_URL \
    -e RSS_URLS='http://feeds.slate.com/slate' \
    -e RSS_FEED_NAMES='Slate Main' \
    wkronmiller/rss-slack
docker rm -f rss-slack-qz
docker run --name rss-slack-qz -d --link hn-redis:redis \
    -e SLACK_CHANNEL='quartz-rss' \
    -e SLACK_URL=$SLACK_URL \
    -e RSS_URLS='http://qz.com/feed/' \
    -e RSS_FEED_NAMES='Quartz Main' \
    wkronmiller/rss-slack
docker rm -f rss-slack-congress
docker run --name rss-slack-congress -d --link hn-redis:redis \
    -e SLACK_CHANNEL='congress' \
    -e SLACK_URL=$SLACK_URL \
    -e RSS_URLS='https://www.congress.gov/rss/house-floor-today.xml,https://www.congress.gov/rss/senate-floor-today.xml,https://www.congress.gov/rss/presented-to-president.xml' \
    -e RSS_FEED_NAMES='House Floor,Senate Floor,Bills to President' \
    wkronmiller/rss-slack
docker rm -f rss-slack-techcrunch
docker run --name rss-slack-techcrunch -d --link hn-redis:redis \
    -e SLACK_CHANNEL='techcrunch' \
    -e SLACK_URL=$SLACK_URL \
    -e RSS_URLS='http://feeds.feedburner.com/TechCrunch/startups,http://feeds.feedburner.com/TechCrunchIT,http://feeds.feedburner.com/TechCrunch/Amazon,http://feeds.feedburner.com/TechCrunch/Google,http://feeds.feedburner.com/TechCrunch/Facebook' \
    -e RSS_FEED_NAMES='TC Startups,TC IT and Enterprise,TC Amazon,TC Google,TC Facebook' \
    wkronmiller/rss-slack
