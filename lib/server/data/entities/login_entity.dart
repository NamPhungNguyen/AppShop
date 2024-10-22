import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_entity.freezed.dart';
part 'login_entity.g.dart';
@freezed
class LoginEntity with _$LoginEntity {
  const factory LoginEntity({
    required int code,
    required String message,
    required LoginResultEntity result,
}) = _LoginEntity;

  factory LoginEntity.fromJson(Map<String, dynamic> json) => _$LoginEntityFromJson(json);
}


@freezed
class LoginResultEntity with _$LoginResultEntity {
  const factory LoginResultEntity({
    required String token,
    required bool authenticated,
}) = _LoginResultEntity;

  factory LoginResultEntity.fromJson(Map<String, dynamic> json) => _$LoginResultEntityFromJson(json);
}