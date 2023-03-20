// ignore_for_file: avoid_classes_with_only_static_members

library nadarchitecture;

import 'dart:io';

import '../../arch/common/viewModels/connection_view_model.dart';
import '../../arch/common/viewModels/theme_view_model.dart';
import '../../arch/common/widgets/builder_widget.dart';
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
import '../../arch/core/services/notification/notification_service.dart';
import '../../arch/core/services/size/size_service.dart';
import '../../arch/core/services/theme/theme_service.dart';
import '../../arch/main.dart';
import '../../arch/pages/home/model/post_model.dart';
import '../../arch/pages/home/model/post_model.g.dart';
import '../../arch/pages/home/widget/one_item.dart';
import 'arch/common/models/pagination_model.dart';
import 'arch/common/widgets/no_network_widget.dart';
import 'arch/core/base/error/base_error.dart';
import 'arch/core/base/model/base_model.dart';
import 'arch/core/base/state/base_state.dart';
import 'arch/core/constants/colors/color_constants.dart';
import 'arch/core/constants/endPoints/end_point_constants.dart';
import 'arch/core/constants/images/image_constants.dart';
import 'arch/core/services/network/response_model.dart';
import 'arch/pages/home/view/home_view.dart';
import 'arch/pages/home/viewModel/home_view_model.dart';
import 'scripts/build_sh.dart';

class Architecture {
  static Future<void> createArchitecture() async {
    const srcFolder = 'lib/src';
    await Directory(srcFolder).create();
    await createCommon();
    await createCore();
    await createPages();
    await createMain();
    await createScripts();
  }

  static Future<void> createCommon() async {
    const common = 'lib/src/common';
    await Directory(common).create();

    // viewModels
    const controllers = '$common/viewModels';
    await Directory(controllers).create();
    await File('$controllers/connection_view_model.dart')
        .writeAsString(connectionViewModel);
    await File('$controllers/theme_view_model.dart')
        .writeAsString(themeViewModel);

    // models
    const models = '$common/models';
    await Directory(models).create();
    await File('$models/pagination_model.dart').writeAsString(paginationModel);

    // widgets
    const widgets = '$common/widgets';
    await Directory(widgets).create();
    await File('$widgets/builder_widget.dart').writeAsString(builderWidget);
    await File('$widgets/no_network_widget.dart')
        .writeAsString(noNetworkWidget);
  }

  static Future<void> createCore() async {
    const core = 'lib/src/core';
    await Directory(core).create();

    // base
    const base = '$core/base';
    await Directory(base).create();

    // base error
    const baseErrorI = '$base/error';
    await Directory(baseErrorI).create();
    await File('$baseErrorI/base_error.dart').writeAsString(baseError);

    // base model
    const baseModelI = '$base/model';
    await Directory(baseModelI).create();
    await File('$baseModelI/base_model.dart').writeAsString(baseModel);

    // base state
    const baseStateI = '$base/state';
    await Directory(baseStateI).create();
    await File('$baseStateI/base_state.dart').writeAsString(baseState);

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

    // image constants
    const navigationConstantsI = '$constants/navigation';
    await Directory(navigationConstantsI).create();
    await File('$navigationConstantsI/navigation_constants.dart')
        .writeAsString(navigationConstants);

    // image constants
    const testStyleConstantsI = '$constants/textStyles';
    await Directory(testStyleConstantsI).create();
    await File('$testStyleConstantsI/text_style_constants.dart')
        .writeAsString(textStyleConstants);

    // image constants
    const themeConstantsI = '$constants/theme';
    await Directory(themeConstantsI).create();
    await File('$themeConstantsI/theme_constants.dart')
        .writeAsString(themeConstants);

    // image constants
    const localConstantsI = '$constants/local';
    await Directory(localConstantsI).create();
    await File('$localConstantsI/local_constants.dart')
        .writeAsString(localConstants);

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

    // network service
    const networkServiceI = '$services/network';
    await Directory(networkServiceI).create();
    await File('$networkServiceI/response_model.dart')
        .writeAsString(iResponseModel);
    await File('$networkServiceI/network_service.dart')
        .writeAsString(networkService);
    await File('$networkServiceI/response_parser.dart')
        .writeAsString(responseParser);

    // notification service
    const notificationServiceI = '$services/notification';
    await Directory(notificationServiceI).create();
    await File('$notificationServiceI/notification_service.dart')
        .writeAsString(notificationService);

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
