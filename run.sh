#!/bin/bash

IMAGE_NAME=nginx-file-server
CONTAINER_NAME=mynginx
SRC=/var/www/media
PORT=80

docker build -t $IMAGE_NAME .

docker run \
    --name $CONTAINER_NAME \
    --mount type=bind,source=$SRC,target=/usr/share/nginx/html/media,readonly \
    -p $PORT:80 \
    -d $IMAGE_NAME
