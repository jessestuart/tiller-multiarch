#!/bin/bash
# echo 'export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"' >> $BASH_ENV
# source "$BASH_ENV"

sudo rm -rf "$GOROOT" &&
  sudo mkdir "$GOROOT" &&
  sudo chown "$(whoami):" "$GOROOT"

# @see https://stackoverflow.com/questions/34729748/installed-go-binary-not-found-in-path-on-alpine-linux-docker
if ! test -d /lib64; then
  sudo mkdir /lib64
fi
sudo ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

sudo rm -rf /usr/local/go
sudo curl -sL https://storage.googleapis.com/golang/go1.10.3.linux-amd64.tar.gz | tar xz
sudo mv go/ /usr/local/
go env && go version
