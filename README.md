A Flutter package that implements the Clean Architecture by Yusuf Nadaroglu in Flutter.

## What It does?
- [x] Creates a common folder to handle common view_models, models and widgets
- [x] Creates a core folder to handle base, consts, helper, services
- [x] Creates a features folder to handle all pages

## How to use?
Add Nadarchitecture to your pubspec.yaml in dev_dependencies: section.
```yaml
dev_dependencies:
  nadarchitecture: ^1.0.16
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
- [x] get_it (Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App)
- [x] flutter_native_splash (Customize Flutter's default white native splash screen with background color and splash image. Supports dark mode, full screen, and more)
- [x] dartz (Functional Programming in Dart. Purify your Dart code using efficient immutable data structures, monads, lenses and other FP tools)
- [x] flutter_svg (An SVG rendering and widget library for Flutter, which allows painting and displaying Scalable Vector Graphics 1.1 files)
- [x] flutter_screenutil (A flutter plugin for adapting screen and font size.Guaranteed to look good on different models)
- [x] logger (Small, easy to use and extensible logger which prints beautiful logs)
- [x] dio (A powerful HTTP package for Dart/Flutter, which supports Global settings, Interceptors, FormData, Aborting and canceling a request)
- [x] provider (A wrapper around InheritedWidget to make them easier to use and more reusable)
- [x] json_annotation (Classes and helper functions that support JSON code generation)
- [x] freezed_annotation (Annotations for the freezed code-generator. This package does nothing without freezed too)
- [x] build_runner (A build system for Dart code generation and modular compilation)
- [x] json_serializable (Automatically generate code for converting to and from JSON by annotating Dart classes)
- [x] freezed (Code generation for immutable classes that has a simple syntax/API without compromising on the features)
- [x] flutter_gen_runner (The Flutter code generator for your assets, fonts, colors)


## Folder Structure
```
├── common
│ ├── models
│ │ ├── token_model.dart
│ │ └── user_model.dart
│ ├── view_model
│ │ └── user_view_model.dart
│ └── widget
│     ├── app_logo.dart
│     ├── custom_button.dart
│     └── custom_input.dart
├── core
│ ├── base
│ │ ├── model
│ │ │ ├── base_error_model.dart
│ │ │ └── base_pagination_model.dart
│ │ ├── view
│ │ │ └── base_view.dart
│ │ └── viewModel
│ │     └── base_view_model.dart
│ ├── constants
│ │ ├── app
│ │ │ └── app_constants.dart
│ │ ├── color
│ │ │ └── app_colors.dart
│ │ ├── end_point
│ │ │ └── app_end_points.dart
│ │ ├── enum
│ │ │ └── http_types_enums.dart
│ │ ├── local
│ │ │ └── app_locals.dart
│ │ ├── notification
│ │ │ └── notification_constants.dart
│ │ ├── route
│ │ │ └── app_routes.dart
│ │ ├── text_style
│ │ │ └── app_text_styles.dart
│ │ └── theme
│ │     └── app_themes.dart
│ ├── helper
│ │ ├── extension
│ │ │ ├── color.dart
│ │ │ ├── context.dart
│ │ │ └── string.dart
│ │ └── init
│ │     └── helper_init.dart
│ └── services
│     ├── get_it
│     │ └── get_it_service.dart
│     ├── local
│     │ └── local_service.dart
│     ├── logger
│     │ └── logger_service.dart
│     ├── network
│     │ ├── helper
│     │ │ └── network_helper.dart
│     │ ├── mapper
│     │ │ └── api_model_mapper.dart
│     │ └── network_service.dart
│     ├── route
│     │ ├── app_router.dart
│     │ └── route_service.dart
│     └── theme
│         └── theme_service.dart
├── features
│ ├── home
│ │ └── presentation
│ │     ├── mixin
│ │     │ └── home_mixin.dart
│ │     └── view
│ │         └── home_view.dart
│ ├── login
│ │ ├── data
│ │ │ ├── data_sources
│ │ │ │ └── login_data_source.dart
│ │ │ ├── models
│ │ │ │ ├── login_request
│ │ │ │ │ └── login_request_model.dart
│ │ │ │ └── login_response
│ │ │ │     └── login_response_model.dart
│ │ │ └── repositories
│ │ │     └── login_repository_impl.dart
│ │ ├── domain
│ │ │ ├── entities
│ │ │ │ └── login_response
│ │ │ │     └── login_response_entity.dart
│ │ │ └── repositories
│ │ │     └── login_repository.dart
│ │ └── presentation
│ │     ├── mixin
│ │     │ └── login_mixin.dart
│ │     ├── view
│ │     │ └── login_view.dart
│ │     └── view_model
│ │         └── login_view_model.dart
│ └── test
│     ├── data
│     │ ├── data_sources
│     │ │ └── test_data_source.dart
│     │ ├── models
│     │ │ └── test_model.dart
│     │ └── repositories
│     │     └── test_repository_impl.dart
│     ├── domain
│     │ ├── entities
│     │ │ └── test_entity.dart
│     │ └── repositories
│     │     └── test_repository.dart
│     └── presentation
│         ├── mixin
│         │ └── test_mixin.dart
│         ├── view
│         │ └── test_view.dart
│         └── view_model
│             └── test_view_model.dart
└── main.dart

```



