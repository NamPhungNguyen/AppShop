import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup.freezed.dart';

@freezed
class SignUp with _$SignUp {
  const factory SignUp({
    required int code,
    required String message,
    required SignUpResult result,
  }) = _SignUp;
}

@freezed
class SignUpResult with _$SignUpResult {
  const factory SignUpResult({
    required int id,
    required String username,
    required String fullName,
    required String email,
    required String phoneNumber,
  }) = _SignUpResult;
}
