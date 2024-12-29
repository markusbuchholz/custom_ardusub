#!/bin/bash

IMAGE_NAME="ardusub-builder"

CONTAINER_NAME="ardusub-builder-container"

HOSTNAME="ardusub"

VOLUME_SOURCE="/home/markus/underwater/custom_ardusub/ardupilot"
VOLUME_TARGET="/home/devuser/ardupilot"

if [ "$(docker ps -q -f name=${CONTAINER_NAME})" ]; then
    echo "Stopping and removing the existing container with name ${CONTAINER_NAME}..."
    docker stop ${CONTAINER_NAME}
    docker rm ${CONTAINER_NAME}
fi

docker run -it --rm \
    --hostname ${HOSTNAME} \
    --name ${CONTAINER_NAME} \
    -v "${VOLUME_SOURCE}:${VOLUME_TARGET}" \
    --privileged \
    --network host \
    ${IMAGE_NAME}

echo "Docker container ${CONTAINER_NAME} has been stopped and removed."

