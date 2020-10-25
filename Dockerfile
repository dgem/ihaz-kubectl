FROM alpine:latest

WORKDIR /ihaz

RUN apk add --update --no-cache curl ca-certificates \
    && export VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/$VERSION/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl && mv ./kubectl /usr/bin/kubectl \
    && apk del curl ca-certificates \
    && rm -f /var/cache/apk/*