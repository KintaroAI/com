#!/bin/bash
cd "$(dirname "$0")"
export JEKYLL_VERSION=3.8
CONTAINER_NAME="k-jekyll-builder"

# Check if --force parameter is provided
FORCE_RESTART=false
if [[ "$1" == "--force" ]]; then
    FORCE_RESTART=true
fi

# Check if the container is already running
if [ $(docker ps -q -f name=^${CONTAINER_NAME}$) ]; then
    if [ "$FORCE_RESTART" = true ]; then
        echo "Container ${CONTAINER_NAME} is already running. Stopping and removing it..."
        docker stop ${CONTAINER_NAME}
        docker rm ${CONTAINER_NAME}
    else
        echo "Container ${CONTAINER_NAME} is already running."
        echo "Use './jekyll_build.sh --force' to stop and restart the container."
        exit 1
    fi
fi

# Run the Docker container
docker run \
  --volume="$PWD/:/srv/jekyll:Z" \
  -d \
  --restart always \
  --name ${CONTAINER_NAME} \
  jekyll/builder:$JEKYLL_VERSION \
  jekyll build --watch
