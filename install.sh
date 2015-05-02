#!/bin/bash
set -e

MYSQL_HOST=${MYSQL_HOST:-172.17.42.1}
MYSQL_USERNAME=${MYSQL_USERNAME:-checkin}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-PASSWORD}
MYSQL_DATABASE=${MYSQL_DATABASE:-checkin}

REDIS_HOST=${REDIS_HOST:-172.17.42.1}
REDIS_PORT=${REDIS_PORT:-6379}
REDIS_TTL=${REDIS_TTL:-43200}
REDIS_DB=${REDIS_DB:-0}

MAIL_HOST=${MAIL_HOST:-172.17.42.1}
MAIL_PORT=${MAIL_PORT:-25}

AUTHORIZENET_ID=${AUTHORIZENET_ID:-X}
AUTHORIZENET_KEY=${AUTHORIZENET_KEY:-X}

PORT=${PORT:-3001}

# configure messaging settings.json
sed 's/{{MYSQL_HOST}}/'${MYSQL_HOST}'/' -i /data/conference-checkin/config/settings.json
sed 's/{{MYSQL_USERNAME}}/'${MYSQL_USERNAME}'/' -i /data/conference-checkin/config/settings.json
sed 's/{{MYSQL_PASSWORD}}/'${MYSQL_PASSWORD}'/' -i /data/conference-checkin/config/settings.json
sed 's/{{MYSQL_DATABASE}}/'${MYSQL_DATABASE}'/' -i /data/conference-checkin/config/settings.json

sed 's/{{REDIS_HOST}}/'${REDIS_HOST}'/' -i /data/conference-checkin/config/settings.json
sed 's/{{REDIS_PORT}}/'${REDIS_PORT}'/' -i /data/conference-checkin/config/settings.json
sed 's/{{REDIS_DB}}/'${REDIS_DB}'/' -i /data/conference-checkin/config/settings.json

sed 's/{{MAIL_HOST}}/'${MAIL_HOST}'/' -i /data/conference-checkin/config/settings.json
sed 's/{{MAIL_PORT}}/'${MAIL_PORT}'/' -i /data/conference-checkin/config/settings.json

sed 's/{{AUTHORIZENET_ID}}/'${AUTHORIZENET_ID}'/' -i /data/conference-checkin/config/settings.json
sed 's/{{AUTHORIZENET_KEY}}/'${AUTHORIZENET_KEY}'/' -i /data/conference-checkin/config/settings.json

sed 's/{{PORT}}/'${PORT}'/' -i /data/conference-checkin/config/settings.json
touch /data/installed
