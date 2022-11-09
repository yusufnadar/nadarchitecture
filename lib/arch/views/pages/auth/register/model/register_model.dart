const registerModel = """
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/base/base_model.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends BaseModel {
  String? email;
  String? name;
  String? password;

  RegisterModel({this.email, this.name, this.password});

  @override
  fromJson(Map<String, dynamic> json) => _\$RegisterModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _\$RegisterModelToJson(this);
}
    """;
