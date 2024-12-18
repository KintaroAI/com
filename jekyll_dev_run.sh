#!/bin/bash
# Local dev server:
export JEKYLL_VERSION=3.8
docker run --rm \
  --volume="$PWD/:/srv/jekyll:Z" \
  --publish 4000:4000 \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll serve
