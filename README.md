# shipper-docker
[![Release Docker image](https://github.com/shipperstack/shipper-docker/actions/workflows/release-docker-image.yml/badge.svg)](https://github.com/shipperstack/shipper-docker/actions/workflows/release-docker-image.yml)

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

## Warning

Do not run the production environment and the development environment from the same directory. Docker Compose uses the folder name as a prefix for the containers that are created, which can potentially cause a conflict. As a result, you may end up destroying a set of containers from one environment when settting up the set of containers for the other environment!

If you *must* use the same directory for both environments, consider prefixing your Docker Compose commands with `COMPOSE_PROJECT_NAME` in order to change the prefix used. (Or, export the environment flag before running Docker Compose commands.)
