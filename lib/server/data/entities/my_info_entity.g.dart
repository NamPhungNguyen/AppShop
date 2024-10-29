// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyInfoEntityImpl _$$MyInfoEntityImplFromJson(Map<String, dynamic> json) =>
    _$MyInfoEntityImpl(
      result: ResultInfo.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MyInfoEntityImplToJson(_$MyInfoEntityImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

_$ResultInfoImpl _$$ResultInfoImplFromJson(Map<String, dynamic> json) =>
    _$ResultInfoImpl(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profileImg: json['profileImg'] as String?,
    );

Map<String, dynamic> _$$ResultInfoImplToJson(_$ResultInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'profileImg': instance.profileImg,
    };
