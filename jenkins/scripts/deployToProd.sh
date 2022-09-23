#!/usr/bin/env bash

set -x
host=$(cat /etc/docker-registry/host)
LOCAL_TAG=localtag
REMOTE_TAG=$host/$LOCAL_TAG
ENV=$1
REMOTE_HOST=$(cat /etc/docker-registry/remotehost)

echo ENV

ssh -i /etc/firstECC.pem -o "StrictHostKeyChecking no" -t $REMOTE_HOST "docker run $REMOTE_TAG"

