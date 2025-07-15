#!/bin/bash
set -e  # Exit on any error
cd "$(dirname "$0")"

echo "Starting deployment process..."

# Pull latest changes from git
echo "Pulling latest changes from git..."
git pull

# Build the site using jekyll_build.sh
echo "Building the site..."
./jekyll_build.sh

echo "Deployment completed successfully!"
