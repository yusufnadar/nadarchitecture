const networkHelper = """
import 'package:dio/dio.dart';
import '../../../../common/model/token/token_model.dart';
import '../../../../common/view_model/user/user_view_model.dart';
import '../../../consts/end_point/app_end_points.dart';
import '../../../consts/enum/http_type_enums.dart';
import '../../../consts/local/app_locals.dart';
import '../../get_it/get_it_service.dart';
import '../../local/local_service.dart';
import '../mapper/api_model_mapper.dart';
import '../network_service.dart';

class NetworkHelper with DioMixin {
  final _networkService = getIt<NetworkService>();
  final _localService = getIt<LocalService>();

  Future<void> onError(DioException exception, ErrorInterceptorHandler handler) async {
    if (exception.response?.statusCode == 401) {
      await refreshToken(exception, handler);
    }
  }

  Future<void> refreshToken(DioException exception, ErrorInterceptorHandler handler) async {
    try {
      await _networkService.call(
        AppEndpoints.refreshToken,
        httpTypes: HttpTypes.post,
        data: {},
        mapper: (json) async {
          final response = APIModelMapper.jsonToItem(json, TokenModel.fromJson);
          await _localService.write(AppLocals.accessToken, response.accessToken);
          await _localService.write(AppLocals.refreshToken, response.refreshToken);
          exception.requestOptions.headers['Authorization'] = 'Bearer \${response.accessToken}';
          return handler.resolve(await fetch(exception.requestOptions));
        },
      );
    } catch (_) {
      await getIt<UserViewModel>().logout();
    }
  }
}
""";