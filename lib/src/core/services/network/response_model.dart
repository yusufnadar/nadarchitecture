// ignore_for_file: overridden_fields

import '../../base/error/base_error.dart';

abstract class IResponseModel<T> {
  T? data;
  BaseError? error;
}

class ResponseModel<T> extends IResponseModel<T> {
  ResponseModel({this.data, this.error});

  @override
  final T? data;
  @override
  final BaseError? error;
}
