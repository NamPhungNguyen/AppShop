import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    required List<User> result,
  }) = _UserResponse;
}

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String username,
    required String password,
    required String email,
    required String fullName,
    required String phoneNumber,
    String? profileImgUrl,
    required String createdAt,
    required String updatedAt,
  }) = _User;
}
