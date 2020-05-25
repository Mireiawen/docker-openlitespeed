#!/bin/bash
set -e

# Define the image name
DOCKER_IMAGE="mireiawen/openlitespeed"

# Build the latest version so we can grab the version
docker build '.' \
	--no-cache \
	--tag "${DOCKER_IMAGE}"

# Get the built version
LITESPEED_VERSION="$(docker run \
	--rm \
	--interactive \
	--tty "${DOCKER_IMAGE}" \
		litespeed --version |head -1 |cut -d'/' -f'2-' |cut -d' ' -f'1')"

# Build the tagged version
docker build '.' \
	--tag "${DOCKER_IMAGE}:${LITESPEED_VERSION}"

# Push the tagged build
docker push "${DOCKER_IMAGE}:${LITESPEED_VERSION}"
