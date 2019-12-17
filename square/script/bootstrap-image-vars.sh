#!/usr/bin/env bash
# Produces the docker images that most other scripts use
# If run on Kuchiko, will also upload the image file to a shared cache so the build can be distributed
set -euxo pipefail

VITESS_BOOTSTRAP_DOCKER_IMAGE_FILE="vitess-bootstrap-image-$GIT_COMMIT.tar"
VITESS_BOOTSTRAP_DOCKER_IMAGE_DIR="docker-cache-vitess-bootstrap"
VITESS_BOOTSTRAP_DOCKER_IMAGE_PATH="$VITESS_BOOTSTRAP_DOCKER_IMAGE_DIR/$VITESS_BOOTSTRAP_DOCKER_IMAGE_FILE"

function loadBootstrapImages() {
  docker load -i $VITESS_BOOTSTRAP_DOCKER_IMAGE_PATH
  rm -f $VITESS_BOOTSTRAP_DOCKER_IMAGE_PATH
}