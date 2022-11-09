A Flutter package that implements the Clean Architecture by Yusuf Nadaroglu in Flutter.

## What It does?
- [x] Creates a common folder to handle common controllers and models
- [x] Creates a core folder to handle exceptions, constants, services, useCases
- [x] Creates a utils folder to handle extensions and helpers
- [x] Creates a views folder to handle pages and widgets

## How to use?
Add Nadarchitecture to your pubspec.yaml in dev_dependencies: section.
```yaml
dev_dependencies:
  nadarchitecture: ^0.0.2
```

Update dependencies
```
flutter pub get
```

Run this command to create folder structure
```
flutter pub run nadarchitecture:main
```

## Which Packages Implemented?

- [x] get (Open screens/snackbars/dialogs without context, manage states and inject dependencies easily)
- [x] get_it (Simple direct Service Locator that allows to decouple the interface)
- [x] get_storage (A fast, extra light and synchronous key-value storage written entirely in Dart)
- [x] flutter_svg (An SVG rendering and widget library for Flutter)
- [x] http (A composable, multi-platform, Future-based API for HTTP requests)
- [x] connectivity_plus (Flutter plugin for discovering the state of the network connectivity)
- [x] internet_connection_checker (A pure Dart library that checks for internet by opening a socket to a list of specified addresses, each with individual port and timeout)
- [x] json_annotation (Classes and helper functions that support JSON code generation)
- [x] build_runner (A build system for Dart code generation and modular compilation)
- [x] json_serializable (Automatically generate code for converting to and from JSON by annotating Dart classes)
