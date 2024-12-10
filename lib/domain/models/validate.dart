  import 'package:freezed_annotation/freezed_annotation.dart';

  part 'validate.freezed.dart';

  @freezed
  class Validate with _$Validate {
    const factory Validate({
      required int code,
      required String message,
    }) = _Validate;
  }
