const networkService = """
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../base/model/error_model/base_error_model.dart';
import '../../consts/end_point/app_end_points.dart';
import '../../consts/enum/http_type_enums.dart';
import '../../consts/local/app_locals.dart';
import '../local/local_service.dart';
import 'helper/network_helper.dart';

class NetworkService with DioMixin {
  NetworkService(this._dio, this._localService);

  final Dio _dio;
  final LocalService _localService;
  late NetworkHelper _networkHelper;

  void init() {
    _networkHelper = NetworkHelper();
    _dio.httpClientAdapter = HttpClientAdapter();
    _dio.options = BaseOptions(baseUrl: AppEndpoints.baseUrl);
    _dio.interceptors.add(
      InterceptorsWrapper(onError: _networkHelper.onError),
    );
  }

  Future<Either<BaseErrorModel, T>> call<T>(
    String path, {
    Map<String, dynamic>? data,
    String? token,
    required T Function(dynamic json) mapper,
    bool? fileRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required HttpTypes httpTypes,
  }) async {
    try {
      return await sendRequest(
        path: path,
        data: data,
        token: token,
        method: httpTypes.name,
        mapper: mapper,
        queryParameters: queryParameters,
        headers: headers,
        fileRequest: fileRequest,
      );
    } on DioException catch (error) {
      log(error.requestOptions.uri.path);
      return sendDioException(error);
    } catch (error) {
      return sendException(error);
    }
  }

  Left<BaseErrorModel, T> sendException<T>(Object error) {
    return Left(BaseErrorModel.fromJson({'message': error.toString()}));
  }

  Left<BaseErrorModel, T> sendDioException<T>(DioException error) {
    if (error.response?.data != null) {
      return Left(BaseErrorModel.fromJson(error.response?.data));
    } else {
      return Left(BaseErrorModel.fromJson({'message': error.toString()}));
    }
  }

  Future<Either<BaseErrorModel, T>> sendRequest<T>({
    required String path,
    Map<String, dynamic>? data,
    String? method,
    String? token,
    required T Function(dynamic json) mapper,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool? fileRequest,
  }) async {
    late Response response;
    if (fileRequest == null) {
      response = await _dio.request(
        path,
        data: data,
        cancelToken: cancelToken,
        queryParameters: queryParameters,
        options: Options(
          method: method,
          headers: headers ??
              {
                Headers.contentTypeHeader: Headers.jsonContentType,
                'Authorization': 'Bearer \${token ?? _localService.read(AppLocals.accessToken)}'
              },
        ),
      );
    } else {
      response = await _dio.request(
        path,
        data: data != null ? FormData.fromMap(data) : null,
        cancelToken: cancelToken,
        queryParameters: queryParameters,
        options: Options(
          method: method,
          headers: {
            Headers.contentTypeHeader: Headers.multipartFormDataContentType,
            'Authorization': 'Bearer \${token ?? _localService.read(AppLocals.accessToken)}',
          },
        ),
      );
    }
    return Right(mapper(response.data['data']));
  }
}
""";