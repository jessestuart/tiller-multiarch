<p align="center">
  <a href="https://github.com/jessestuart/tiller-multiarch">
    <img src="./assets/helm-logo.svg" width="120" />
  </a>
</p>
<h1 align="center">
  Tiller Multiarch
</h1>
<h3 align="center">
  Sailing the seas of orchestration on any device you'd like.
</h3>

[![CircleCI][circleci-badge]][circleci-link]
[![Docker Pulls][dockerhub-badge]][dockerhub-link]
[![][microbadger]][microbadger 2]

Provides daily builds of Kubernetes Helm's `tiller` service as Docker images
compatible with most major architectures:

- amd64 (most PCs / cloud providers)
- arm64 (many SBCs, including Odroid C2, Rock64, and RPi3 with 64-bit OS)
- armhf / armv7 (most notably, the RPi family running stock Raspbian)

Images are built compliant with v2.2 of the Docker manifest API. No need
to specify separate images for different architectures (particularly annoying
if you have an architecturally heterogeneous cluster); the Docker client infers
for you which image to pull.

### Usage / deployment

If you've reached this repo, you're likely just trying to get a tiller pod
deployed to your cluster. The simplest way to do that is to just substitute this
image in the `helm init` command, e.g.,:

```console
$ helm init --tiller-image=jessestuart/tiller:v2.9.1
```

Note that depending on your version of Kubernetes and your RBAC configuration,
you'll likely need to create and specify a `ServiceAccount` as well, e.g.:

```console
$ helm init --tiller-image=jessestuart/tiller:v2.9.1 --service-account tiller
```

[circleci-badge]: https://img.shields.io/circleci/project/github/jessestuart/tiller-multiarch/master.svg?style=popout
[circleci-link]: https://circleci.com/gh/jessestuart/tiller-multiarch/tree/master
[dockerhub-badge]: https://img.shields.io/docker/pulls/jessestuart/tiller.svg?style=popout
[dockerhub-link]: https://hub.docker.com/r/jessestuart/tiller/
[microbadger]: https://images.microbadger.com/badges/image/jessestuart/tiller.svg
[microbadger 2]: https://microbadger.com/images/jessestuart/tiller
