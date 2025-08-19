// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exchange_rate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExchangeRateModel {

@HiveField(0) String get from;@HiveField(1) String get to;@HiveField(2) DateTime get date;@HiveField(3) double get rate;
/// Create a copy of ExchangeRateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExchangeRateModelCopyWith<ExchangeRateModel> get copyWith => _$ExchangeRateModelCopyWithImpl<ExchangeRateModel>(this as ExchangeRateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeRateModel&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.date, date) || other.date == date)&&(identical(other.rate, rate) || other.rate == rate));
}


@override
int get hashCode => Object.hash(runtimeType,from,to,date,rate);

@override
String toString() {
  return 'ExchangeRateModel(from: $from, to: $to, date: $date, rate: $rate)';
}


}

/// @nodoc
abstract mixin class $ExchangeRateModelCopyWith<$Res>  {
  factory $ExchangeRateModelCopyWith(ExchangeRateModel value, $Res Function(ExchangeRateModel) _then) = _$ExchangeRateModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String from,@HiveField(1) String to,@HiveField(2) DateTime date,@HiveField(3) double rate
});




}
/// @nodoc
class _$ExchangeRateModelCopyWithImpl<$Res>
    implements $ExchangeRateModelCopyWith<$Res> {
  _$ExchangeRateModelCopyWithImpl(this._self, this._then);

  final ExchangeRateModel _self;
  final $Res Function(ExchangeRateModel) _then;

/// Create a copy of ExchangeRateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = null,Object? to = null,Object? date = null,Object? rate = null,}) {
  return _then(_self.copyWith(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ExchangeRateModel].
extension ExchangeRateModelPatterns on ExchangeRateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExchangeRateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExchangeRateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExchangeRateModel value)  $default,){
final _that = this;
switch (_that) {
case _ExchangeRateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExchangeRateModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExchangeRateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String from, @HiveField(1)  String to, @HiveField(2)  DateTime date, @HiveField(3)  double rate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExchangeRateModel() when $default != null:
return $default(_that.from,_that.to,_that.date,_that.rate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String from, @HiveField(1)  String to, @HiveField(2)  DateTime date, @HiveField(3)  double rate)  $default,) {final _that = this;
switch (_that) {
case _ExchangeRateModel():
return $default(_that.from,_that.to,_that.date,_that.rate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String from, @HiveField(1)  String to, @HiveField(2)  DateTime date, @HiveField(3)  double rate)?  $default,) {final _that = this;
switch (_that) {
case _ExchangeRateModel() when $default != null:
return $default(_that.from,_that.to,_that.date,_that.rate);case _:
  return null;

}
}

}

/// @nodoc


class _ExchangeRateModel extends ExchangeRateModel {
  const _ExchangeRateModel({@HiveField(0) required this.from, @HiveField(1) required this.to, @HiveField(2) required this.date, @HiveField(3) required this.rate}): super._();
  

@override@HiveField(0) final  String from;
@override@HiveField(1) final  String to;
@override@HiveField(2) final  DateTime date;
@override@HiveField(3) final  double rate;

/// Create a copy of ExchangeRateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExchangeRateModelCopyWith<_ExchangeRateModel> get copyWith => __$ExchangeRateModelCopyWithImpl<_ExchangeRateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExchangeRateModel&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.date, date) || other.date == date)&&(identical(other.rate, rate) || other.rate == rate));
}


@override
int get hashCode => Object.hash(runtimeType,from,to,date,rate);

@override
String toString() {
  return 'ExchangeRateModel(from: $from, to: $to, date: $date, rate: $rate)';
}


}

/// @nodoc
abstract mixin class _$ExchangeRateModelCopyWith<$Res> implements $ExchangeRateModelCopyWith<$Res> {
  factory _$ExchangeRateModelCopyWith(_ExchangeRateModel value, $Res Function(_ExchangeRateModel) _then) = __$ExchangeRateModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String from,@HiveField(1) String to,@HiveField(2) DateTime date,@HiveField(3) double rate
});




}
/// @nodoc
class __$ExchangeRateModelCopyWithImpl<$Res>
    implements _$ExchangeRateModelCopyWith<$Res> {
  __$ExchangeRateModelCopyWithImpl(this._self, this._then);

  final _ExchangeRateModel _self;
  final $Res Function(_ExchangeRateModel) _then;

/// Create a copy of ExchangeRateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,Object? date = null,Object? rate = null,}) {
  return _then(_ExchangeRateModel(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
