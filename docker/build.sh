#!/bin/bash

IMAGE_NAME="ardusub-builder"

cd "$(dirname "$0")"

docker build -t ${IMAGE_NAME} .

echo "Docker image ${IMAGE_NAME} built successfully."

