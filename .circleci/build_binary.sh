#!/bin/bash

cd "$PROJECT_PATH" || exit 1

# Go won't let us cross-compile if GOBIN is set.
# shellcheck disable=SC2016
sed -e 's/GOBIN=$(BINDIR) //' -i Makefile

make build

if test "$GOARCH" == 'amd64'; then
  cp "$(command -v tiller)" "$DIR"
else
  cp "${GOPATH}/bin/linux_${GOARCH}/tiller" "$DIR"
fi
