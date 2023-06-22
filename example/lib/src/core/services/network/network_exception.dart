import 'package:dio/dio.dart';

import '../../../../src/core/mixins/show_bar.dart';
import 'network_service.dart';

// İnternet isteği sonrası gelen hata mesajlarını handle ettiğimiz kısım
class NetworkException with ShowBar, DioMixin {
  NetworkException._init();

  static final NetworkException _instance = NetworkException._init();

  static NetworkException get instance => _instance;

  void Function(DioException exception, ErrorInterceptorHandler handler) onError() {
    return (DioException exception, handler) async {
      switch (exception.type) {
        case DioExceptionType.cancel:
          return showErrorBar(
            'Request to API server was cancelled',
          );
        case DioExceptionType.connectionTimeout:
          return showErrorBar(
            'Connection timeout with API server',
          );
        case DioExceptionType.sendTimeout:
          return showErrorBar(
            'Send timeout in connection with API server',
          );
        case DioExceptionType.receiveTimeout:
          return showErrorBar(
            'Receive timeout in connection with API server',
          );
        case DioExceptionType.badCertificate:
          return showErrorBar(
            'Bad certificate with API server',
          );
        case DioExceptionType.badResponse:
          return _handleError(
            exception.requestOptions,
            exception.response?.statusCode,
            exception.response?.data.toString(),
            handler,
          );
        case DioExceptionType.connectionError:
          return showErrorBar(
            'Connection error with API server',
          );
        case DioExceptionType.unknown:
          if (exception.error.toString().contains("SocketException")) {
            return showErrorBar('No Internet Or Wrong Host Request',
                title: exception.error.toString());
          } else {
            return showErrorBar('Unknown error', title: exception.error.toString());
          }
        default:
          return handler.next(exception);
      }
    };
  }

  Future<void> _handleError(RequestOptions requestOptions, int? statusCode,
      dynamic error, ErrorInterceptorHandler handler) async {
    switch (statusCode) {
      case 400:
        return showErrorBar(error, title: 'Bad request');
      case 401:
        // access tokenın süresi bitmişse yenileyip tekrardan istek atıyoruz
        String? newAccessToken = await NetworkService.instance?.refreshToken();
        requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
        return handler.resolve(await fetch(requestOptions));
      case 403:
        return showErrorBar(error, title: 'Forbidden');
      case 404:
        return showErrorBar(error, title: 'Server error');
      case 500:
        return showErrorBar(error, title: 'Internal server error');
      case 502:
        return showErrorBar(error, title: 'Bad gateway');
      default:
        return showErrorBar(error, title: 'Oops something went wrong');
    }
  }
}
