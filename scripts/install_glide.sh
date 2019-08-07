#!/bin/sh
curl -sL https://github.com/Masterminds/glide/releases/download/v0.13.3/glide-v0.13.3-linux-amd64.tar.gz | tar xz
chmod +x linux-amd64/glide
mv linux-amd64/glide /usr/bin/glide
