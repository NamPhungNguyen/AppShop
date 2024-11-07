// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpEntityImpl _$$SignUpEntityImplFromJson(Map<String, dynamic> json) =>
    _$SignUpEntityImpl(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      result:
          SignUpResultEntity.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SignUpEntityImplToJson(_$SignUpEntityImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'result': instance.result,
    };

_$SignUpResultEntityImpl _$$SignUpResultEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$SignUpResultEntityImpl(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$SignUpResultEntityImplToJson(
        _$SignUpResultEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };
