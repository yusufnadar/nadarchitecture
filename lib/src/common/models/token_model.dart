import '../../core/base/model/base_model.dart';

class TokenModel extends BaseModel<TokenModel> {
  TokenModel({
    this.access,
    this.refresh,
  });

  String? access;
  String? refresh;

  @override
  TokenModel fromJson(Map<String, dynamic> json) {
    return TokenModel(
      access: json["access"],
      refresh: json["refresh"],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
      };
}
