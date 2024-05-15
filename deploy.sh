#!/bin/bash
cd "$(dirname "$0")"
git pull

# Run this only once during the first run.
# This will build new version of the site on git pull.
# ./jekyll_build.sh

# Run this only once during the first run.
# This will serve the static version of the site.
# ./nginx.sh
