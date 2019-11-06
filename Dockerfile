ARG target
FROM golang:1.13 as builder

RUN git clone https://github.com/helm/helm && cd helm
RUN go get -v ./...
RUN make build-cross

FROM alpine:3.10 as certs
RUN apk add --no-cache ca-certificates socat

FROM $target/alpine:3.10
LABEL maintainer="Jesse Stuart <hi@jessestuart.com>"

ENV HOME /tmp

COPY helm /helm
COPY tiller /tiller
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

EXPOSE 44134
USER nobody
ENTRYPOINT ["/tiller"]
