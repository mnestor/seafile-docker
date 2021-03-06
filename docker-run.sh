#!/bin/sh
#Run seafile docker container with host folder as a volume

#Default volume path on host.
VOLUME_PATH="/home/docker/seafile"
#Container hostname
CONTAINER_HOSTNAME="seafile.domain.com"
#Container name
CONTAINER_NAME="seafile"
#Restart policy
RESTART_POLICY="unless-stopped"
#Some extra arguments. Like -d ant -ti
EXTRA_ARGS="-d"
#docker command. You can use "sudo docker" if you need so
DOCKER="docker"
#Extra args to docker command. Like using remote dockerd or something else
DOCKER_ARGS=""

#You can change default values by adding them to config file ~/.docker-sunx-seafile
[ -f ~/.docker-sunx-seafile ] && . ~/.docker-sunx-seafile

[ ! -z "$CONTAINER_HOSTNAME" ] && CONTAINER_HOSTNAME="--hostname=$CONTAINER_HOSTNAME"
[ ! -z "$CONTAINER_NAME" ]     && CONTAINER_NAME="--name=$CONTAINER_NAME"
[ ! -z "$RESTART_POLICY" ]      && RESTART_POLICY="--restart=$RESTART_POLICY"

$DOCKER $DOCKER_ARGS run \
	-v $VOLUME_PATH:/home/seafile \
	-p 127.0.0.1:8000:8000 \
	-p 127.0.0.1:8082:8082 \
	$CONTAINER_HOSTNAME \
	$CONTAINER_NAME \
	$RESTART_POLICY \
	$EXTRA_ARGS \
	sunx/seafile
