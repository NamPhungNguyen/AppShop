// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_revenue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MonthlyRevenue {
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyRevenue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyRevenueCopyWith<MonthlyRevenue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyRevenueCopyWith<$Res> {
  factory $MonthlyRevenueCopyWith(
          MonthlyRevenue value, $Res Function(MonthlyRevenue) then) =
      _$MonthlyRevenueCopyWithImpl<$Res, MonthlyRevenue>;
  @useResult
  $Res call({int month, int year, double revenue});
}

/// @nodoc
class _$MonthlyRevenueCopyWithImpl<$Res, $Val extends MonthlyRevenue>
    implements $MonthlyRevenueCopyWith<$Res> {
  _$MonthlyRevenueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyRevenue
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
abstract class _$$MonthlyRevenueImplCopyWith<$Res>
    implements $MonthlyRevenueCopyWith<$Res> {
  factory _$$MonthlyRevenueImplCopyWith(_$MonthlyRevenueImpl value,
          $Res Function(_$MonthlyRevenueImpl) then) =
      __$$MonthlyRevenueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int month, int year, double revenue});
}

/// @nodoc
class __$$MonthlyRevenueImplCopyWithImpl<$Res>
    extends _$MonthlyRevenueCopyWithImpl<$Res, _$MonthlyRevenueImpl>
    implements _$$MonthlyRevenueImplCopyWith<$Res> {
  __$$MonthlyRevenueImplCopyWithImpl(
      _$MonthlyRevenueImpl _value, $Res Function(_$MonthlyRevenueImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyRevenue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? revenue = null,
  }) {
    return _then(_$MonthlyRevenueImpl(
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

class _$MonthlyRevenueImpl implements _MonthlyRevenue {
  const _$MonthlyRevenueImpl(
      {required this.month, required this.year, required this.revenue});

  @override
  final int month;
  @override
  final int year;
  @override
  final double revenue;

  @override
  String toString() {
    return 'MonthlyRevenue(month: $month, year: $year, revenue: $revenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyRevenueImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.revenue, revenue) || other.revenue == revenue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, year, revenue);

  /// Create a copy of MonthlyRevenue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyRevenueImplCopyWith<_$MonthlyRevenueImpl> get copyWith =>
      __$$MonthlyRevenueImplCopyWithImpl<_$MonthlyRevenueImpl>(
          this, _$identity);
}

abstract class _MonthlyRevenue implements MonthlyRevenue {
  const factory _MonthlyRevenue(
      {required final int month,
      required final int year,
      required final double revenue}) = _$MonthlyRevenueImpl;

  @override
  int get month;
  @override
  int get year;
  @override
  double get revenue;

  /// Create a copy of MonthlyRevenue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyRevenueImplCopyWith<_$MonthlyRevenueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
