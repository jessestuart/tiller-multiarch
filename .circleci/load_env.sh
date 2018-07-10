#!/bin/bash
echo 'export DIR=`pwd`' >> $BASH_ENV
echo 'export QEMU_VERSION=v2.12.0' >> $BASH_ENV
echo 'export GITHUB_REPO=kubernetes/helm' >> $BASH_ENV
echo 'export GO_REPO=k8s.io/helm' >> $BASH_ENV
echo 'export VERSION=$(curl -s https://api.github.com/repos/${GITHUB_REPO}/releases | jq -r "sort_by(.tag_name)[-1].tag_name")' >> $BASH_ENV

echo 'export GOPATH=/root/go' >> $BASH_ENV
echo 'export GOROOT=/usr/local/go' >> $BASH_ENV

echo 'export IMAGE=tiller' >> $BASH_ENV
echo 'export PROJECT_PATH=$GOPATH/src/$GO_REPO' >> $BASH_ENV
echo 'export REGISTRY=jessestuart' >> $BASH_ENV
echo 'export IMAGE_ID="${REGISTRY}/${IMAGE}:${VERSION}-${GOARCH}"' >> $BASH_ENV

echo 'export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"' >> $BASH_ENV

source $BASH_ENV
