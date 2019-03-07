#!/bin/bash

echo '
export DIR=`pwd`
export QEMU_VERSION=v3.0.0
export GITHUB_REPO=helm/helm
export GO_REPO=k8s.io/helm
export VERSION=$(curl -s https://api.github.com/repos/${GITHUB_REPO}/releases/latest | jq -r ".tag_name")

export GOPATH="$HOME/go"
export GOROOT=/usr/local/go
export IMAGE=tiller
export PROJECT_PATH=$GOPATH/src/$GO_REPO
export REGISTRY=jessestuart
export IMAGE_ID="${REGISTRY}/${IMAGE}:${VERSION}-${_GOARCH}"
export PATH="$GOROOT/bin:$HOME/go/bin:$PATH"
' >>$BASH_ENV

source $BASH_ENV
