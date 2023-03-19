const networkService = """
// ignore_for_file: join_return_with_assignment, overridden_fields

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../../../common/models/pagination_model.dart';
import '../../../core/services/network/response_parser.dart';
import '../../base/error/base_error.dart';
import '../../base/model/base_model.dart';
import '../../exports/constants_exports.dart';
import '../local/local_service.dart';
import 'response_model.dart';

class NetworkService with DioMixin {
  static NetworkService? _instance;

  static NetworkService? get instance {
    _instance ??= NetworkService._init();
    return _instance;
  }

  NetworkService._init() {
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = IOHttpClientAdapter();
  }

  @override
  final BaseOptions options = BaseOptions(
    baseUrl: EndPointConstants.baseUrl,
  );

  Future<IResponseModel<R>> send<T extends BaseModel, R>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    bool? isPagination,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await request<dynamic>(
      path,
      data: data,
      options: Options(
        method: type.name,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer \${LocalService.instance.read(LocalConstants.accessToken)}'
        },
      ),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        if (isPagination != true) {
          final model =
              responseParser<T, R>(parseModel as BaseModel<T>, response.data);
          return ResponseModel<R>(data: model);
        } else {
          final model = PaginationModel<T>()
              .fromJson(response.data, parseModel)
              .results as R;
          return ResponseModel<R>(data: model);
        }
      default:
        return ResponseModel(
          error: BaseError(response.data),
        );
    }
  }
}
""";