# shipper-docker
[![Release Docker image](https://github.com/shipperstack/shipper-docker/actions/workflows/release-docker-image.yml/badge.svg)](https://github.com/shipperstack/shipper-docker/actions/workflows/release-docker-image.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/ericswpark/shipper)](https://hub.docker.com/repository/docker/ericswpark/shipper)


Repository housing files to create/build/run Docker images of the shipper platform


## Installation

Run:

```
docker-compose up -d --no-build
```

## Build

Run:

```
docker-compose -f docker-compose.dev.yml up -d --build
```

## Documentation

Detailed documentation [is available here.](docs/)
