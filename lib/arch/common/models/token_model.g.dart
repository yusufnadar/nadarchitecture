const tokenModelG = """
part of 'token_model.dart';

TokenModel _\$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _\$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };        
""";
