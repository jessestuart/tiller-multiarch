#!/bin/bash

echo 'Installing manifest-tool.'
wget https://github.com/estesp/manifest-tool/releases/download/v0.7.0/manifest-tool-linux-amd64 && \
  mv manifest-tool-linux-amd64 /usr/bin/manifest-tool && \
  chmod +x /usr/bin/manifest-tool
manifest-tool --version

echo 'Pushing Docker manifest.'
docker login -u $DOCKERHUB_USER -p $DOCKERHUB_PASS

manifest-tool push from-args \
  --platforms linux/arm,linux/arm64,linux/amd64 \
  --template "$REGISTRY/$IMAGE:$VERSION-ARCH" \
  --target "$REGISTRY/$IMAGE:$VERSION"

if [ $CIRCLE_BRANCH == 'master' ]; then
  manifest-tool push from-args \
    --platforms linux/arm,linux/arm64,linux/amd64 \
    --template "$REGISTRY/$IMAGE:$VERSION-ARCH" \
    --target "$REGISTRY/$IMAGE:latest"
fi

echo 'Verifying manifest was persisted remotely.'
manifest-tool inspect "$REGISTRY/$IMAGE:$VERSION"
