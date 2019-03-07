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

Nightly builds of [Kubernetes Helm's][github] `tiller` service as a multiarch
Docker image. Using the [Docker Image Manifest V2 API][docker], we're able to
support the three most common architectures with a single image:

- amd64 (most PCs / cloud providers)
- 64-bit ARM (stylized as either `arm64` or `aarch64`, although there are
  [subtle differences][wikipedia]) This includes the majority of modern SBCs,
  including:
  - Most [Raspberry Pi][raspberrypi] boards,
  - [Pine64][pine64] Rock64 / RockPro64 / Pine64
  - [Hardkernel's][hardkernel] Odroid C2
  - [Libre Computer][libre]'s `roc-rk3328-cc` "Renegade"
- 32-bit ARM, `armhf` / `armv7` / `arm6l` (older Raspberry Pi boards, Odroid
  XU4)

As mentioned above, images are built compliant with v2.2 of the Docker manifest
API. No need to specify separate images for different architectures
(particularly annoying if you have an architecturally heterogeneous cluster);
the Docker client infers for you which image to pull.

---

### Usage / deployment

Creating the `tiller` deployment with this image is as simple as running
`helm init` and overriding the `--tiller-image` flag, i.e.:

```console
$ helm init --tiller-image=jessestuart/tiller
```

Note that depending on your version of Kubernetes and your RBAC configuration,
you'll likely need to create and specify a `ServiceAccount` as well, e.g.:

```console
$ kubectl apply -f manifests/tiller-rbac.yaml
$ helm init --tiller-image=jessestuart/tiller --service-account tiller
```

[circleci-badge]: https://img.shields.io/circleci/project/github/jessestuart/tiller-multiarch/master.svg?style=popout
[circleci-link]: https://circleci.com/gh/jessestuart/tiller-multiarch/tree/master
[docker]: https://docs.docker.com/registry/spec/manifest-v2-2/
[dockerhub-badge]: https://img.shields.io/docker/pulls/jessestuart/tiller.svg?style=popout
[dockerhub-link]: https://hub.docker.com/r/jessestuart/tiller/
[github]: https://github.com/helm/helm
[hardkernel]: https://www.hardkernel.com/
[libre]: https://libre.computer/products/boards/roc-rk3328-cc/
[microbadger 2]: https://microbadger.com/images/jessestuart/tiller
[microbadger]: https://images.microbadger.com/badges/image/jessestuart/tiller.svg
[pine64]: https://www.pine64.org
[raspberrypi]: https://www.raspberrypi.org/
[wikipedia]: https://en.wikipedia.org/wiki/ARM_architecture#ARMv8-A
