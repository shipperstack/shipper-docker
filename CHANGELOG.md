# Changelog

The format is based on [Keep a Changelog][keep-a-changelog].

[keep-a-changelog]: https://keepachangelog.com/en/1.0.0/


# [Unreleased]

[Unreleased]: https://github.com/shipperstack/shipper-docker/compare/v10...HEAD


# [v10] - 2023-04-10

## Changed
- Fixed registering the core app to the flower service


[v10]: https://github.com/shipperstack/shipper-docker/compare/v9...v10


# [v9] - 2023-04-10

## Changed
- Fixed missing concurrency parameter for the mirror upload queue


[v9]: https://github.com/shipperstack/shipper-docker/compare/v8...v9


# [v8] - 2023-04-10

## Added
- Added a new Celery instance to handle the mirror upload queue


[v8]: https://github.com/shipperstack/shipper-docker/compare/v7...v8


# [v7] - 2023-04-04

This release requires a database migration!

## Changed
- Updated PostgreSQL to 15.2


[v7]: https://github.com/shipperstack/shipper-docker/compare/v6...v7


# [v6] - 2023-02-25

## Changed
- Use GitHub Packages instead of DockerHub

[v6]: https://github.com/shipperstack/shipper-docker/compare/v5...v6


# [v5] - 2023-02-25

## Changed
- Fixed `django-celery-beat` crashing because of the incorrect app name


# [v4] - 2022-11-30

## Added
- Added health-check to nginx container. You must add `localhost` to `SHIPPER_ALLOWED_HOSTS`!


# [v3] - 2022-06-20

## Changed
- Celery runs within the `core` app (requires shipper 2.0.0 or above)


# [v2] - 2022-05-21

## Changed
- Updated PostgreSQL to 14.3


# [v1] - 2022-05-21

Initial schema release.


[v5]: https://github.com/shipperstack/shipper-docker/compare/v4...v5
[v4]: https://github.com/shipperstack/shipper-docker/compare/v3...v4
[v3]: https://github.com/shipperstack/shipper-docker/compare/v2...v3
[v2]: https://github.com/shipperstack/shipper-docker/compare/v1...v2
[v1]: https://github.com/shipperstack/shipper-docker/compare/60b4c523a21a5f2ef8cfde27ff937437d7ad4521...v1
