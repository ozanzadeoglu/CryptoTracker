// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exchange_rate_bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExchangeRateBundle {

/// The most up-to-date exchange rate for the user's display currency.
/// This rate will be used to calculate current value of the portfolio.
 double get currentRate;/// A map of all the historical rates needed for the user's transactions.
/// Key: The date of the transaction.
/// Value: The exchange rate on that date.
 Map<DateTime, double> get historicalRates;
/// Create a copy of ExchangeRateBundle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExchangeRateBundleCopyWith<ExchangeRateBundle> get copyWith => _$ExchangeRateBundleCopyWithImpl<ExchangeRateBundle>(this as ExchangeRateBundle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeRateBundle&&(identical(other.currentRate, currentRate) || other.currentRate == currentRate)&&const DeepCollectionEquality().equals(other.historicalRates, historicalRates));
}


@override
int get hashCode => Object.hash(runtimeType,currentRate,const DeepCollectionEquality().hash(historicalRates));

@override
String toString() {
  return 'ExchangeRateBundle(currentRate: $currentRate, historicalRates: $historicalRates)';
}


}

/// @nodoc
abstract mixin class $ExchangeRateBundleCopyWith<$Res>  {
  factory $ExchangeRateBundleCopyWith(ExchangeRateBundle value, $Res Function(ExchangeRateBundle) _then) = _$ExchangeRateBundleCopyWithImpl;
@useResult
$Res call({
 double currentRate, Map<DateTime, double> historicalRates
});




}
/// @nodoc
class _$ExchangeRateBundleCopyWithImpl<$Res>
    implements $ExchangeRateBundleCopyWith<$Res> {
  _$ExchangeRateBundleCopyWithImpl(this._self, this._then);

  final ExchangeRateBundle _self;
  final $Res Function(ExchangeRateBundle) _then;

/// Create a copy of ExchangeRateBundle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentRate = null,Object? historicalRates = null,}) {
  return _then(_self.copyWith(
currentRate: null == currentRate ? _self.currentRate : currentRate // ignore: cast_nullable_to_non_nullable
as double,historicalRates: null == historicalRates ? _self.historicalRates : historicalRates // ignore: cast_nullable_to_non_nullable
as Map<DateTime, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExchangeRateBundle].
extension ExchangeRateBundlePatterns on ExchangeRateBundle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExchangeRateBundle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExchangeRateBundle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExchangeRateBundle value)  $default,){
final _that = this;
switch (_that) {
case _ExchangeRateBundle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExchangeRateBundle value)?  $default,){
final _that = this;
switch (_that) {
case _ExchangeRateBundle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double currentRate,  Map<DateTime, double> historicalRates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExchangeRateBundle() when $default != null:
return $default(_that.currentRate,_that.historicalRates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double currentRate,  Map<DateTime, double> historicalRates)  $default,) {final _that = this;
switch (_that) {
case _ExchangeRateBundle():
return $default(_that.currentRate,_that.historicalRates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double currentRate,  Map<DateTime, double> historicalRates)?  $default,) {final _that = this;
switch (_that) {
case _ExchangeRateBundle() when $default != null:
return $default(_that.currentRate,_that.historicalRates);case _:
  return null;

}
}

}

/// @nodoc


class _ExchangeRateBundle implements ExchangeRateBundle {
  const _ExchangeRateBundle({required this.currentRate, required final  Map<DateTime, double> historicalRates}): _historicalRates = historicalRates;
  

/// The most up-to-date exchange rate for the user's display currency.
/// This rate will be used to calculate current value of the portfolio.
@override final  double currentRate;
/// A map of all the historical rates needed for the user's transactions.
/// Key: The date of the transaction.
/// Value: The exchange rate on that date.
 final  Map<DateTime, double> _historicalRates;
/// A map of all the historical rates needed for the user's transactions.
/// Key: The date of the transaction.
/// Value: The exchange rate on that date.
@override Map<DateTime, double> get historicalRates {
  if (_historicalRates is EqualUnmodifiableMapView) return _historicalRates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_historicalRates);
}


/// Create a copy of ExchangeRateBundle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExchangeRateBundleCopyWith<_ExchangeRateBundle> get copyWith => __$ExchangeRateBundleCopyWithImpl<_ExchangeRateBundle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExchangeRateBundle&&(identical(other.currentRate, currentRate) || other.currentRate == currentRate)&&const DeepCollectionEquality().equals(other._historicalRates, _historicalRates));
}


@override
int get hashCode => Object.hash(runtimeType,currentRate,const DeepCollectionEquality().hash(_historicalRates));

@override
String toString() {
  return 'ExchangeRateBundle(currentRate: $currentRate, historicalRates: $historicalRates)';
}


}

/// @nodoc
abstract mixin class _$ExchangeRateBundleCopyWith<$Res> implements $ExchangeRateBundleCopyWith<$Res> {
  factory _$ExchangeRateBundleCopyWith(_ExchangeRateBundle value, $Res Function(_ExchangeRateBundle) _then) = __$ExchangeRateBundleCopyWithImpl;
@override @useResult
$Res call({
 double currentRate, Map<DateTime, double> historicalRates
});




}
/// @nodoc
class __$ExchangeRateBundleCopyWithImpl<$Res>
    implements _$ExchangeRateBundleCopyWith<$Res> {
  __$ExchangeRateBundleCopyWithImpl(this._self, this._then);

  final _ExchangeRateBundle _self;
  final $Res Function(_ExchangeRateBundle) _then;

/// Create a copy of ExchangeRateBundle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentRate = null,Object? historicalRates = null,}) {
  return _then(_ExchangeRateBundle(
currentRate: null == currentRate ? _self.currentRate : currentRate // ignore: cast_nullable_to_non_nullable
as double,historicalRates: null == historicalRates ? _self._historicalRates : historicalRates // ignore: cast_nullable_to_non_nullable
as Map<DateTime, double>,
  ));
}


}

// dart format on
