#!/usr/bin/env bash

set -x
host=$(cat /etc/docker-registry/host)
LOCAL_TAG=localtag
REMOTE_TAG=$host/$LOCAL_TAG
ENV=$1
REMOTE_HOST=ec2-user@172.31.21.163

echo ENV

ssh -i "firstECC.pem" $REMOTE_HOST
docker run $REMOTE_TAG
