// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_exchange_rates_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyExchangeRatesModel {

@HiveField(0) String get date;@HiveField(1) String get base;@HiveField(2) Map<String, double> get rates;
/// Create a copy of DailyExchangeRatesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyExchangeRatesModelCopyWith<DailyExchangeRatesModel> get copyWith => _$DailyExchangeRatesModelCopyWithImpl<DailyExchangeRatesModel>(this as DailyExchangeRatesModel, _$identity);

  /// Serializes this DailyExchangeRatesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyExchangeRatesModel&&(identical(other.date, date) || other.date == date)&&(identical(other.base, base) || other.base == base)&&const DeepCollectionEquality().equals(other.rates, rates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,base,const DeepCollectionEquality().hash(rates));

@override
String toString() {
  return 'DailyExchangeRatesModel(date: $date, base: $base, rates: $rates)';
}


}

/// @nodoc
abstract mixin class $DailyExchangeRatesModelCopyWith<$Res>  {
  factory $DailyExchangeRatesModelCopyWith(DailyExchangeRatesModel value, $Res Function(DailyExchangeRatesModel) _then) = _$DailyExchangeRatesModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String date,@HiveField(1) String base,@HiveField(2) Map<String, double> rates
});




}
/// @nodoc
class _$DailyExchangeRatesModelCopyWithImpl<$Res>
    implements $DailyExchangeRatesModelCopyWith<$Res> {
  _$DailyExchangeRatesModelCopyWithImpl(this._self, this._then);

  final DailyExchangeRatesModel _self;
  final $Res Function(DailyExchangeRatesModel) _then;

/// Create a copy of DailyExchangeRatesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? base = null,Object? rates = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String,rates: null == rates ? _self.rates : rates // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyExchangeRatesModel].
extension DailyExchangeRatesModelPatterns on DailyExchangeRatesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyExchangeRatesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyExchangeRatesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyExchangeRatesModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyExchangeRatesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyExchangeRatesModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyExchangeRatesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String date, @HiveField(1)  String base, @HiveField(2)  Map<String, double> rates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyExchangeRatesModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String date, @HiveField(1)  String base, @HiveField(2)  Map<String, double> rates)  $default,) {final _that = this;
switch (_that) {
case _DailyExchangeRatesModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String date, @HiveField(1)  String base, @HiveField(2)  Map<String, double> rates)?  $default,) {final _that = this;
switch (_that) {
case _DailyExchangeRatesModel() when $default != null:
return $default(_that.date,_that.base,_that.rates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyExchangeRatesModel extends DailyExchangeRatesModel {
  const _DailyExchangeRatesModel({@HiveField(0) required this.date, @HiveField(1) required this.base, @HiveField(2) required final  Map<String, double> rates}): _rates = rates,super._();
  factory _DailyExchangeRatesModel.fromJson(Map<String, dynamic> json) => _$DailyExchangeRatesModelFromJson(json);

@override@HiveField(0) final  String date;
@override@HiveField(1) final  String base;
 final  Map<String, double> _rates;
@override@HiveField(2) Map<String, double> get rates {
  if (_rates is EqualUnmodifiableMapView) return _rates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rates);
}


/// Create a copy of DailyExchangeRatesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyExchangeRatesModelCopyWith<_DailyExchangeRatesModel> get copyWith => __$DailyExchangeRatesModelCopyWithImpl<_DailyExchangeRatesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyExchangeRatesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyExchangeRatesModel&&(identical(other.date, date) || other.date == date)&&(identical(other.base, base) || other.base == base)&&const DeepCollectionEquality().equals(other._rates, _rates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,base,const DeepCollectionEquality().hash(_rates));

@override
String toString() {
  return 'DailyExchangeRatesModel(date: $date, base: $base, rates: $rates)';
}


}

/// @nodoc
abstract mixin class _$DailyExchangeRatesModelCopyWith<$Res> implements $DailyExchangeRatesModelCopyWith<$Res> {
  factory _$DailyExchangeRatesModelCopyWith(_DailyExchangeRatesModel value, $Res Function(_DailyExchangeRatesModel) _then) = __$DailyExchangeRatesModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String date,@HiveField(1) String base,@HiveField(2) Map<String, double> rates
});




}
/// @nodoc
class __$DailyExchangeRatesModelCopyWithImpl<$Res>
    implements _$DailyExchangeRatesModelCopyWith<$Res> {
  __$DailyExchangeRatesModelCopyWithImpl(this._self, this._then);

  final _DailyExchangeRatesModel _self;
  final $Res Function(_DailyExchangeRatesModel) _then;

/// Create a copy of DailyExchangeRatesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? base = null,Object? rates = null,}) {
  return _then(_DailyExchangeRatesModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String,rates: null == rates ? _self._rates : rates // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

// dart format on
