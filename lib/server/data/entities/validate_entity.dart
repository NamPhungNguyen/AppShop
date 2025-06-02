import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_entity.freezed.dart';
part 'validate_entity.g.dart';

@freezed
class ValidateEntity with _$ValidateEntity {
  const factory ValidateEntity({
    required int code,
    required String message,
  }) = _ValidateEntity;

  factory ValidateEntity.fromJson(Map<String, dynamic> json) =>
      _$ValidateEntityFromJson(json);
}
