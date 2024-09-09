library nadarchitecture;

import 'dart:io';

import 'package:nadarchitecture/arch/common/models/token_model.dart';
import 'package:nadarchitecture/arch/common/models/user_model.dart';
import 'package:nadarchitecture/arch/common/view_model/user_view_model.dart';
import 'package:nadarchitecture/arch/common/widget/app_logo.dart';
import 'package:nadarchitecture/arch/common/widget/custom_button.dart';
import 'package:nadarchitecture/arch/common/widget/custom_input.dart';
import 'package:nadarchitecture/arch/core/base/model/base_error_model.dart';
import 'package:nadarchitecture/arch/core/base/model/base_pagination_model.dart';
import 'package:nadarchitecture/arch/core/constants/color/app_colors.dart';
import 'package:nadarchitecture/arch/core/constants/local/app_locals.dart';
import 'package:nadarchitecture/arch/core/constants/route/app_routes.dart';
import 'package:nadarchitecture/arch/core/constants/text_style/app_text_styles.dart';
import 'package:nadarchitecture/arch/core/constants/theme/app_themes.dart';
import 'package:nadarchitecture/arch/core/helper/extension/string.dart';
import 'package:nadarchitecture/arch/core/helper/init/helper_init.dart';
import 'package:nadarchitecture/arch/core/services/logger/logger_service.dart';
import 'package:nadarchitecture/arch/core/services/network/helper/network_helper.dart';
import 'package:nadarchitecture/arch/core/services/route/app_router.dart';
import 'package:nadarchitecture/arch/core/services/route/route_service.dart';
import 'package:nadarchitecture/arch/features/home/presentation/mixin/home_mixin.dart';
import 'package:nadarchitecture/arch/features/home/presentation/view/home_view.dart';
import 'package:nadarchitecture/arch/features/login/data/data_sources/login_data_source.dart';
import 'package:nadarchitecture/arch/features/login/data/models/login_request/login_request_model.dart';
import 'package:nadarchitecture/arch/features/login/data/models/login_response/login_response_model.dart';
import 'package:nadarchitecture/arch/features/login/data/repositories/login_repository_impl.dart';
import 'package:nadarchitecture/arch/features/login/domain/entities/login_response/login_response_entity.dart';
import 'package:nadarchitecture/arch/features/login/domain/repositories/login_repository.dart';
import 'package:nadarchitecture/arch/features/login/presentation/mixin/login_mixin.dart';
import 'package:nadarchitecture/arch/features/login/presentation/view/login_view.dart';
import 'package:nadarchitecture/arch/features/test/data/data_sources/test_data_source.dart';
import 'package:nadarchitecture/arch/features/test/data/models/test_model.dart';
import 'package:nadarchitecture/arch/features/test/data/repositories/test_repository_impl.dart';
import 'package:nadarchitecture/arch/features/test/domain/entities/test_entity.dart';
import 'package:nadarchitecture/arch/features/test/domain/repositories/test_repository.dart';
import 'package:nadarchitecture/arch/features/test/presentation/mixin/test_mixin.dart';
import 'package:nadarchitecture/arch/features/test/presentation/view/test_view.dart';
import 'package:nadarchitecture/arch/features/test/presentation/view_model/test_view_model.dart';
import '../../arch/core/constants/app/app_constants.dart';
import '../../arch/core/services/local/local_service.dart';
import '../../arch/core/services/network/network_service.dart';
import '../../arch/core/services/theme/theme_service.dart';
import '../../arch/main.dart';
import 'arch/core/constants/end_point/app_end_points.dart';
import 'arch/core/constants/enum/http_types_enums.dart';
import 'arch/core/helper/extension/color.dart';
import 'arch/core/helper/extension/context.dart';
import 'arch/core/services/get_it/get_it_service.dart';
import 'arch/core/services/network/mapper/api_model_mapper.dart';
import 'arch/features/login/presentation/view_model/login_view_model.dart';
import 'scripts/build_sh.dart';

const pubspec = """
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.6
  get_it: ^7.7.0
  get_storage: ^2.1.1
  dio: ^5.4.3+1
  flutter_native_splash: ^2.4.0
  dartz: ^0.10.1
  flutter_svg: ^2.0.10+1
  flutter_screenutil: ^5.9.3
  logger: ^2.3.0
  provider: ^6.1.2
  freezed_annotation: ^2.4.1
  json_annotation: ^4.9.0

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^3.0.0
  build_runner: ^2.4.11
  json_serializable: ^6.8.0
  freezed: ^2.5.2
  flutter_gen_runner: ^5.5.0+1

flutter_gen:
  output: lib/core/consts/gen/
  integrations:
    flutter_svg: true
    lottie: true

flutter_native_splash:
  color: "#058071"
  image: assets/images/logo.png
  android: true
  ios: true
  android_12:
    color: "#058071"
    image: assets/images/logo.png

flutter:

  uses-material-design: true

  # assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg

  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  """;

class Architecture {
  static Future<void> createArchitecture() async {
    await changePubspecYaml();
    await createCommon();
    await createCore();
    await createFeatures();
    await createMain();
    await createScripts();
    await runBuildRunner();
  }

  static Future<void> runBuildRunner() async {
    await Process.run('dart', ['run', 'build_runner', 'build']);
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
    const common = 'lib/common';
    await Directory(common).create();

    // viewModels
    const viewModels = '$common/view_model';
    await Directory(viewModels).create();
    const userViewModelI = '$viewModels/user';
    await Directory(userViewModelI).create();
    await File('$userViewModelI/user_view_model.dart').writeAsString(userViewModel);

    // models
    const models = '$common/model';
    await Directory(models).create();

    // user model
    const userModelI = '$models/user';
    await Directory(userModelI).create();
    await File('$userModelI/user_model.dart').writeAsString(userModel);

    // token model
    const tokenModelI = '$models/token';
    await Directory(tokenModelI).create();
    await File('$tokenModelI/token_model.dart').writeAsString(tokenModel);

    // widget
    const widgets = '$common/widget';
    await Directory(widgets).create();
    await File('$widgets/app_logo.dart').writeAsString(appLogo);
    await File('$widgets/custom_button.dart').writeAsString(customButton);
    await File('$widgets/custom_input.dart').writeAsString(customInput);
  }

  static Future<void> createCore() async {
    const core = 'lib/core';
    await Directory(core).create();

    // base
    const base = '$core/base';
    await Directory(base).create();

    // base model
    const baseModel = '$base/model';
    await Directory(baseModel).create();

    // base error model
    const baseErrorModelI = '$baseModel/error_model';
    await Directory(baseErrorModelI).create();
    await File('$baseErrorModelI/base_error_model.dart').writeAsString(baseErrorModel);

    // base pagination model
    const basePaginationModelI = '$baseModel/pagination_model';
    await Directory(basePaginationModelI).create();
    await File('$basePaginationModelI/base_pagination_model.dart')
        .writeAsString(basePaginationModel);

    // consts
    const consts = '$core/consts';
    await Directory(consts).create();

    // app constants
    const app = '$consts/app';
    await Directory(app).create();
    await File('$app/app_constants.dart').writeAsString(appConstants);

    // color constants
    const colors = '$consts/color';
    await Directory(colors).create();
    await File('$colors/app_colors.dart').writeAsString(appColors);

    // endPoint constants
    const endPoints = '$consts/end_point';
    await Directory(endPoints).create();
    await File('$endPoints/app_end_points.dart').writeAsString(appEndPoints);

    // enums
    const enums = '$consts/enum';
    await Directory(enums).create();
    await File('$enums/http_type_enums.dart').writeAsString(httpTypesEnums);

    // local constants
    const local = '$consts/local';
    await Directory(local).create();
    await File('$local/app_locals.dart').writeAsString(appLocals);

    // route constants
    const route = '$consts/route';
    await Directory(route).create();
    await File('$route/app_routes.dart').writeAsString(appRoutes);

    // text styles constants
    const textStyle = '$consts/text_style';
    await Directory(textStyle).create();
    await File('$textStyle/app_text_styles.dart').writeAsString(appTextStyles);

    // app themes
    const theme = '$consts/theme';
    await Directory(theme).create();
    await File('$theme/app_themes.dart').writeAsString(appThemes);

    // helper
    const helper = '$core/helper';
    await Directory(helper).create();
    const extension = '$helper/extension';
    await Directory(extension).create();
    await File('$extension/color.dart').writeAsString(colorExtension);
    await File('$extension/context.dart').writeAsString(contextExtension);
    await File('$extension/string.dart').writeAsString(stringExtension);

    // init
    const init = '$helper/init';
    await Directory(init).create();
    await File('$init/helper_init.dart').writeAsString(helperInit);

    // services
    const services = '$core/services';
    await Directory(services).create();

    // get_it service
    const getIt = '$services/get_it';
    await Directory(getIt).create();
    await File('$getIt/get_it_service.dart').writeAsString(getItService);

    // local service
    const localServiceI = '$services/local';
    await Directory(localServiceI).create();
    await File('$localServiceI/local_service.dart').writeAsString(localService);

    // route service
    const routeServiceI = '$services/route';
    await Directory(routeServiceI).create();
    await File('$routeServiceI/app_router.dart').writeAsString(appRouter);
    await File('$routeServiceI/route_service.dart').writeAsString(routeService);

    // theme service
    const themeServiceI = '$services/theme';
    await Directory(themeServiceI).create();
    await File('$themeServiceI/theme_service.dart').writeAsString(themeService);

    // logger service
    const loggerServiceI = '$services/logger';
    await Directory(loggerServiceI).create();
    await File('$loggerServiceI/logger_service.dart').writeAsString(loggerService);

    // network service
    const networkServiceI = '$services/network';
    await Directory(networkServiceI).create();
    await File('$networkServiceI/network_service.dart').writeAsString(networkService);

    // network helper
    const networkHelperI = '$services/network/helper';
    await Directory(networkHelperI).create();
    await File('$networkHelperI/network_helper.dart').writeAsString(networkHelper);

    // network mapper
    const apiModelMapperI = '$services/network/mapper';
    await Directory(apiModelMapperI).create();
    await File('$apiModelMapperI/api_model_mapper.dart').writeAsString(apiModelMapper);
  }

  static Future<void> createFeatures() async {
    const features = 'lib/features';
    await Directory(features).create();

    // home
    const homePage = '$features/home';
    await Directory(homePage).create();

    // home presentation
    const homePresentation = '$homePage/presentation';
    await Directory(homePresentation).create();

    // home presentation mixin
    const homeMixinI = '$homePresentation/mixin';
    await Directory(homeMixinI).create();
    await File('$homeMixinI/home_mixin.dart').writeAsString(homeMixin);

    // home presentation view
    const homeViewI = '$homePresentation/view';
    await Directory(homeViewI).create();
    await File('$homeViewI/home_view.dart').writeAsString(homeView);

    // login
    const loginPage = '$features/login';
    await Directory(loginPage).create();

    // login data
    const loginData = '$loginPage/data';
    await Directory(loginData).create();

    // login data sources
    const loginDataSourcesI = '$loginData/data_sources';
    await Directory(loginDataSourcesI).create();
    await File('$loginDataSourcesI/login_data_source.dart').writeAsString(loginDataSource);

    // login data model
    const loginDataModel = '$loginData/models';
    await Directory(loginDataModel).create();

    // login request model
    const loginRequest = '$loginDataModel/login_request';
    await Directory(loginRequest).create();
    await File('$loginRequest/login_request_model.dart').writeAsString(loginRequestModel);

    // login response model
    const loginResponse = '$loginDataModel/login_response';
    await Directory(loginResponse).create();
    await File('$loginResponse/login_response_model.dart').writeAsString(loginResponseModel);

    // login repositories
    const loginRepositoryImplI = '$loginData/repositories';
    await Directory(loginRepositoryImplI).create();
    await File('$loginRepositoryImplI/login_repository_impl.dart')
        .writeAsString(loginRepositoryImpl);

    // login domain
    const loginDomain = '$loginPage/domain';
    await Directory(loginDomain).create();

    // login domain entities
    const loginDomainEntities = '$loginDomain/entities';
    await Directory(loginDomainEntities).create();
    const loginResponseEntities = '$loginDomainEntities/login_response';
    await Directory(loginResponseEntities).create();
    await File('$loginResponseEntities/login_response_entity.dart')
        .writeAsString(loginResponseEntity);

    // login domain repositories
    const loginDomainRepositories = '$loginDomain/repositories';
    await Directory(loginDomainRepositories).create();
    await File('$loginDomainRepositories/login_repository.dart').writeAsString(loginRepository);

    // login presentation
    const loginPresentation = '$loginPage/presentation';
    await Directory(loginPresentation).create();

    // login presentation mixin
    const loginPresentationMixin = '$loginPresentation/mixin';
    await Directory(loginPresentationMixin).create();
    await File('$loginPresentationMixin/login_mixin.dart').writeAsString(loginMixin);

    // login presentation view
    const loginPresentationView = '$loginPresentation/view';
    await Directory(loginPresentationView).create();
    await File('$loginPresentationView/login_view.dart').writeAsString(loginView);

    // login presentation viewModel
    const loginPresentationViewModel = '$loginPresentation/view_model';
    await Directory(loginPresentationViewModel).create();
    await File('$loginPresentationViewModel/login_view_model.dart').writeAsString(loginViewModel);

    // test
    const testPage = '$features/test';
    await Directory(testPage).create();

    // test data
    const testData = '$testPage/data';
    await Directory(testData).create();

    // test data sources
    const testDataSourcesI = '$testData/data_sources';
    await Directory(testDataSourcesI).create();
    await File('$testDataSourcesI/test_data_source.dart').writeAsString(testDataSource);

    // test data model
    const testDataModel = '$testData/models';
    await Directory(testDataModel).create();
    await File('$testDataModel/test_model.dart').writeAsString(testModel);

    // test repositories
    const testRepositoryImplI = '$testData/repositories';
    await Directory(testRepositoryImplI).create();
    await File('$testRepositoryImplI/test_repository_impl.dart').writeAsString(testRepositoryImpl);

    // test domain
    const testDomain = '$testPage/domain';
    await Directory(testDomain).create();

    // test domain entities
    const testDomainEntities = '$testDomain/entities';
    await Directory(testDomainEntities).create();
    await File('$testDomainEntities/test_entity.dart').writeAsString(testEntity);

    // test domain repositories
    const testDomainRepositories = '$testDomain/repositories';
    await Directory(testDomainRepositories).create();
    await File('$testDomainRepositories/test_repository.dart').writeAsString(testRepository);

    // test presentation
    const testPresentation = '$testPage/presentation';
    await Directory(testPresentation).create();

    // test presentation mixin
    const testPresentationMixin = '$testPresentation/mixin';
    await Directory(testPresentationMixin).create();
    await File('$testPresentationMixin/test_mixin.dart').writeAsString(testMixin);

    // test presentation view
    const testPresentationView = '$testPresentation/view';
    await Directory(testPresentationView).create();
    await File('$testPresentationView/test_view.dart').writeAsString(testView);

    // test presentation viewModel
    const testPresentationViewModel = '$testPresentation/view_model';
    await Directory(testPresentationViewModel).create();
    await File('$testPresentationViewModel/test_view_model.dart').writeAsString(testViewModel);
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
