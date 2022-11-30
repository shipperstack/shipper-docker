# Changelog

The format is based on [Keep a Changelog][keep-a-changelog].

[keep-a-changelog]: https://keepachangelog.com/en/1.0.0/


# [Unreleased]

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



[Unreleased]: https://github.com/shipperstack/shipper-docker/compare/v4...HEAD
[v4]: https://github.com/shipperstack/shipper-docker/compare/v3...v4
[v3]: https://github.com/shipperstack/shipper-docker/compare/v2...v3
[v2]: https://github.com/shipperstack/shipper-docker/compare/v1...v2
[v1]: https://github.com/shipperstack/shipper-docker/compare/60b4c523a21a5f2ef8cfde27ff937437d7ad4521...v1
