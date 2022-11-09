const registerModelG = """
part of 'register_model.dart';

RegisterModel _\$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      email: json['email'] as String?,
      name: json['name'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _\$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'password': instance.password,
    };
    """;
