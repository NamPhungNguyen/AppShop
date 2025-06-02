import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_entity.freezed.dart';
part 'signup_entity.g.dart';

@freezed
class SignUpEntity with _$SignUpEntity {
  const factory SignUpEntity({
    required int code,
    required String message,
    required SignUpResultEntity result,
  }) = _SignUpEntity;

  factory SignUpEntity.fromJson(Map<String, dynamic> json) =>
      _$SignUpEntityFromJson(json);
}

@freezed
class SignUpResultEntity with _$SignUpResultEntity {
  const factory SignUpResultEntity({
    required int id,
    required String username,
    required String fullName,
    required String email,
    required String phoneNumber,
  }) = _SignUpResultEntity;

  factory SignUpResultEntity.fromJson(Map<String, dynamic> json) =>
      _$SignUpResultEntityFromJson(json);
}
