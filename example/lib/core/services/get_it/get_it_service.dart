import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import '../../../common/view_model/user/user_view_model.dart';
import '../../../features/login/data/data_sources/login_data_source.dart';
import '../../../features/login/data/repositories/login_repository_impl.dart';
import '../../../features/login/presentation/view_model/login_view_model.dart';
import '../../../features/test/data/data_sources/test_data_source.dart';
import '../../../features/test/data/repositories/test_repository_impl.dart';
import '../../../features/test/presentation/view_model/test_view_model.dart';
import '../local/local_service.dart';
import '../network/network_service.dart';
import '../route/route_service.dart';
import '../theme/theme_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<LocalService>(LocalService(GetStorage()));
  getIt.registerSingleton<NetworkService>(NetworkService(Dio(), getIt<LocalService>())).init();
  getIt.registerSingleton<RouteService>(RouteService());
  getIt.registerSingleton<ThemeService>(ThemeService(getIt<LocalService>()));
  getIt.registerSingleton<UserViewModel>(
    UserViewModel(getIt<RouteService>(), getIt<LocalService>()),
  );

  /// TEST VIEW MODEL

  getIt.registerLazySingleton<TestViewModel>(() => TestViewModel(getIt<TestRepositoryImpl>()));

  getIt.registerLazySingleton<TestRepositoryImpl>(
      () => TestRepositoryImpl(getIt<TestRemoteDataSourceImpl>()));

  getIt.registerLazySingleton<TestRemoteDataSourceImpl>(
    () => TestRemoteDataSourceImpl(getIt<NetworkService>()),
  );

  /// LOGIN VIEW MODEL

  getIt.registerLazySingleton<LoginViewModel>(
    () => LoginViewModel(
      getIt<LocalService>(),
      getIt<RouteService>(),
      getIt<LoginRepositoryImpl>(),
    ),
  );

  getIt.registerLazySingleton<LoginRepositoryImpl>(
    () => LoginRepositoryImpl(getIt<LoginRemoteDataSource>()),
  );

  getIt.registerLazySingleton<LoginRemoteDataSourceImpl>(
    () => LoginRemoteDataSourceImpl(getIt<NetworkService>()),
  );
}
