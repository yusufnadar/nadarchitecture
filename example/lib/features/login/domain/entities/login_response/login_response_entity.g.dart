// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseEntityImpl _$$LoginResponseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginResponseEntityImpl(
      email: json['email'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$$LoginResponseEntityImplToJson(
        _$LoginResponseEntityImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
