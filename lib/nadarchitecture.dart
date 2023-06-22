// ignore_for_file: avoid_classes_with_only_static_members

library nadarchitecture;

import 'dart:io';

import 'package:nadarchitecture/arch/common/models/token_model.dart';
import 'package:nadarchitecture/arch/common/viewModels/language_view_model.dart';
import 'package:nadarchitecture/arch/core/constants/notification/notification_constants.dart';
import 'package:nadarchitecture/arch/core/services/language/language_service.dart';
import 'package:nadarchitecture/arch/core/services/language/languages/l10n.dart';
import 'package:nadarchitecture/arch/core/services/network/network_exception.dart';

import '../../arch/common/viewModels/theme_view_model.dart';
import '../../arch/core/base/view/base_view.dart';
import '../../arch/core/base/viewModel/base_view_model.dart';
import '../../arch/core/constants/app/app_constants.dart';
import '../../arch/core/constants/enums/app_themes_enums.dart';
import '../../arch/core/constants/enums/http_types_enums.dart';
import '../../arch/core/constants/enums/network_results_enums.dart';
import '../../arch/core/constants/icons/icon_constants.dart';
import '../../arch/core/constants/local/local_constants.dart';
import '../../arch/core/constants/navigation/navigation_constants.dart';
import '../../arch/core/constants/textStyles/text_style_constants.dart';
import '../../arch/core/constants/theme/theme_constants.dart';
import '../../arch/core/exports/constants_exports.dart';
import '../../arch/core/extensions/context_extension.dart';
import '../../arch/core/extensions/sized_box_extension.dart';
import '../../arch/core/mixins/device_orientation.dart';
import '../../arch/core/mixins/show_bar.dart';
import '../../arch/core/services/local/local_service.dart';
import '../../arch/core/services/navigation/navigation_route.dart';
import '../../arch/core/services/navigation/navigation_service.dart';
import '../../arch/core/services/network/network_service.dart';
import '../../arch/core/services/network/response_parser.dart';
import '../../arch/core/services/notification/awesomeNotification/awesome_notification_service.dart';
import '../../arch/core/services/notification/awesomeNotification/awesome_schedule_notification.dart';
import '../../arch/core/services/notification/firebaseMessaging/firebase_messaging_service.dart';
import '../../arch/core/services/notification/notification_service.dart';
import '../../arch/core/services/size/size_service.dart';
import '../../arch/core/services/theme/theme_service.dart';
import '../../arch/main.dart';
import '../../arch/pages/home/model/post_model.dart';
import '../../arch/pages/home/model/post_model.g.dart';
import '../../arch/pages/home/widget/one_item.dart';
import 'arch/common/models/pagination_model.dart';
import 'arch/core/base/model/base_model.dart';
import 'arch/core/constants/colors/color_constants.dart';
import 'arch/core/constants/endPoints/end_point_constants.dart';
import 'arch/core/constants/images/image_constants.dart';
import 'arch/pages/home/view/home_view.dart';
import 'arch/pages/home/viewModel/home_view_model.dart';
import 'scripts/build_sh.dart';

const l10nYaml = """
arb-dir: lib/src/core/services/language/languages  # l10n.dart dosyasının yolunun belirtildiği kısım
template-arb-file: app_en.arb # Örnek alınacak dil dosyasının adı
output-localization-file: app_localizations.dart # dosyalar oluşturulduktan sonra .dart_tool/flutter_gen/gen_l10n dosyasının altında oluşacak dosyanın ismi
""";

const pubspec = """
dependencies:
  flutter:
    sdk: flutter

  # state management
  provider: ^6.0.5

  # network request
  dio: ^5.2.1+1

  # local storage
  get_storage: ^2.1.1

  # internet connection
  internet_connection_checker: ^1.0.0+1

  # internet connection
  connectivity_plus: ^4.0.1

  # create model easily
  json_annotation: ^4.8.1

  # local notifications
  awesome_notifications: ^0.7.4+1

  #firebase notifications
  firebase_messaging: ^14.6.3

  # language support
  flutter_localizations:
    sdk: flutter
  intl: ^0.18.1


dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.5
  flutter_lints: ^2.0.1
  json_serializable: ^6.7.0


flutter:
  uses-material-design: true
  generate: true
  """;

class Architecture {
  static Future<void> createArchitecture() async {
    const srcFolder = 'lib/src';
    await Directory(srcFolder).create();
    const l10nFile = './l10n.yaml';
    await File(l10nFile).writeAsString(l10nYaml);
    const buildGradleFile = './android/app/build.gradle';
    var lines = await File(buildGradleFile).readAsLines();
    var tempLines = [];
    tempLines.addAll(lines);
    for(int i = 0; i<lines.length;i++){
      if(lines[i].contains('minSdkVersion')){
        tempLines[i] = '        minSdkVersion 21';
      }
    }
    await File(buildGradleFile).writeAsString(tempLines.join('\n'));
    await changePubspecYaml();
    await createCommon();
    await createCore();
    await createPages();
    await createMain();
    await createScripts();
  }

  static Future<void> changePubspecYaml() async {
    const pubspecYaml = './pubspec.yaml';
    final List<String> lines = File(pubspecYaml).readAsLinesSync();
    var tempLines = [
      lines[0],
      lines[1],
      '',
      lines[4],
      '',
      lines[18],
      '',
      lines[20],
      lines[21],
      '\n',
      pubspec
    ];
    await File(pubspecYaml).writeAsString(tempLines.join('\n'));
  }

  static Future<void> createCommon() async {
    const common = 'lib/src/common';
    await Directory(common).create();

    // viewModels
    const controllers = '$common/viewModels';
    await Directory(controllers).create();
    /*
    await File('$controllers/connection_view_model.dart')
        .writeAsString(connectionViewModel);
     */
    await File('$controllers/theme_view_model.dart')
        .writeAsString(themeViewModel);
    await File('$controllers/language_view_model.dart')
        .writeAsString(languageViewModel);

    // models
    const models = '$common/models';
    await Directory(models).create();
    await File('$models/pagination_model.dart').writeAsString(paginationModel);
    await File('$models/token_model.dart').writeAsString(tokenModel);
  }

  static Future<void> createCore() async {
    const core = 'lib/src/core';
    await Directory(core).create();

    // base
    const base = '$core/base';
    await Directory(base).create();

    // base model
    const baseModelI = '$base/model';
    await Directory(baseModelI).create();
    await File('$baseModelI/base_model.dart').writeAsString(baseModel);

    // base view
    const baseViewI = '$base/view';
    await Directory(baseViewI).create();
    await File('$baseViewI/base_view.dart').writeAsString(baseView);

    // base view model
    const baseViewModelI = '$base/viewModel';
    await Directory(baseViewModelI).create();
    await File('$baseViewModelI/base_view_model.dart')
        .writeAsString(baseViewModel);

    // constants
    const constants = '$core/constants';
    await Directory(constants).create();

    // app constants
    const appConstantsI = '$constants/app';
    await Directory(appConstantsI).create();
    await File('$appConstantsI/app_constants.dart').writeAsString(appConstants);

    // color constants
    const colorConstantsI = '$constants/colors';
    await Directory(colorConstantsI).create();
    await File('$colorConstantsI/color_constants.dart')
        .writeAsString(colorConstants);

    // endPoint constants
    const endPointConstantsI = '$constants/endPoints';
    await Directory(endPointConstantsI).create();
    await File('$endPointConstantsI/end_point_constants.dart')
        .writeAsString(endPointConstants);

    // enums
    const enums = '$constants/enums';
    await Directory(enums).create();
    await File('$enums/app_themes_enums.dart').writeAsString(appThemesEnums);
    await File('$enums/http_types_enums.dart').writeAsString(httpTypesEnums);
    await File('$enums/network_results_enums.dart')
        .writeAsString(networkResultEnums);

    // icon constants
    const iconConstantsI = '$constants/icons';
    await Directory(iconConstantsI).create();
    await File('$iconConstantsI/icon_constants.dart')
        .writeAsString(iconConstants);

    // image constants
    const imageConstantsI = '$constants/images';
    await Directory(imageConstantsI).create();
    await File('$imageConstantsI/image_constants.dart')
        .writeAsString(imageConstants);

    // navigation constants
    const navigationConstantsI = '$constants/navigation';
    await Directory(navigationConstantsI).create();
    await File('$navigationConstantsI/navigation_constants.dart')
        .writeAsString(navigationConstants);

    // text styles constants
    const testStyleConstantsI = '$constants/textStyles';
    await Directory(testStyleConstantsI).create();
    await File('$testStyleConstantsI/text_style_constants.dart')
        .writeAsString(textStyleConstants);

    // theme constants
    const themeConstantsI = '$constants/theme';
    await Directory(themeConstantsI).create();
    await File('$themeConstantsI/theme_constants.dart')
        .writeAsString(themeConstants);

    // local constants
    const localConstantsI = '$constants/local';
    await Directory(localConstantsI).create();
    await File('$localConstantsI/local_constants.dart')
        .writeAsString(localConstants);

    // image constants
    const notificationConstantsI = '$constants/notification';
    await Directory(notificationConstantsI).create();
    await File('$notificationConstantsI/notification_constants.dart')
        .writeAsString(notificationConstants);

    // exports
    const exports = '$core/exports';
    await Directory(exports).create();
    await File('$exports/constants_exports.dart')
        .writeAsString(constantExports);

    // extensions
    const extensions = '$core/extensions';
    await Directory(extensions).create();
    await File('$extensions/context_extension.dart')
        .writeAsString(contextExtension);
    await File('$extensions/sized_box_extension.dart')
        .writeAsString(sizedBoxExtension);

    // mixins
    const mixins = '$core/mixins';
    await Directory(mixins).create();
    await File('$mixins/device_orientation.dart')
        .writeAsString(deviceOrientation);
    await File('$mixins/show_bar.dart').writeAsString(showBar);

    // services
    const services = '$core/services';
    await Directory(services).create();

    // connection service
    /*
    const connectionServiceI = '$services/connection';
    await Directory(connectionServiceI).create();
    await File('$connectionServiceI/connection_service.dart')
        .writeAsString(connectionService);

    const connectionServicesPackages = '$connectionServiceI/packages';
    await Directory(connectionServicesPackages).create();
    await File('$connectionServicesPackages/connectivity_service.dart')
        .writeAsString(connectivityService);
    await File(
            '$connectionServicesPackages/internet_connection_checker_service.dart')
        .writeAsString(internetConnectionCheckerService);
     */

    // local service
    const localServiceI = '$services/local';
    await Directory(localServiceI).create();
    await File('$localServiceI/local_service.dart').writeAsString(localService);

    // navigation service
    const navigationServiceI = '$services/navigation';
    await Directory(navigationServiceI).create();
    await File('$navigationServiceI/navigation_service.dart')
        .writeAsString(navigationService);
    await File('$navigationServiceI/navigation_route.dart')
        .writeAsString(navigationRoute);

    // language service
    const languageServiceI = '$services/language';
    await Directory(languageServiceI).create();
    await File('$languageServiceI/language_service.dart')
        .writeAsString(languageService);
    const languageServiceI2 = '$languageServiceI/languages';
    await Directory(languageServiceI2).create();
    await File('$languageServiceI2/l10n.dart').writeAsString(l10n);
    await File('$languageServiceI2/app_en.arb').writeAsString('{}');
    await File('$languageServiceI2/app_tr.arb').writeAsString('{}');

    // network service
    const networkServiceI = '$services/network';
    await Directory(networkServiceI).create();
    await File('$networkServiceI/network_service.dart')
        .writeAsString(networkService);
    await File('$networkServiceI/network_exception.dart')
        .writeAsString(networkException);
    await File('$networkServiceI/response_parser.dart')
        .writeAsString(responseParser);

    // notification service
    const notificationServiceI = '$services/notification';
    await Directory(notificationServiceI).create();
    await File('$notificationServiceI/notification_service.dart')
        .writeAsString(notificationService);

    // awesome notification service
    const awesomeNotification = '$notificationServiceI/awesomeNotification';
    await Directory(awesomeNotification).create();
    await File('$awesomeNotification/awesome_notification_service.dart')
        .writeAsString(awesomeNotificationService);
    await File('$awesomeNotification/awesome_schedule_notification.dart')
        .writeAsString(awesomeScheduleNotification);

    // firebase messaging service
    const firebaseMessaging = '$notificationServiceI/firebaseMessaging';
    await Directory(firebaseMessaging).create();
    await File('$firebaseMessaging/firebase_messaging_service.dart')
        .writeAsString(firebaseMessagingService);

    // size service
    const sizeServiceI = '$services/size';
    await Directory(sizeServiceI).create();
    await File('$sizeServiceI/size_service.dart').writeAsString(sizeService);

    // theme service
    const themeServiceI = '$services/theme';
    await Directory(themeServiceI).create();
    await File('$themeServiceI/theme_service.dart').writeAsString(themeService);
  }

  static Future<void> createPages() async {
    const pages = 'lib/src/pages';
    await Directory(pages).create();

    // home page
    const homePage = '$pages/home';
    await Directory(homePage).create();

    // home model
    const homeModel = '$homePage/model';
    await Directory(homeModel).create();
    await File('$homeModel/post_model.dart').writeAsString(postModel);
    await File('$homeModel/post_model.g.dart').writeAsString(postModelG);

    // home view
    const homeViewI = '$homePage/view';
    await Directory(homeViewI).create();
    await File('$homeViewI/home_view.dart').writeAsString(homeView);

    // home viewModel
    const homeViewModelI = '$homePage/viewModel';
    await Directory(homeViewModelI).create();
    await File('$homeViewModelI/home_view_model.dart')
        .writeAsString(homeViewModel);

    // home widget
    const homeWidget = '$homePage/widget';
    await Directory(homeWidget).create();
    await File('$homeWidget/one_item.dart').writeAsString(oneItem);
  }

  static Future<void> createMain() async {
    await File('lib/main.dart').writeAsString(mainPage);
  }

  static Future<void> createScripts() async {
    const scripts = 'scripts';
    await Directory(scripts).create();
    await File('$scripts/build.sh').writeAsString(script);
  }
}
