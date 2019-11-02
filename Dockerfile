FROM alpine:3.8

ARG RKE_VERSION="v0.3.1"
ENV RKE_VERSION=$RKE_VERSION

RUN apk add --update ca-certificates && apk add --update -t deps curl \
    && curl -sLo /usr/local/bin/rke https://github.com/rancher/rke/releases/download/${RKE_VERSION}/rke_linux-amd64 \
    && chmod +x /usr/local/bin/rke \
    && apk del --purge deps \
    && rm /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/rke"]
CMD ["help"]