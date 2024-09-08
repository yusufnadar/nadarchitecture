// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseErrorModelImpl _$$BaseErrorModelImplFromJson(Map<String, dynamic> json) =>
    _$BaseErrorModelImpl(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$BaseErrorModelImplToJson(
        _$BaseErrorModelImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
