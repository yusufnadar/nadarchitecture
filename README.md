A Flutter package that implements the Clean Architecture by Yusuf Nadaroglu in Flutter.

## What It does?
- [x] Creates a common folder to handle common viewModels, models and widgets
- [x] Creates a core folder to handle base, constants, exports, extensions, mixins, services
- [x] Creates a pages folder to handle all pages

## How to use?
Add Nadarchitecture to your pubspec.yaml in dev_dependencies: section.
```yaml
dev_dependencies:
  nadarchitecture: ^1.0.11
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
- [x] get_storage (A fast, extra light and synchronous key-value storage written entirely in Dart)
- [x] dio (A powerful HTTP package for Dart/Flutter, which supports Global settings, Interceptors, FormData, Aborting and canceling a request)
- [x] provider (A wrapper around InheritedWidget to make them easier to use and more reusable)
- [x] connectivity_plus (Flutter plugin for discovering the state of the network connectivity)
- [x] internet_connection_checker (A pure Dart library that checks for internet by opening a socket to a list of specified addresses, each with individual port and timeout)
- [x] json_annotation (Classes and helper functions that support JSON code generation)
- [x] build_runner (A build system for Dart code generation and modular compilation)
- [x] json_serializable (Automatically generate code for converting to and from JSON by annotating Dart classes)


## Folder Structure
```
src
        main.dart
       ├── common
        │   ├── models
        │   │   └── pagination_model.dart (<1 KB)
        │   ├── viewModels
        │   │   ├── connection_view_model.dart (<1 KB)
        │   │   └── theme_view_model.dart (<1 KB)
        │   └── widgets
        │       ├── builder_widget.dart (<1 KB)
        │       └── no_network_widget.dart (1 KB)
       ├── core
        │   ├── base
        │   │   ├── error
        │   │   │   └── base_error.dart (<1 KB)
        │   │   ├── model
        │   │   │   └── base_model.dart (<1 KB)
        │   │   ├── state
        │   │   │   └── base_state.dart (<1 KB)
        │   │   ├── view
        │   │   │   └── base_view.dart (1 KB)
        │   │   └── viewModel
        │   │       └── base_view_model.dart (<1 KB)
        │   ├── constants
        │   │   ├── app
        │   │   │   └── app_constants.dart (<1 KB)
        │   │   ├── colors
        │   │   │   └── color_constants.dart (<1 KB)
        │   │   ├── endPoints
        │   │   │   └── end_point_constants.dart (<1 KB)
        │   │   ├── enums
        │   │   │   ├── app_themes_enums.dart (<1 KB)
        │   │   │   ├── http_types_enums.dart (<1 KB)
        │   │   │   └── network_results_enums.dart (<1 KB)
        │   │   ├── icons
        │   │   │   └── icon_constants.dart (<1 KB)
        │   │   ├── images
        │   │   │   └── image_constants.dart (<1 KB)
        │   │   ├── local
        │   │   │   └── local_constants.dart (<1 KB)
        │   │   ├── navigation
        │   │   │   └── navigation_constants.dart (<1 KB)
        │   │   ├── textStyles
        │   │   │   └── text_style_constants.dart (2 KB)
        │   │   └── theme
        │   │       └── theme_constants.dart (<1 KB)
        │   ├── exports
        │   │   └── constants_exports.dart (<1 KB)
        │   ├── extensions
        │   │   ├── context_extension.dart (1 KB)
        │   │   └── sized_box_extension.dart (<1 KB)
        │   ├── mixins
        │   │   ├── device_orientation.dart (<1 KB)
        │   │   └── show_bar.dart (1 KB)
        │   └── services
        │       ├── connection
        │       │   └── connection_service.dart (1 KB)
        │       ├── local
        │       │   └── local_service.dart (<1 KB)
        │       ├── navigation
        │       │   ├── navigation_route.dart (<1 KB)
        │       │   └── navigation_service.dart (<1 KB)
        │       ├── network
        │       │   ├── IResponseModel.dart (<1 KB)
        │       │   ├── network_service.dart (2 KB)
        │       │   └── response_parser.dart (<1 KB)
        │       ├── notification
        │       │   └── notification_service.dart (<1 KB)
        │       ├── size
        │       │   └── size_service.dart (<1 KB)
        │       └── theme
        │           └── theme_service.dart (<1 KB)
        └── pages
           └── home
               ├── model
               │   ├── post_model.dart (<1 KB)
               │   └── post_model.g.dart (<1 KB)
               ├── view
               │   └── home_view.dart (1 KB)
               ├── viewModel
               │   └── home_view_model.dart (<1 KB)
               └── widget
                   └── one_item.dart
```



