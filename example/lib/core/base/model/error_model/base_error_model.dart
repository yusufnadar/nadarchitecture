import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_error_model.freezed.dart';
part 'base_error_model.g.dart';

@freezed
class BaseErrorModel with _$BaseErrorModel {
  const factory BaseErrorModel({
    @JsonKey(name: 'statusCode') int? statusCode,
    @JsonKey(name: 'message') String? message,
  }) = _BaseErrorModel;

  factory BaseErrorModel.fromJson(Map<String, Object?> json) =>
      _$BaseErrorModelFromJson(json);
}
