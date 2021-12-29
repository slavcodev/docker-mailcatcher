FROM alpine:latest

ARG MAILCATCHER_VERSION=0.8.0

ARG DOCKER_IMAGE_SOURCE="https://github.com/slavcodev/docker-mailcatcher"
ARG DOCKER_IMAGE_MAINTAINER="https://github.com/slavcodev"
ARG DOCKER_IMAGE_LICENSE="MIT"
ARG DOCKER_IMAGE_VENDOR="slavcodev"

LABEL maintainer="${DOCKER_IMAGE_MAINTAINER}" \
    org.opencontainers.image.source="${DOCKER_IMAGE_SOURCE}" \
    org.label-schema.license="${DOCKER_IMAGE_LICENSE}" \
    org.label-schema.license="${DOCKER_IMAGE_LICENSE}" \
    org.label-schema.vendor="${DOCKER_IMAGE_VENDOR}" \
    org.label-schema.name="mailcatcher" \
    org.label-schema.description="MailCatcher runs a super simple SMTP server which catches any message sent to it to display in a web interface." \
    org.label-schema.version="${MAILCATCHER_VERSION}"

RUN apk --no-cache --update add g++ make ruby ruby-dev ruby-json ruby-etc sqlite-dev \
    && gem install mailcatcher -v ${MAILCATCHER_VERSION} --no-document \
    && apk del g++ make

EXPOSE 1025 1080

CMD ["sh", "-c", "/usr/bin/env $(which mailcatcher) -f --ip=0.0.0.0 --foreground --no-quit"]
