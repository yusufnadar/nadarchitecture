// ignore_for_file: join_return_with_assignment, overridden_fields, strict_raw_type
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../../../../src/core/mixins/show_bar.dart';
import '../../../common/models/pagination_model.dart';
import '../../../core/services/network/response_parser.dart';
import '../../base/model/base_model.dart';
import '../../exports/constants_exports.dart';
import '../local/local_service.dart';

class NetworkService with DioMixin, ShowBar {
  NetworkService._init() {
    interceptors.add(
      InterceptorsWrapper(
        onError: (DioError error, handler) async {
          if (DioErrorType.receiveTimeout == error.type ||
              DioErrorType.connectionTimeout == error.type) {
            showErrorBar(
              "Server is not reachable. Please verify your internet connection and try again",
            );
          } else if (DioErrorType.badResponse == error.type) {
            showErrorBar(
              "Bad response.",
            );
          }  else {
            switch (error.response?.statusCode) {
              case 401:
                // If a 401 response is received, refresh the access token
                String? newAccessToken = await refreshToken();

                // Update the request header with the new access token
                error.requestOptions.headers['Authorization'] =
                    'Bearer $newAccessToken';

                // Repeat the request with the updated header
                return handler.resolve(await fetch(error.requestOptions));
              default:
                showErrorBar(
                  error.message,
                );
                return handler.next(error);
            }
          }
        },
      ),
    );
    httpClientAdapter = IOHttpClientAdapter();
  }

  static NetworkService? _instance;

  static NetworkService? get instance {
    _instance ??= NetworkService._init();
    return _instance;
  }

  @override
  final BaseOptions options = BaseOptions(
    baseUrl: EndPointConstants.baseUrl,
  );

  Future<R?> send<T extends BaseModel?, R>(
    String path, {
    required HttpTypes type,
    required T? parseModel,
    dynamic data,
    bool? isPagination,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final response = await request<dynamic>(
        path,
        data: data,
        options: Options(
          method: type.name,
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${LocalService.instance.read(LocalConstants.accessToken)}'
          },
        ),
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.accepted:
        case HttpStatus.created:
        case HttpStatus.noContent:
          if (parseModel == null) {
            return null;
          }
          if (isPagination != true) {
            return responseParser<T, R>(
                parseModel as BaseModel<T>, response.data);
          } else {
            return PaginationModel<T>()
                .fromJson(response.data as Map<String, dynamic>, parseModel)
                .results as R;
          }
      }
    } catch (error) {
      showErrorBar(
        error,
      );
    }
    return null;
  }

  // refresh token
  Future<String?> refreshToken() async {
    return null;
  }
}

