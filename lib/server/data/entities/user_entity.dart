import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserResponseEntity with _$UserResponseEntity {
  const factory UserResponseEntity({
    required List<UserEntity> result,
  }) = _UserResponseEntity;

  factory UserResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$UserResponseEntityFromJson(json);
}

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    required String username,
    required String password,
    required String email,
    required String fullName,
    required String phoneNumber,
    String? profileImgUrl,
    required String createdAt,
    required String updatedAt,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
