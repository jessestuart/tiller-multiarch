#!/bin/bash

set -eu

cd "$PROJECT_PATH" || exit 1

sed -e "s/^TARGETS.*$/TARGETS \?\= linux\/${_GOARCH}/" -i Makefile

docker run --rm --privileged multiarch/qemu-user-static:register
make build-cross

cp "$PROJECT_PATH/_dist/linux-${_GOARCH}/tiller" "${CIRCLE_WORKING_DIRECTORY}"
cp "$PROJECT_PATH/_dist/linux-${_GOARCH}/helm" "${CIRCLE_WORKING_DIRECTORY}"
