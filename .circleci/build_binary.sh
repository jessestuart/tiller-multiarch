#!/bin/bash

cd "$PROJECT_PATH" || exit 1

# Go won't let us cross-compile if GOBIN is set.
# shellcheck disable=SC2016
sed -e 's/GOBIN=$(BINDIR) //' -i Makefile
sed -e "s/^TARGETS.*$/TARGETS \?\= linux\/${GOARCH}/" -i Makefile

docker run --rm --privileged multiarch/qemu-user-static:register
make build-cross

if test "$GOARCH" == 'amd64'; then
	cp "$(command -v tiller)" "$DIR"
else
	cp "_dist/linux-${GOARCH}/tiller" "$DIR"
fi
