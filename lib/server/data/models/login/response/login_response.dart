import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';
@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required int code,
    required String message,
    required LoginResult result,
}) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}


@freezed
class LoginResult with _$LoginResult {
  const factory LoginResult({
    required String token,
    required bool authenticated,
}) = _LoginResult;

  factory LoginResult.fromJson(Map<String, dynamic> json) => _$LoginResultFromJson(json);
}