const userModel =
    """
import 'package:json_annotation/json_annotation.dart';
import '../../core/base/base_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends BaseModel {
  int? id;
  String? name;
  String? email;
  String? profilePhoto;

  UserModel({this.id, this.name, this.email, this.profilePhoto});

  @override
  fromJson(Map<String, dynamic> json) => _\$UserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _\$UserModelToJson(this);
}

    """;