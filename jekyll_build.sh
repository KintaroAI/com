#!/bin/bash
cd "$(dirname "$0")"
export JEKYLL_VERSION=3.8
CONTAINER_NAME="k-jekyll-builder"

# Check if the container is already running
if [ $(docker ps -q -f name=^${CONTAINER_NAME}$) ]; then
    echo "Container ${CONTAINER_NAME} is already running."
    # Optionally stop and remove it if you want to restart it
    docker stop ${CONTAINER_NAME}
    docker rm ${CONTAINER_NAME}
fi

# Run the Docker container
docker run \
  --volume="$PWD/content/:/srv/jekyll:Z" \
  -d \
  --restart always \
  --name ${CONTAINER_NAME} \
  jekyll/builder:$JEKYLL_VERSION \
  jekyll build --watch
