import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_entity.g.dart';
part 'signup_entity.freezed.dart';

@freezed
class SignUpEntity with _$SignUpEntity {
  const factory SignUpEntity({
    required int code,
    required String message,
  }) = _SignUpEntity;

  factory SignUpEntity.fromJson(Map<String, dynamic> json) => _$SignUpEntityFromJson(json);
}
