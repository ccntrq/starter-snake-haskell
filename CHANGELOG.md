# Changelog

All notable changes to this project since `v1.0.0` will be documented in this
file.

This project adheres to the [Haskell Package Versioning Policy](https://pvp.haskell.org/).

## 1.1.0 (2023-08-26)

Synced with latest Battlesnake API spec and improved documentation.

### Added

- `map` and `source` fields added to `Game`
- `rulesetSettings` field added to `Ruleset`
- `customizations` field added to `Battlesnake`

### Changed

- the `info` handler passed to `runBattlesnakeServer` must be an IO action now
- `InfoResponse.apiversion` was changed from `Text` to the new `APIVersion` type
  to prevent invalid api version

## 1.0.0 (2023-08-22)

### Added

- First package release
