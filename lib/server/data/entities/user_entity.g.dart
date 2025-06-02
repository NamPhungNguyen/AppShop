// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseEntityImpl _$$UserResponseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$UserResponseEntityImpl(
      result: (json['result'] as List<dynamic>)
          .map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserResponseEntityImplToJson(
        _$UserResponseEntityImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profileImgUrl: json['profileImgUrl'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'profileImgUrl': instance.profileImgUrl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
