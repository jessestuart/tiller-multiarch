ARG target

FROM alpine:3.9 as certs
RUN apk update && apk add ca-certificates socat

FROM $target/alpine:3.9
LABEL maintainer="Jesse Stuart <hi@jessestuart.com>"

ENV HOME /tmp

COPY helm /helm
COPY tiller /tiller
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

EXPOSE 44134
USER nobody
ENTRYPOINT ["/tiller"]
