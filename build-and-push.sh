#!/bin/bash

# Build and Push Script for Word Counter Docker Image
# Usage: ./build-and-push.sh YOUR_GITHUB_USERNAME

if [ $# -eq 0 ]; then
    echo "Usage: ./build-and-push.sh YOUR_GITHUB_USERNAME"
    echo "Example: ./build-and-push.sh johndoe"
    exit 1
fi

USERNAME=$1
IMAGE_NAME="word-counter"
REGISTRY="ghcr.io"
FULL_IMAGE_NAME="${REGISTRY}/${USERNAME}/${IMAGE_NAME}:latest"

echo "🏗️  Building Docker image..."
docker build -t $IMAGE_NAME .

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "🏷️  Tagging image for GitHub Container Registry..."
docker tag $IMAGE_NAME $FULL_IMAGE_NAME

echo "🔐 Please login to GitHub Container Registry..."
echo "You'll need to enter your GitHub Personal Access Token"
docker login $REGISTRY -u $USERNAME

if [ $? -ne 0 ]; then
    echo "❌ Login failed!"
    exit 1
fi

echo "📤 Pushing image to registry..."
docker push $FULL_IMAGE_NAME

if [ $? -eq 0 ]; then
    echo "✅ Successfully pushed image!"
    echo "📋 To pull and run on another machine:"
    echo "   docker run -d -p 29532:29532 --name word-counter-app $FULL_IMAGE_NAME"
else
    echo "❌ Push failed!"
    exit 1
fi
