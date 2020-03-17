#!/bin/bash

echo '
export DIR=`pwd`
export QEMU_VERSION=v4.0.0
export GITHUB_REPO=helm/helm
export GO_REPO=k8s.io/helm
export VERSION=$(curl -s https://api.github.com/repos/${GITHUB_REPO}/releases | \
  jq -r "sort_by(.tag_name) | .[].tag_name" | \
  grep -v v3 | \
  sort -V -r | \
  head -n1 \
)

export GOPATH="$HOME/go"
export GOROOT=/usr/local/go
export IMAGE=tiller
export PROJECT_PATH=$GOPATH/src/$GO_REPO
export REGISTRY=jessestuart
export IMAGE_ID="${REGISTRY}/${IMAGE}:${VERSION}-${_GOARCH}"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
' >>$BASH_ENV

source $BASH_ENV
