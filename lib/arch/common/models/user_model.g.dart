const userModelG =
    """
part of 'user_model.dart';

UserModel _\$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      profilePhoto: json['profilePhoto'] as String?,
    );

Map<String, dynamic> _\$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'profilePhoto': instance.profilePhoto,
    };

    """;