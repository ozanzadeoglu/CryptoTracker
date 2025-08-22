// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_exchange_rates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyExchangeRates implements DiagnosticableTreeMixin {

/// Date of exchange rates.
 DateTime get date;// Base fiat currency of all rates(usd)
 FiatCurrency get base;/// A map of target currencies to their conversion rate from the base currency.
 Map<FiatCurrency, double> get rates;
/// Create a copy of DailyExchangeRates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyExchangeRatesCopyWith<DailyExchangeRates> get copyWith => _$DailyExchangeRatesCopyWithImpl<DailyExchangeRates>(this as DailyExchangeRates, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DailyExchangeRates'))
    ..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('base', base))..add(DiagnosticsProperty('rates', rates));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyExchangeRates&&(identical(other.date, date) || other.date == date)&&(identical(other.base, base) || other.base == base)&&const DeepCollectionEquality().equals(other.rates, rates));
}


@override
int get hashCode => Object.hash(runtimeType,date,base,const DeepCollectionEquality().hash(rates));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DailyExchangeRates(date: $date, base: $base, rates: $rates)';
}


}

/// @nodoc
abstract mixin class $DailyExchangeRatesCopyWith<$Res>  {
  factory $DailyExchangeRatesCopyWith(DailyExchangeRates value, $Res Function(DailyExchangeRates) _then) = _$DailyExchangeRatesCopyWithImpl;
@useResult
$Res call({
 DateTime date, FiatCurrency base, Map<FiatCurrency, double> rates
});




}
/// @nodoc
class _$DailyExchangeRatesCopyWithImpl<$Res>
    implements $DailyExchangeRatesCopyWith<$Res> {
  _$DailyExchangeRatesCopyWithImpl(this._self, this._then);

  final DailyExchangeRates _self;
  final $Res Function(DailyExchangeRates) _then;

/// Create a copy of DailyExchangeRates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? base = null,Object? rates = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as FiatCurrency,rates: null == rates ? _self.rates : rates // ignore: cast_nullable_to_non_nullable
as Map<FiatCurrency, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyExchangeRates].
extension DailyExchangeRatesPatterns on DailyExchangeRates {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyExchangeRates value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyExchangeRates() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyExchangeRates value)  $default,){
final _that = this;
switch (_that) {
case _DailyExchangeRates():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyExchangeRates value)?  $default,){
final _that = this;
switch (_that) {
case _DailyExchangeRates() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  FiatCurrency base,  Map<FiatCurrency, double> rates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyExchangeRates() when $default != null:
return $default(_that.date,_that.base,_that.rates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  FiatCurrency base,  Map<FiatCurrency, double> rates)  $default,) {final _that = this;
switch (_that) {
case _DailyExchangeRates():
return $default(_that.date,_that.base,_that.rates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  FiatCurrency base,  Map<FiatCurrency, double> rates)?  $default,) {final _that = this;
switch (_that) {
case _DailyExchangeRates() when $default != null:
return $default(_that.date,_that.base,_that.rates);case _:
  return null;

}
}

}

/// @nodoc


class _DailyExchangeRates with DiagnosticableTreeMixin implements DailyExchangeRates {
   _DailyExchangeRates({required this.date, required this.base, required final  Map<FiatCurrency, double> rates}): _rates = rates;
  

/// Date of exchange rates.
@override final  DateTime date;
// Base fiat currency of all rates(usd)
@override final  FiatCurrency base;
/// A map of target currencies to their conversion rate from the base currency.
 final  Map<FiatCurrency, double> _rates;
/// A map of target currencies to their conversion rate from the base currency.
@override Map<FiatCurrency, double> get rates {
  if (_rates is EqualUnmodifiableMapView) return _rates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rates);
}


/// Create a copy of DailyExchangeRates
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyExchangeRatesCopyWith<_DailyExchangeRates> get copyWith => __$DailyExchangeRatesCopyWithImpl<_DailyExchangeRates>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DailyExchangeRates'))
    ..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('base', base))..add(DiagnosticsProperty('rates', rates));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyExchangeRates&&(identical(other.date, date) || other.date == date)&&(identical(other.base, base) || other.base == base)&&const DeepCollectionEquality().equals(other._rates, _rates));
}


@override
int get hashCode => Object.hash(runtimeType,date,base,const DeepCollectionEquality().hash(_rates));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DailyExchangeRates(date: $date, base: $base, rates: $rates)';
}


}

/// @nodoc
abstract mixin class _$DailyExchangeRatesCopyWith<$Res> implements $DailyExchangeRatesCopyWith<$Res> {
  factory _$DailyExchangeRatesCopyWith(_DailyExchangeRates value, $Res Function(_DailyExchangeRates) _then) = __$DailyExchangeRatesCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, FiatCurrency base, Map<FiatCurrency, double> rates
});




}
/// @nodoc
class __$DailyExchangeRatesCopyWithImpl<$Res>
    implements _$DailyExchangeRatesCopyWith<$Res> {
  __$DailyExchangeRatesCopyWithImpl(this._self, this._then);

  final _DailyExchangeRates _self;
  final $Res Function(_DailyExchangeRates) _then;

/// Create a copy of DailyExchangeRates
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? base = null,Object? rates = null,}) {
  return _then(_DailyExchangeRates(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as FiatCurrency,rates: null == rates ? _self._rates : rates // ignore: cast_nullable_to_non_nullable
as Map<FiatCurrency, double>,
  ));
}


}

// dart format on
