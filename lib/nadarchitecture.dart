library nadarchitecture;

import 'dart:io';
import 'package:nadarchitecture/arch/common/models/token_model.dart';
import 'package:nadarchitecture/arch/common/models/token_model.g.dart';
import 'package:nadarchitecture/arch/common/models/user_model.dart';
import 'package:nadarchitecture/arch/common/models/user_model.g.dart';
import 'package:nadarchitecture/arch/core/base/base_exception.dart';
import 'package:nadarchitecture/arch/core/base/base_model.dart';
import 'package:nadarchitecture/arch/common/models/data_model.dart';
import 'package:nadarchitecture/arch/core/constants/app.dart';
import 'package:nadarchitecture/arch/core/constants/colors.dart';
import 'package:nadarchitecture/arch/core/constants/end_points.dart';
import 'package:nadarchitecture/arch/core/constants/enums/app_theme_enums.dart';
import 'package:nadarchitecture/arch/core/constants/enums/http_type_enums.dart';
import 'package:nadarchitecture/arch/core/constants/enums/network_result_enums.dart';
import 'package:nadarchitecture/arch/core/constants/icons.dart';
import 'package:nadarchitecture/arch/core/constants/images.dart';
import 'package:nadarchitecture/arch/core/constants/local_consts.dart';
import 'package:nadarchitecture/arch/core/constants/routes.dart';
import 'package:nadarchitecture/arch/core/constants/themes.dart';
import 'package:nadarchitecture/arch/core/init/bindings/initial_bindings.dart';
import 'package:nadarchitecture/arch/core/init/controller/my_app_controller.dart';
import 'package:nadarchitecture/arch/core/init/main/init_main.dart';
import 'package:nadarchitecture/arch/core/init/services/get_it_service.dart';
import 'package:nadarchitecture/arch/core/init/services/local_service.dart';
import 'package:nadarchitecture/arch/core/init/services/network_service.dart';
import 'package:nadarchitecture/arch/core/init/services/route_service.dart';
import 'package:nadarchitecture/arch/core/init/services/theme_service.dart';
import 'package:nadarchitecture/arch/core/useCases/checkNetwork/services/connectivity_service.dart';
import 'package:nadarchitecture/arch/core/useCases/checkNetwork/services/internet_connection_checker_service.dart';
import 'package:nadarchitecture/arch/core/useCases/checkNetwork/services/network_cache_service.dart';
import 'package:nadarchitecture/arch/core/useCases/checkNetwork/view/no_network.dart';
import 'package:nadarchitecture/arch/main.dart';
import 'package:nadarchitecture/arch/utils/extensions/color_extension.dart';
import 'package:nadarchitecture/arch/utils/extensions/page_padding.dart';
import 'package:nadarchitecture/arch/utils/helpers/get_snackbars.dart';
import 'package:nadarchitecture/arch/utils/helpers/screen_up_down.dart';
import 'package:nadarchitecture/arch/utils/helpers/sized_boxes.dart';
import 'package:nadarchitecture/arch/utils/helpers/text_styles.dart';
import 'package:nadarchitecture/arch/views/pages/auth/register/binding/register_binding.dart';
import 'package:nadarchitecture/arch/views/pages/auth/register/controller/register_controller.dart';
import 'package:nadarchitecture/arch/views/pages/auth/register/model/register_model.dart';
import 'package:nadarchitecture/arch/views/pages/auth/register/model/register_model.g.dart';
import 'package:nadarchitecture/arch/views/pages/auth/register/view/register.dart';
import 'package:nadarchitecture/arch/views/pages/auth/splash/binding/splash_binding.dart';
import 'package:nadarchitecture/arch/views/pages/auth/splash/controller/splash_controller.dart';
import 'package:nadarchitecture/arch/views/pages/auth/splash/view/splash.dart';
import 'package:nadarchitecture/arch/views/pages/bottomBar/binding/bottom_navigation_bar_binding.dart';
import 'package:nadarchitecture/arch/views/pages/bottomBar/consts/bottom_bar_consts.dart';
import 'package:nadarchitecture/arch/views/pages/bottomBar/controller/bottom_navigation_bar_controller.dart';
import 'package:nadarchitecture/arch/views/pages/bottomBar/controller/page_showed_controller.dart';
import 'package:nadarchitecture/arch/views/pages/bottomBar/enums/bottom_bar_enums.dart';
import 'package:nadarchitecture/arch/views/pages/bottomBar/view/bottom_bar.dart';
import 'package:nadarchitecture/arch/views/pages/home/view/home_detail.dart';
import 'package:nadarchitecture/arch/views/pages/home/view/home_page.dart';
import 'package:nadarchitecture/arch/views/pages/profile/binding/profile_binding.dart';
import 'package:nadarchitecture/arch/views/pages/profile/controller/profile_controller.dart';
import 'package:nadarchitecture/arch/views/pages/profile/view/profile.dart';
import 'package:nadarchitecture/arch/views/widgets/auth/have_an_account.dart';
import 'package:nadarchitecture/arch/views/widgets/custom/custom_back_button.dart';
import 'package:nadarchitecture/arch/views/widgets/custom/custom_button.dart';
import 'package:nadarchitecture/arch/views/widgets/custom/custom_input.dart';
import 'package:nadarchitecture/arch/views/widgets/custom/custom_loading.dart';
import 'arch/common/controllers/user_controller.dart';
import 'arch/core/init/exceptions/http_exceptions.dart';
import 'arch/core/useCases/checkNetwork/controller/network_cache_controller.dart';
import 'arch/views/pages/bottomBar/widgets/page_showed.dart';
import 'scripts/build_sh.dart';

class Architecture {
  static Future<void> createArchitecture() async {
    await createCommon();
    await createCore();
    await createUtils();
    await createViews();
    await createMain();
    await createScripts();
  }

  static Future createCommon() async {
    const common = 'lib/common';
    await Directory(common).create();

    // controllers
    const controllers = '$common/controllers';
    await Directory(controllers).create();
    await File('$controllers/user_controller.dart')
        .writeAsString(userController);

    // models
    const models = '$common/models';
    await Directory(models).create();
    await File('$models/token_model.dart').writeAsString(tokenModel);
    await File('$models/token_model.g.dart').writeAsString(tokenModelG);
    await File('$models/user_model.dart').writeAsString(userModel);
    await File('$models/user_model.g.dart').writeAsString(userModelG);
    await File('$models/data_model.dart').writeAsString(dataModel);
  }

  static Future createCore() async {
    const core = 'lib/core';
    await Directory(core).create();

    // base
    const base = '$core/base';
    await Directory(base).create();
    await File('$base/base_exception.dart').writeAsString(baseException);
    await File('$base/base_model.dart').writeAsString(baseModel);

    // constants
    const constants = '$core/constants';
    const constantsEnums = '$core/constants/enums';
    await Directory(constants).create();

    // constants enums
    await Directory(constantsEnums).create();
    await File('$constantsEnums/app_theme_enums.dart')
        .writeAsString(appThemeEnums);
    await File('$constantsEnums/http_type_enums.dart')
        .writeAsString(httpTypeEnums);
    await File('$constantsEnums/network_result_enums.dart')
        .writeAsString(networkResultEnums);

    // just constants
    await File('$constants/app.dart').writeAsString(app);
    await File('$constants/colors.dart').writeAsString(colors);
    await File('$constants/end_points.dart').writeAsString(endPoints);
    await File('$constants/icons.dart').writeAsString(appIcons);
    await File('$constants/images.dart').writeAsString(images);
    await File('$constants/local_consts.dart').writeAsString(appLocalConsts);
    await File('$constants/routes.dart').writeAsString(routes);
    await File('$constants/themes.dart').writeAsString(themes);

    // init
    const coreInit = '$core/init';
    await Directory(coreInit).create();

    // init bindings
    const coreInitBindings = '$coreInit/bindings';
    await Directory(coreInitBindings).create();
    await File('$coreInitBindings/initial_bindings.dart')
        .writeAsString(initialBindings);

    // init controller
    const coreInitController = '$coreInit/controller';
    await Directory(coreInitController).create();
    await File('$coreInitController/my_app_controller.dart')
        .writeAsString(myAppController);

    // init exceptions

    const coreInitExceptions = '$coreInit/exceptions';
    await Directory(coreInitExceptions).create();
    await File('$coreInitExceptions/http_exceptions.dart')
        .writeAsString(httpExceptions);

    // init main
    const coreInitMains = '$coreInit/main';
    await Directory(coreInitMains).create();
    await File('$coreInitMains/init_main.dart').writeAsString(initMain);

    // init services
    const coreInitService = '$coreInit/services';
    await Directory(coreInitService).create();
    await File('$coreInitService/get_it_service.dart')
        .writeAsString(getItService);
    await File('$coreInitService/local_service.dart')
        .writeAsString(localService);
    await File('$coreInitService/network_service.dart')
        .writeAsString(networkService);
    await File('$coreInitService/route_service.dart')
        .writeAsString(routeService);
    await File('$coreInitService/theme_service.dart')
        .writeAsString(themeService);

    // useCases
    const useCases = '$core/useCases';
    const useCasesCheckNetwork = '$useCases/checkNetwork';
    await Directory(useCases).create();
    await Directory(useCasesCheckNetwork).create();

    // checkNetwork controller
    const useCasesCheckNetworkController = '$useCasesCheckNetwork/controller';
    await Directory(useCasesCheckNetworkController).create();
    await File('$useCasesCheckNetworkController/network_cache_controller.dart')
        .writeAsString(networkCacheController);

    // checkNetwork services
    const useCasesCheckNetworkServices = '$useCasesCheckNetwork/services';
    await Directory(useCasesCheckNetworkServices).create();
    await File('$useCasesCheckNetworkServices/connectivity_service.dart')
        .writeAsString(connectivityService);
    await File(
            '$useCasesCheckNetworkServices/internet_connection_checker_service.dart')
        .writeAsString(internetConnectionCheckerService);
    await File('$useCasesCheckNetworkServices/network_cache_service.dart')
        .writeAsString(networkCacheService);

    // checkNetwork view
    const useCasesCheckNetworkView = '$useCasesCheckNetwork/view';
    await Directory(useCasesCheckNetworkView).create();
    await File('$useCasesCheckNetworkView/no_network.dart')
        .writeAsString(noNetworkWidget);
  }

  static Future createUtils() async {
    const utils = 'lib/utils';
    await Directory(utils).create();

    // utils extension
    const utilsExtensions = '$utils/extensions';
    await Directory(utilsExtensions).create();
    await File('$utilsExtensions/color_extension.dart')
        .writeAsString(colorExtension);
    await File('$utilsExtensions/page_padding.dart')
        .writeAsString(pagePaddingExtension);

    // utils helpers
    const utilsHelpers = '$utils/helpers';
    await Directory(utilsHelpers).create();
    await File('$utilsHelpers/get_snackbars.dart').writeAsString(getBars);
    await File('$utilsHelpers/screen_up_down.dart')
        .writeAsString(screenControl);
    await File('$utilsHelpers/sized_boxes.dart').writeAsString(sizedBoxes);
    await File('$utilsHelpers/text_styles.dart').writeAsString(styles);
  }

  static Future createViews() async {
    const views = 'lib/views';
    await Directory(views).create();

    // views pages
    const viewsPages = 'lib/views/pages';
    await Directory(viewsPages).create();

    // views pages auth
    const viewsPagesAuth = 'lib/views/pages/auth';
    await Directory(viewsPagesAuth).create();

    // views pages auth register
    const viewsPagesAuthRegister = '$viewsPagesAuth/register';
    await Directory(viewsPagesAuthRegister).create();

    // views pages auth register binding
    const viewsPagesAuthRegisterBinding = '$viewsPagesAuthRegister/binding';
    await Directory(viewsPagesAuthRegisterBinding).create();
    await File('$viewsPagesAuthRegisterBinding/register_binding.dart')
        .writeAsString(registerBinding);

    // views pages auth register controller
    const viewsPagesAuthRegisterController =
        '$viewsPagesAuthRegister/controller';
    await Directory(viewsPagesAuthRegisterController).create();
    await File('$viewsPagesAuthRegisterController/register_controller.dart')
        .writeAsString(registerController);

    // views pages auth register model
    const viewsPagesAuthRegisterModel = '$viewsPagesAuthRegister/model';
    await Directory(viewsPagesAuthRegisterModel).create();
    await File('$viewsPagesAuthRegisterModel/register_model.dart')
        .writeAsString(registerModel);
    await File('$viewsPagesAuthRegisterModel/register_model.g.dart')
        .writeAsString(registerModelG);

    // views pages auth register view
    const viewsPagesAuthRegisterView = '$viewsPagesAuthRegister/view';
    await Directory(viewsPagesAuthRegisterView).create();
    await File('$viewsPagesAuthRegisterView/register.dart')
        .writeAsString(register);

    // views pages auth splash
    const viewsPagesAuthSplash = '$viewsPagesAuth/splash';
    await Directory(viewsPagesAuthSplash).create();

    // views pages auth splash binding
    const viewsPagesAuthSplashBinding = '$viewsPagesAuthSplash/binding';
    await Directory(viewsPagesAuthSplashBinding).create();
    await File('$viewsPagesAuthSplashBinding/splash_binding.dart')
        .writeAsString(splashBinding);

    // views pages auth splash controller
    const viewsPagesAuthSplashController = '$viewsPagesAuthSplash/controller';
    await Directory(viewsPagesAuthSplashController).create();
    await File('$viewsPagesAuthSplashController/splash_controller.dart')
        .writeAsString(splashController);

    // views pages auth splash view
    const viewsPagesAuthSplashView = '$viewsPagesAuthSplash/view';
    await Directory(viewsPagesAuthSplashView).create();
    await File('$viewsPagesAuthSplashView/splash.dart').writeAsString(splash);

    // views pages bottomBar
    const viewsPagesBottomBar = '$viewsPages/bottomBar';
    await Directory(viewsPagesBottomBar).create();

    // views pages bottomBar binding
    const viewsPagesAuthBottomBarBinding = '$viewsPagesBottomBar/binding';
    await Directory(viewsPagesAuthBottomBarBinding).create();
    await File(
            '$viewsPagesAuthBottomBarBinding/bottom_navigation_bar_binding.dart')
        .writeAsString(bottomNavigationBarBinding);

    // views pages bottomBar consts
    const viewsPagesAuthBottomBarConsts = '$viewsPagesBottomBar/consts';
    await Directory(viewsPagesAuthBottomBarConsts).create();
    await File('$viewsPagesAuthBottomBarConsts/bottom_bar_consts.dart')
        .writeAsString(bottomBarConsts);

    // views pages bottomBar controller
    const viewsPagesAuthBottomBarController = '$viewsPagesBottomBar/controller';
    await Directory(viewsPagesAuthBottomBarController).create();
    await File(
            '$viewsPagesAuthBottomBarController/bottom_navigation_bar_controller.dart')
        .writeAsString(bottomNavigationBarController);
    await File('$viewsPagesAuthBottomBarController/page_showed_controller.dart')
        .writeAsString(pageShowedController);

    // views pages bottomBar enums
    const viewsPagesAuthBottomBarEnums = '$viewsPagesBottomBar/enums';
    await Directory(viewsPagesAuthBottomBarEnums).create();
    await File('$viewsPagesAuthBottomBarEnums/bottom_bar_enums.dart')
        .writeAsString(bottomBarEnums);

    // views pages bottomBar view
    const viewsPagesAuthBottomBarView = '$viewsPagesBottomBar/view';
    await Directory(viewsPagesAuthBottomBarView).create();
    await File('$viewsPagesAuthBottomBarView/bottom_bar.dart')
        .writeAsString(bottomNavigationBars);

    // views pages bottomBar widgets
    const viewsPagesAuthBottomBarWidgets = '$viewsPagesBottomBar/widgets';
    await Directory(viewsPagesAuthBottomBarWidgets).create();
    await File('$viewsPagesAuthBottomBarWidgets/page_showed.dart')
        .writeAsString(pageShowed);

    // views pages home
    const viewsPagesHome = '$viewsPages/home';
    await Directory(viewsPagesHome).create();

    // views pages home view
    const viewsPagesHomeView = '$viewsPagesHome/view';
    await Directory(viewsPagesHomeView).create();
    await File('$viewsPagesHomeView/home_detail.dart')
        .writeAsString(detailPage);
    await File('$viewsPagesHomeView/home_page.dart').writeAsString(homePage);

    // views pages profile
    const viewsPagesProfile = '$viewsPages/profile';
    await Directory(viewsPagesProfile).create();

    // views pages profile binding
    const viewsPagesProfileBindings = '$viewsPagesProfile/binding';
    await Directory(viewsPagesProfileBindings).create();
    await File('$viewsPagesProfileBindings/profile_binding.dart')
        .writeAsString(profileBinding);

    // views pages profile controller
    const viewsPagesProfileController = '$viewsPagesProfile/controller';
    await Directory(viewsPagesProfileController).create();
    await File('$viewsPagesProfileController/profile_controller.dart')
        .writeAsString(profileController);

    // views pages profile view
    const viewsPagesProfileView = '$viewsPagesProfile/view';
    await Directory(viewsPagesProfileView).create();
    await File('$viewsPagesProfileView/profile.dart')
        .writeAsString(profile);

    // views widgets
    const viewsWidgets = 'lib/views/widgets';
    await Directory(viewsWidgets).create();

    // views widgets auth
    const viewsWidgetsAuth = '$viewsWidgets/auth';
    await Directory(viewsWidgetsAuth).create();
    await File('$viewsWidgetsAuth/have_an_account.dart')
        .writeAsString(haveAnAccount);

    // views widgets custom
    const viewsWidgetsCustom = '$viewsWidgets/custom';
    await Directory(viewsWidgetsCustom).create();
    await File('$viewsWidgetsCustom/custom_back_button.dart')
        .writeAsString(customBackButton);
    await File('$viewsWidgetsCustom/custom_button.dart')
        .writeAsString(customButton);
    await File('$viewsWidgetsCustom/custom_input.dart')
        .writeAsString(customInput);
    await File('$viewsWidgetsCustom/custom_loading.dart')
        .writeAsString(customLoading);
  }

  static Future createMain() async {
    await File('lib/main.dart').writeAsString(mainPage);
  }

  static Future createScripts() async {
    const scripts = 'scripts';
    await Directory(scripts).create();
    await File('$scripts/build.sh').writeAsString(script);
  }
}
