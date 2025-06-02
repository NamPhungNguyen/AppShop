// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ValidateEntityImpl _$$ValidateEntityImplFromJson(Map<String, dynamic> json) =>
    _$ValidateEntityImpl(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$ValidateEntityImplToJson(
        _$ValidateEntityImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
