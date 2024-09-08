// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_model.freezed.dart';
part 'login_request_model.g.dart';

@freezed
class LoginRequestModel with _$LoginRequestModel {
  @JsonSerializable(explicitToJson: true)
  const factory LoginRequestModel({
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'password') String? password,
  }) = _LoginRequestModel;

  factory LoginRequestModel.fromJson(Map<String, Object?> json) =>
      _$LoginRequestModelFromJson(json);
}
