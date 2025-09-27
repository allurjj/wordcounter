#!/bin/bash

# Pull and Run Script for Word Counter from GitHub Container Registry
# Usage: ./run-from-github.sh YOUR_GITHUB_USERNAME

if [ $# -eq 0 ]; then
    echo "Usage: ./run-from-github.sh YOUR_GITHUB_USERNAME"
    echo "Example: ./run-from-github.sh johndoe"
    exit 1
fi

USERNAME=$1
IMAGE_NAME="word-counter"
REGISTRY="ghcr.io"
FULL_IMAGE_NAME="${REGISTRY}/${USERNAME}/${IMAGE_NAME}:latest"
CONTAINER_NAME="word-counter-app"
PORT="29532"

echo "🛑 Stopping and removing existing container (if any)..."
docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

echo "📥 Pulling latest image from GitHub Container Registry..."
docker pull $FULL_IMAGE_NAME

if [ $? -ne 0 ]; then
    echo "❌ Failed to pull image!"
    echo "Make sure the image exists and is public, or login with:"
    echo "docker login ghcr.io -u $USERNAME"
    exit 1
fi

echo "🚀 Starting Word Counter application..."
docker run -d -p $PORT:$PORT --name $CONTAINER_NAME $FULL_IMAGE_NAME

if [ $? -eq 0 ]; then
    echo "✅ Word Counter is now running!"
    echo "🌐 Open your browser and go to: http://localhost:$PORT"
    echo ""
    echo "📋 Useful commands:"
    echo "   Stop:    docker stop $CONTAINER_NAME"
    echo "   Remove:  docker rm $CONTAINER_NAME"
    echo "   Logs:    docker logs $CONTAINER_NAME"
else
    echo "❌ Failed to start container!"
    exit 1
fi
