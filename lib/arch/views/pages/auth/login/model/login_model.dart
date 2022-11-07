const loginModel =
    """
import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/base/base_model.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends BaseModel {
  String? email;
  String? password;

  LoginModel({this.email, this.password});

  @override
  Map<String, dynamic> toJson() => _\$LoginModelToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => _\$LoginModelFromJson(json);
}
    """;