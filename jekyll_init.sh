#!/bin/bash
export JEKYLL_VERSION=3.8
docker run --rm \
    --volume="$PWD:/srv/jekyll" \
    -it jekyll/jekyll:$JEKYLL_VERSION \
    jekyll new .
