ARG target

FROM alpine:3.9 as certs
RUN apk update && apk add ca-certificates socat && rm -rf /var/cache/apk/*

FROM $target/golang:1.11-alpine as builder
LABEL maintainer="Jesse Stuart <hi@jessestuart.com>"

ENV HOME /tmp

COPY helm /helm
COPY tiller /tiller

COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

EXPOSE 44134
USER 65534
ENTRYPOINT ["/tiller"]
# RUN apk add --no-cache ca-certificates

# FROM $target/alpine:3.8
# LABEL maintainer="Jesse Stuart <hi@jessestuart.com>"
# COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

# COPY tiller /tiller

# EXPOSE 44134
# USER nobody
# ENTRYPOINT ["/tiller"]
