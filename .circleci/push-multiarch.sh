#!/bin/bash
set -euo pipefail

export VERSION_TAG="${REGISTRY}/${IMAGE}:${VERSION}-${GOARCH}"
export LATEST_TAG="${REGISTRY}/${IMAGE}:latest-${GOARCH}"

docker build -t $VERSION_TAG --build-arg target=$TARGET .

echo "Logging in to Docker Hub..."
echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin
echo "Pushing image with tag: $VERSION_TAG"
docker push $VERSION_TAG

if [ $CIRCLE_BRANCH == 'master' ]; then
  echo "Build is on master branch -- pushing to 'latest' tag."
  docker tag $VERSION_TAG $LATEST_TAG
  docker push $LATEST_TAG
fi
