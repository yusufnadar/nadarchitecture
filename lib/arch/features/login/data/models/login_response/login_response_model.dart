const loginResponseModel= """
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _\$LoginResponseModel {
  @JsonSerializable(explicitToJson: true)
  const factory LoginResponseModel({
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'accessToken') String? accessToken,
    @JsonKey(name: 'refreshToken') String? refreshToken,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, Object?> json) =>
      _\$LoginResponseModelFromJson(json);
}
""";