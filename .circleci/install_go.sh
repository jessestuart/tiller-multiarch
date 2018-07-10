#!/bin/bash
# echo 'export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"' >> $BASH_ENV
# source "$BASH_ENV"

rm -rf "$GOROOT" &&
  mkdir "$GOROOT" &&
  chown "$(whoami):" "$GOROOT"

# @see https://stackoverflow.com/questions/34729748/installed-go-binary-not-found-in-path-on-alpine-linux-docker
if ! test -d /lib64; then
  mkdir /lib64
fi
ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

rm -rf /usr/local/go
curl -sL https://storage.googleapis.com/golang/go1.10.3.linux-amd64.tar.gz | tar xz
mv go/ /usr/local/
go env && go version
