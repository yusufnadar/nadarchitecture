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


## Folder Structure
```
|-- common
|   |-- controllers
|   |   -- user_controller.dart
'-- models
|       |-- data_model.dart
|       |-- token_model.dart
|       |-- token_model.g.dart
|       |-- user_model.dart
|       '-- user_model.g.dart
|-- core
|   |-- base
|   |   |-- base_exception.dart
|   |   '-- base_model.dart
|   |-- constants
|   |   |-- app.dart
|   |   |-- colors.dart
|   |   |-- end_points.dart
|   |   |-- enums
|   |   |   |-- app_theme_enums.dart
|   |   |   |-- http_type_enums.dart
|   |   |   '-- network_result_enums.dart
|   |   |-- icons.dart
|   |   |-- images.dart
|   |   |-- local_consts.dart
|   |   |-- routes.dart
|   |   '-- themes.dart
|   |-- init
|   |   |-- bindings
|   |   |   '-- initial_bindings.dart
|   |   |-- controller
|   |   |   '-- my_app_controller.dart
|   |   |-- exceptions
|   |   '-- http_exceptions.dart
|   |   |-- main
|   |   |   '-- init_main.dart
|   |   '-- services
|   |       |-- get_it_service.dart
|   |       |-- local_service.dart
|   |       |-- network_service.dart
|   |       |-- route_service.dart
|   |       '-- theme_service.dart
|   '-- useCases
|       '-- checkNetwork
|           |-- controller
|           |   '-- network_cache_controller.dart
|           |-- services
|           |   |-- connectivity_service.dart
|           |   |-- internet_connection_checker_service.dart
|           |   '-- network_cache_service.dart
|           '-- view
|               '-- no_network.dart
|-- main.dart
|-- utils
|   |-- extensions
|   |   |-- color_extension.dart
|   |   '-- page_padding.dart
|   '-- helpers
|       |-- get_snackbars.dart
|       |-- screen_up_down.dart
|       |-- sized_boxes.dart
|       '-- text_styles.dart
'-- views
|-- pages
|   |-- auth
|   |   |-- register
|   |   |   |-- binding
|   |   |   |   '-- register_binding.dart
|   |   |   |-- controller
|   |   |   |   '-- register_controller.dart
|   |   |   |-- model
|   |   |   |   |-- register_model.dart
|   |   |   |   '-- register_model.g.dart
|   |   |   '-- view
|   |   |       '-- register.dart
|   |   '-- splash
|   |       |-- binding
|   |       |   '-- splash_binding.dart
|   |       |-- controller
|   |       |   '-- splash_controller.dart
|   |       '-- view
|   |           '-- splash.dart
|   |-- bottomBar
|   |   |-- binding
|   |   |   '-- bottom_navigation_bar_binding.dart
|   |   |-- consts
|   |   |   '-- bottom_bar_consts.dart
|   |   |-- controller
|   |   |   |-- bottom_navigation_bar_controller.dart
|   |   |   '-- page_showed_controller.dart
|   |   |-- enums
|   |   |   '-- bottom_bar_enums.dart
|   |   |-- view
|   |   |   '-- bottom_bar.dart
|   |   '-- widgets
|   |       '-- page_showed.dart
|   |-- home
|   |   '-- view
|   |       |-- home_detail.dart
|   |       '-- home_page.dart
|   '-- profile
|       |-- binding
|       |   '-- profile_binding.dart
|       |-- controller
|       |   '-- profile_controller.dart
|       '-- view
|           '-- profile.dart
'-- widgets
|-- auth
|   '-- have_an_account.dart
'-- custom
|-- custom_back_button.dart
|-- custom_button.dart
|-- custom_input.dart
'-- custom_loading.dart
```



