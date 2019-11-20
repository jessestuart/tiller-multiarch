#!/bin/bash

set -eu

docker run --rm --privileged multiarch/qemu-user-static:register

git clone "https://github.com/${GITHUB_REPO}" "$PROJECT_PATH"
cd "$PROJECT_PATH"

git checkout $VERSION

sed -e "s/^TARGETS.*$/TARGETS \?\= linux\/${_GOARCH}/" -i Makefile

make build-cross

cp "$PROJECT_PATH/_dist/linux-${_GOARCH}/tiller" "${CIRCLE_WORKING_DIRECTORY}"
cp "$PROJECT_PATH/_dist/linux-${_GOARCH}/helm" "${CIRCLE_WORKING_DIRECTORY}"
