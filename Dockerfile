ARG target

FROM alpine:3.7 as certs
RUN apk add --no-cache ca-certificates

FROM $target/alpine:3.7
LABEL maintainer="Jesse Stuart <hi@jessestuart.com>"
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

COPY /tiller /tiller

EXPOSE 44134
USER nobody
ENTRYPOINT ["/tiller"]
