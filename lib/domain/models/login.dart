import 'package:freezed_annotation/freezed_annotation.dart';
part 'login.freezed.dart';
@freezed
class Login with _$Login {
  const factory Login({
    required int code,
    required String message,
    required LoginResult result,
  }) = _Login;
}

@freezed
class LoginResult with _$LoginResult {
  const factory LoginResult({
    required String token,
    required bool authenticated,
  }) = _LoginResult;
}
