// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';
part 'token_model.g.dart';

@freezed
class TokenModel with _$TokenModel {
  @JsonSerializable(explicitToJson: true)
  const factory TokenModel({
    @JsonKey(name: 'accessToken') String? accessToken,
    @JsonKey(name: 'refreshToken') String? refreshToken,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}

