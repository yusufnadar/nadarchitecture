import 'package:get_it/get_it.dart';
import '../../base/base_exception.dart';
import 'local_service.dart';
import 'network_service.dart';
import 'route_service.dart';
import 'theme_service.dart';

class GetItService {
  static final getIt = GetIt.instance;

  static void setupSingletons() {
    getIt.registerLazySingleton(() => LocalService());
    getIt.registerLazySingleton(() => ThemeService());
    getIt.registerLazySingleton(() => RouteService());
    getIt.registerLazySingleton(() => BaseException());
    getIt.registerLazySingleton(() => NetworkService());
  }
}
    