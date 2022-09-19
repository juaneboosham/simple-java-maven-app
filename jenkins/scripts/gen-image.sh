#!/usr/bin/env bash
set -x

host=$(cat /etc/docker-registry/host)


LOCAL_TAG=localtag
REMOTE_TAG=$host/$LOCAL_TAG

username=$(cat /etc/docker-registry/username)
password=$(cat /etc/docker-registry/password)

sudo docker login -u $username -p $password

sudo docker build -t $LOCAL_TAG .
sudo docker tag $LOCAL_TAG $REMOTE_TAG
sudo docker push $REMOTE_TAG
