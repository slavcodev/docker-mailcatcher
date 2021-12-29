# MailCatcher Docker Image

[![GitHub Actions status][ico-github-actions]][link-github]
[![Latest Release][ico-version]][link-github]
[![Software License][ico-license]][link-license]

[ico-version]: https://img.shields.io/github/tag/slavcodev/docker-mailcatcher.svg?label=latest
[ico-github-actions]: https://github.com/slavcodev/docker-mailcatcher/workflows/publish/badge.svg
[ico-license]: https://img.shields.io/badge/License-MIT-blue.svg

[link-github]: https://github.com/slavcodev/docker-mailcatcher
[link-license]: LICENSE
[link-github-package]: https://github.com/slavcodev/docker-mailcatcher/pkgs/container/docker-mailcatcher

[MailCatcher](https://mailcatcher.me/) runs a super simple SMTP server
which catches any message sent to it to display in a web interface.

## Installation

Pull the image from the [GitHub Package Registry][link-github-package].
This is the recommended method of installation as it is easier to update image.

```bash
docker pull ghcr.io/slavcodev/docker-mailcatcher:latest
```

Build the image locally

```bash
git clone git@github.com:slavcodev/docker-mailcatcher.git 
cd docker-mailcatcher
docker build . --file Dockerfile --tag ghcr.io/slavcodev/docker-mailcatcher:latest
```

## Quick start

Using `docker-compose.yml`

```yaml
services:
  mailcatcher:
    restart: on-failure:10
    image: ghcr.io/slavcodev/docker-mailcatcher:latest
    ports:
    - "1080:1080"
    - "1025:1025"
```

Alternately, you can manually launch the mailcatcher container.

```bash
docker run --name='mailcatcher' -d --publish=1080:1080 --publish=1025:1025 \
    ghcr.io/slavcodev/docker-mailcatcher:latest
```

# Publish changes

The image is hosted on [GitHub Package Registry][link-github-package].

Read the [Working with the Container registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry) 
to learn how to publish new version of image.

There is an example:

```bash
echo $GITHUB_TOKEN | docker login ghcr.io -u USERNAME --password-stdin
docker push -a ghcr.io/slavcodev/docker-mailcatcher
```
