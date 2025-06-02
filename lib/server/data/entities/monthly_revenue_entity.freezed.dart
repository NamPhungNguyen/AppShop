// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_revenue_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MonthlyRevenueEntity _$MonthlyRevenueEntityFromJson(Map<String, dynamic> json) {
  return _MonthlyRevenueEntity.fromJson(json);
}

/// @nodoc
mixin _$MonthlyRevenueEntity {
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;

  /// Serializes this MonthlyRevenueEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyRevenueEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyRevenueEntityCopyWith<MonthlyRevenueEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyRevenueEntityCopyWith<$Res> {
  factory $MonthlyRevenueEntityCopyWith(MonthlyRevenueEntity value,
          $Res Function(MonthlyRevenueEntity) then) =
      _$MonthlyRevenueEntityCopyWithImpl<$Res, MonthlyRevenueEntity>;
  @useResult
  $Res call({int month, int year, double revenue});
}

/// @nodoc
class _$MonthlyRevenueEntityCopyWithImpl<$Res,
        $Val extends MonthlyRevenueEntity>
    implements $MonthlyRevenueEntityCopyWith<$Res> {
  _$MonthlyRevenueEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyRevenueEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? revenue = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyRevenueEntityImplCopyWith<$Res>
    implements $MonthlyRevenueEntityCopyWith<$Res> {
  factory _$$MonthlyRevenueEntityImplCopyWith(_$MonthlyRevenueEntityImpl value,
          $Res Function(_$MonthlyRevenueEntityImpl) then) =
      __$$MonthlyRevenueEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int month, int year, double revenue});
}

/// @nodoc
class __$$MonthlyRevenueEntityImplCopyWithImpl<$Res>
    extends _$MonthlyRevenueEntityCopyWithImpl<$Res, _$MonthlyRevenueEntityImpl>
    implements _$$MonthlyRevenueEntityImplCopyWith<$Res> {
  __$$MonthlyRevenueEntityImplCopyWithImpl(_$MonthlyRevenueEntityImpl _value,
      $Res Function(_$MonthlyRevenueEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyRevenueEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? revenue = null,
  }) {
    return _then(_$MonthlyRevenueEntityImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyRevenueEntityImpl implements _MonthlyRevenueEntity {
  const _$MonthlyRevenueEntityImpl(
      {required this.month, required this.year, required this.revenue});

  factory _$MonthlyRevenueEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyRevenueEntityImplFromJson(json);

  @override
  final int month;
  @override
  final int year;
  @override
  final double revenue;

  @override
  String toString() {
    return 'MonthlyRevenueEntity(month: $month, year: $year, revenue: $revenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyRevenueEntityImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.revenue, revenue) || other.revenue == revenue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, month, year, revenue);

  /// Create a copy of MonthlyRevenueEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyRevenueEntityImplCopyWith<_$MonthlyRevenueEntityImpl>
      get copyWith =>
          __$$MonthlyRevenueEntityImplCopyWithImpl<_$MonthlyRevenueEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyRevenueEntityImplToJson(
      this,
    );
  }
}

abstract class _MonthlyRevenueEntity implements MonthlyRevenueEntity {
  const factory _MonthlyRevenueEntity(
      {required final int month,
      required final int year,
      required final double revenue}) = _$MonthlyRevenueEntityImpl;

  factory _MonthlyRevenueEntity.fromJson(Map<String, dynamic> json) =
      _$MonthlyRevenueEntityImpl.fromJson;

  @override
  int get month;
  @override
  int get year;
  @override
  double get revenue;

  /// Create a copy of MonthlyRevenueEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyRevenueEntityImplCopyWith<_$MonthlyRevenueEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
