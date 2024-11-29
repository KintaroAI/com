#!/bin/bash
cd "$(dirname "$0")"
IMAGE_NAME="nginx"
CONTAINER_NAME="k-com"

# Check if the container is already running
if [ $(docker ps -q -f name=^${CONTAINER_NAME}$) ]; then
    echo "Container ${CONTAINER_NAME} is already running."
    # Optionally stop and remove it if you want to restart it
    docker stop ${CONTAINER_NAME}
    docker rm ${CONTAINER_NAME}
fi

# Run the Docker container
docker run \
  --name ${CONTAINER_NAME} \
  --volume="$PWD/_site/:/usr/share/nginx/html/" \
  -d \
  --restart always \
  -p 8080:80 \
  $IMAGE_NAME
