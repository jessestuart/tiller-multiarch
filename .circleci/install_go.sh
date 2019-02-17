#!/bin/bash
rm -rf "$GOROOT" && mkdir "$GOROOT"

# @see https://stackoverflow.com/questions/34729748/installed-go-binary-not-found-in-path-on-alpine-linux-docker
test -d /lib64 || mkdir /lib64
ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

rm -rf /usr/local/go
curl -sL https://storage.googleapis.com/golang/go1.11.5.linux-amd64.tar.gz | tar xz
mv go/ /usr/local/
go env && go version
