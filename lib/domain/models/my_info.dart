import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_info.freezed.dart';

@freezed
class MyInfo with _$MyInfo {
  const factory MyInfo({required Result result}) = _MyInfo;
}

@freezed
class Result with _$Result {
  const factory Result({
    required int id,
    String? username,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? profileImg,
  }) = _Result;
}
