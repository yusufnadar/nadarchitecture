const tokenModel = """
import 'package:json_annotation/json_annotation.dart';
import '../../core/base/base_model.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends BaseModel {
    TokenModel({this.accessToken, this.refreshToken});

    final String? accessToken;
    final String? refreshToken;

    @override
    fromJson(Map<String, dynamic> json) => _\$TokenModelFromJson(json);

    @override
    Map<String, dynamic> toJson() => _\$TokenModelToJson(this);
}
    """;

