#!/bin/bash

set -eu

cd "$PROJECT_PATH" || exit 1

# Go won't let us cross-compile if GOBIN is set.
# shellcheck disable=SC2016
# sed -e 's/GOBIN=$(BINDIR) //' -i Makefile
sed -e "s/^TARGETS.*$/TARGETS \?\= linux\/${GOARCH}/" -i Makefile

docker run --rm --privileged multiarch/qemu-user-static:register
make build-cross

cp "$PROJECT_PATH/_dist/linux-${GOARCH}/tiller" .
cp "$PROJECT_PATH/_dist/linux-${GOARCH}/tiller" "${CIRCLE_WORKING_DIRECTORY}"
cp "$PROJECT_PATH/_dist/linux-${GOARCH}/helm" "${CIRCLE_WORKING_DIRECTORY}"
# if test "$GOARCH" == 'amd64'; then
#   cp "$(command -v tiller)" "$DIR"
# else
# fi
