import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_info_entity.freezed.dart';
part 'my_info_entity.g.dart';

@freezed
class MyInfoEntity with _$MyInfoEntity {
  const factory MyInfoEntity({required ResultInfo result}) = _MyInfoEntity;

  factory MyInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$MyInfoEntityFromJson(json);
}

@freezed
class ResultInfo with _$ResultInfo {
  const factory ResultInfo({
    required int id,
    String? username,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? profileImg,
  }) = _ResultInfo;

  factory ResultInfo.fromJson(Map<String, dynamic> json) =>
      _$ResultInfoFromJson(json);
}
