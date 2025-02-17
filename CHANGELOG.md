# Changelog

Each entry in this document is intended to be concise and focused on what is relevant to end-users.

## [2.0.3] - 2024-02-17
- Fix for the `listenMultiple` method.

## [2.0.2] - 2024-02-17
- Added support for multiple topics in the `listenMultiple` method.
- Added support for pausing all subscriptions to multiple topics in the `pauseListeningToMultiple` method.

## [2.0.1] - 2023-12-19

### Added
- Support for custom types in events, allowing for greater flexibility and customization.
- Support for the latest version of Flutter, ensuring compatibility and leveraging the newest features and improvements of the platform.

### Changed
- **Breaking Change**: Removal of the `TopicData` class. This decision was made to simplify implementation and enhance efficiency. Please review your code to adjust to this removal if you were using this class.

## [1.0.0] - 2022-11-01

### Added
- Preparation for the first official release of the package, establishing a solid foundation for future development.

### Changed
- Replacement of synchronous listeners with asynchronous stream subscriptions. This change brings improved efficiency and better handling of real-time events.

## [0.1.0] - 2022-08-01

### Added
- Initial publication of the `fkafka` package. This release represents the first step towards a robust and functional ecosystem.
