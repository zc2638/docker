#!/usr/bin/env sh

PLATFORMS=${PLUGINS_PLATFORMS:-""}
USERNAME=${PLUGINS_USERNAME:-""}
PASSWORD=${PLUGINS_PASSWORD:-""}
REPO=${PLUGINS_REPO:-""}
DOCKERFILE=${PLUGINS_DOCKERFILE:-"Dockerfile"}
REGISTRY=${PLUGINS_REGISTRY:-"docker.io"}
TAG=${PLUGINS_TAG:-"latest"}

run() {
  docker login -u "$USERNAME" -p "$PASSWORD" "$REGISTRY"
  docker buildx create --use --name builder
  docker buildx build --platform="$PLATFORMS" -t "$REPO":"$TAG" -f "$DOCKERFILE" . --push
  docker buildx rm builder
}

run