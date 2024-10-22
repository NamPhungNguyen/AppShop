// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginEntityImpl _$$LoginEntityImplFromJson(Map<String, dynamic> json) =>
    _$LoginEntityImpl(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      result:
          LoginResultEntity.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginEntityImplToJson(_$LoginEntityImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'result': instance.result,
    };

_$LoginResultEntityImpl _$$LoginResultEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginResultEntityImpl(
      token: json['token'] as String,
      authenticated: json['authenticated'] as bool,
    );

Map<String, dynamic> _$$LoginResultEntityImplToJson(
        _$LoginResultEntityImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'authenticated': instance.authenticated,
    };
