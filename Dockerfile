ARG target
FROM $target/alpine:3.7
LABEL maintainer="Jesse Stuart <hi@jessestuart.com>"

ARG arch
ENV ARCH=$arch

COPY qemu-$ARCH-static* /usr/bin/

RUN apk add --no-cache ca-certificates

ENV HOME /tmp

COPY tiller /bin/tiller

EXPOSE 44134
USER nobody
ENTRYPOINT ["/bin/tiller"]
