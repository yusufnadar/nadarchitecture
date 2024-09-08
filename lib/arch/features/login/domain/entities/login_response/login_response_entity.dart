const loginResponseEntity = """
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_entity.freezed.dart';
part 'login_response_entity.g.dart';

@freezed
class LoginResponseEntity with _\$LoginResponseEntity {
  @JsonSerializable(explicitToJson: true)
  const factory LoginResponseEntity({
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'accessToken') String? accessToken,
    @JsonKey(name: 'refreshToken') String? refreshToken,
  }) = _LoginResponseEntity;

  factory LoginResponseEntity.fromJson(Map<String, Object?> json) =>
      _\$LoginResponseEntityFromJson(json);
}
""";