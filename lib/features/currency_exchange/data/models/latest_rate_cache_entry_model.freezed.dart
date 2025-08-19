// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'latest_rate_cache_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LatestRateCacheEntryModel {

@HiveField(0) double get rate;@HiveField(1) DateTime get fetchedAt;
/// Create a copy of LatestRateCacheEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LatestRateCacheEntryModelCopyWith<LatestRateCacheEntryModel> get copyWith => _$LatestRateCacheEntryModelCopyWithImpl<LatestRateCacheEntryModel>(this as LatestRateCacheEntryModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LatestRateCacheEntryModel&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt));
}


@override
int get hashCode => Object.hash(runtimeType,rate,fetchedAt);

@override
String toString() {
  return 'LatestRateCacheEntryModel(rate: $rate, fetchedAt: $fetchedAt)';
}


}

/// @nodoc
abstract mixin class $LatestRateCacheEntryModelCopyWith<$Res>  {
  factory $LatestRateCacheEntryModelCopyWith(LatestRateCacheEntryModel value, $Res Function(LatestRateCacheEntryModel) _then) = _$LatestRateCacheEntryModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) double rate,@HiveField(1) DateTime fetchedAt
});




}
/// @nodoc
class _$LatestRateCacheEntryModelCopyWithImpl<$Res>
    implements $LatestRateCacheEntryModelCopyWith<$Res> {
  _$LatestRateCacheEntryModelCopyWithImpl(this._self, this._then);

  final LatestRateCacheEntryModel _self;
  final $Res Function(LatestRateCacheEntryModel) _then;

/// Create a copy of LatestRateCacheEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rate = null,Object? fetchedAt = null,}) {
  return _then(_self.copyWith(
rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,fetchedAt: null == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [LatestRateCacheEntryModel].
extension LatestRateCacheEntryModelPatterns on LatestRateCacheEntryModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LatestRateCacheEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LatestRateCacheEntryModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LatestRateCacheEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _LatestRateCacheEntryModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LatestRateCacheEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _LatestRateCacheEntryModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  double rate, @HiveField(1)  DateTime fetchedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LatestRateCacheEntryModel() when $default != null:
return $default(_that.rate,_that.fetchedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  double rate, @HiveField(1)  DateTime fetchedAt)  $default,) {final _that = this;
switch (_that) {
case _LatestRateCacheEntryModel():
return $default(_that.rate,_that.fetchedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  double rate, @HiveField(1)  DateTime fetchedAt)?  $default,) {final _that = this;
switch (_that) {
case _LatestRateCacheEntryModel() when $default != null:
return $default(_that.rate,_that.fetchedAt);case _:
  return null;

}
}

}

/// @nodoc


class _LatestRateCacheEntryModel extends LatestRateCacheEntryModel {
  const _LatestRateCacheEntryModel({@HiveField(0) required this.rate, @HiveField(1) required this.fetchedAt}): super._();
  

@override@HiveField(0) final  double rate;
@override@HiveField(1) final  DateTime fetchedAt;

/// Create a copy of LatestRateCacheEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LatestRateCacheEntryModelCopyWith<_LatestRateCacheEntryModel> get copyWith => __$LatestRateCacheEntryModelCopyWithImpl<_LatestRateCacheEntryModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LatestRateCacheEntryModel&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt));
}


@override
int get hashCode => Object.hash(runtimeType,rate,fetchedAt);

@override
String toString() {
  return 'LatestRateCacheEntryModel(rate: $rate, fetchedAt: $fetchedAt)';
}


}

/// @nodoc
abstract mixin class _$LatestRateCacheEntryModelCopyWith<$Res> implements $LatestRateCacheEntryModelCopyWith<$Res> {
  factory _$LatestRateCacheEntryModelCopyWith(_LatestRateCacheEntryModel value, $Res Function(_LatestRateCacheEntryModel) _then) = __$LatestRateCacheEntryModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) double rate,@HiveField(1) DateTime fetchedAt
});




}
/// @nodoc
class __$LatestRateCacheEntryModelCopyWithImpl<$Res>
    implements _$LatestRateCacheEntryModelCopyWith<$Res> {
  __$LatestRateCacheEntryModelCopyWithImpl(this._self, this._then);

  final _LatestRateCacheEntryModel _self;
  final $Res Function(_LatestRateCacheEntryModel) _then;

/// Create a copy of LatestRateCacheEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rate = null,Object? fetchedAt = null,}) {
  return _then(_LatestRateCacheEntryModel(
rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,fetchedAt: null == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
