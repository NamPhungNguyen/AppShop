import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup.freezed.dart';
@freezed
class SignUp with _$SignUp {
  const factory SignUp({
    required int code,
    required String message,
  }) = _SignUp;
}