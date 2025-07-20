// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_chart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarketChartData {

/// A list of price data points over the selected time interval.
@ChartDataPointConverter() List<ChartDataPoint> get prices;/// A list of market cap data points over the selected time interval.
@JsonKey(name: 'market_caps')@ChartDataPointConverter() List<ChartDataPoint> get marketCaps;/// A list of total volume data points over the selected time interval.
@JsonKey(name: 'total_volumes')@ChartDataPointConverter() List<ChartDataPoint> get totalVolumes;
/// Create a copy of MarketChartData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketChartDataCopyWith<MarketChartData> get copyWith => _$MarketChartDataCopyWithImpl<MarketChartData>(this as MarketChartData, _$identity);

  /// Serializes this MarketChartData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketChartData&&const DeepCollectionEquality().equals(other.prices, prices)&&const DeepCollectionEquality().equals(other.marketCaps, marketCaps)&&const DeepCollectionEquality().equals(other.totalVolumes, totalVolumes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(prices),const DeepCollectionEquality().hash(marketCaps),const DeepCollectionEquality().hash(totalVolumes));

@override
String toString() {
  return 'MarketChartData(prices: $prices, marketCaps: $marketCaps, totalVolumes: $totalVolumes)';
}


}

/// @nodoc
abstract mixin class $MarketChartDataCopyWith<$Res>  {
  factory $MarketChartDataCopyWith(MarketChartData value, $Res Function(MarketChartData) _then) = _$MarketChartDataCopyWithImpl;
@useResult
$Res call({
@ChartDataPointConverter() List<ChartDataPoint> prices,@JsonKey(name: 'market_caps')@ChartDataPointConverter() List<ChartDataPoint> marketCaps,@JsonKey(name: 'total_volumes')@ChartDataPointConverter() List<ChartDataPoint> totalVolumes
});




}
/// @nodoc
class _$MarketChartDataCopyWithImpl<$Res>
    implements $MarketChartDataCopyWith<$Res> {
  _$MarketChartDataCopyWithImpl(this._self, this._then);

  final MarketChartData _self;
  final $Res Function(MarketChartData) _then;

/// Create a copy of MarketChartData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prices = null,Object? marketCaps = null,Object? totalVolumes = null,}) {
  return _then(_self.copyWith(
prices: null == prices ? _self.prices : prices // ignore: cast_nullable_to_non_nullable
as List<ChartDataPoint>,marketCaps: null == marketCaps ? _self.marketCaps : marketCaps // ignore: cast_nullable_to_non_nullable
as List<ChartDataPoint>,totalVolumes: null == totalVolumes ? _self.totalVolumes : totalVolumes // ignore: cast_nullable_to_non_nullable
as List<ChartDataPoint>,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketChartData].
extension MarketChartDataPatterns on MarketChartData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketChartData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketChartData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketChartData value)  $default,){
final _that = this;
switch (_that) {
case _MarketChartData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketChartData value)?  $default,){
final _that = this;
switch (_that) {
case _MarketChartData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@ChartDataPointConverter()  List<ChartDataPoint> prices, @JsonKey(name: 'market_caps')@ChartDataPointConverter()  List<ChartDataPoint> marketCaps, @JsonKey(name: 'total_volumes')@ChartDataPointConverter()  List<ChartDataPoint> totalVolumes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketChartData() when $default != null:
return $default(_that.prices,_that.marketCaps,_that.totalVolumes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@ChartDataPointConverter()  List<ChartDataPoint> prices, @JsonKey(name: 'market_caps')@ChartDataPointConverter()  List<ChartDataPoint> marketCaps, @JsonKey(name: 'total_volumes')@ChartDataPointConverter()  List<ChartDataPoint> totalVolumes)  $default,) {final _that = this;
switch (_that) {
case _MarketChartData():
return $default(_that.prices,_that.marketCaps,_that.totalVolumes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@ChartDataPointConverter()  List<ChartDataPoint> prices, @JsonKey(name: 'market_caps')@ChartDataPointConverter()  List<ChartDataPoint> marketCaps, @JsonKey(name: 'total_volumes')@ChartDataPointConverter()  List<ChartDataPoint> totalVolumes)?  $default,) {final _that = this;
switch (_that) {
case _MarketChartData() when $default != null:
return $default(_that.prices,_that.marketCaps,_that.totalVolumes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketChartData implements MarketChartData {
  const _MarketChartData({@ChartDataPointConverter() required final  List<ChartDataPoint> prices, @JsonKey(name: 'market_caps')@ChartDataPointConverter() required final  List<ChartDataPoint> marketCaps, @JsonKey(name: 'total_volumes')@ChartDataPointConverter() required final  List<ChartDataPoint> totalVolumes}): _prices = prices,_marketCaps = marketCaps,_totalVolumes = totalVolumes;
  factory _MarketChartData.fromJson(Map<String, dynamic> json) => _$MarketChartDataFromJson(json);

/// A list of price data points over the selected time interval.
 final  List<ChartDataPoint> _prices;
/// A list of price data points over the selected time interval.
@override@ChartDataPointConverter() List<ChartDataPoint> get prices {
  if (_prices is EqualUnmodifiableListView) return _prices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_prices);
}

/// A list of market cap data points over the selected time interval.
 final  List<ChartDataPoint> _marketCaps;
/// A list of market cap data points over the selected time interval.
@override@JsonKey(name: 'market_caps')@ChartDataPointConverter() List<ChartDataPoint> get marketCaps {
  if (_marketCaps is EqualUnmodifiableListView) return _marketCaps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_marketCaps);
}

/// A list of total volume data points over the selected time interval.
 final  List<ChartDataPoint> _totalVolumes;
/// A list of total volume data points over the selected time interval.
@override@JsonKey(name: 'total_volumes')@ChartDataPointConverter() List<ChartDataPoint> get totalVolumes {
  if (_totalVolumes is EqualUnmodifiableListView) return _totalVolumes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_totalVolumes);
}


/// Create a copy of MarketChartData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketChartDataCopyWith<_MarketChartData> get copyWith => __$MarketChartDataCopyWithImpl<_MarketChartData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketChartDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketChartData&&const DeepCollectionEquality().equals(other._prices, _prices)&&const DeepCollectionEquality().equals(other._marketCaps, _marketCaps)&&const DeepCollectionEquality().equals(other._totalVolumes, _totalVolumes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_prices),const DeepCollectionEquality().hash(_marketCaps),const DeepCollectionEquality().hash(_totalVolumes));

@override
String toString() {
  return 'MarketChartData(prices: $prices, marketCaps: $marketCaps, totalVolumes: $totalVolumes)';
}


}

/// @nodoc
abstract mixin class _$MarketChartDataCopyWith<$Res> implements $MarketChartDataCopyWith<$Res> {
  factory _$MarketChartDataCopyWith(_MarketChartData value, $Res Function(_MarketChartData) _then) = __$MarketChartDataCopyWithImpl;
@override @useResult
$Res call({
@ChartDataPointConverter() List<ChartDataPoint> prices,@JsonKey(name: 'market_caps')@ChartDataPointConverter() List<ChartDataPoint> marketCaps,@JsonKey(name: 'total_volumes')@ChartDataPointConverter() List<ChartDataPoint> totalVolumes
});




}
/// @nodoc
class __$MarketChartDataCopyWithImpl<$Res>
    implements _$MarketChartDataCopyWith<$Res> {
  __$MarketChartDataCopyWithImpl(this._self, this._then);

  final _MarketChartData _self;
  final $Res Function(_MarketChartData) _then;

/// Create a copy of MarketChartData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prices = null,Object? marketCaps = null,Object? totalVolumes = null,}) {
  return _then(_MarketChartData(
prices: null == prices ? _self._prices : prices // ignore: cast_nullable_to_non_nullable
as List<ChartDataPoint>,marketCaps: null == marketCaps ? _self._marketCaps : marketCaps // ignore: cast_nullable_to_non_nullable
as List<ChartDataPoint>,totalVolumes: null == totalVolumes ? _self._totalVolumes : totalVolumes // ignore: cast_nullable_to_non_nullable
as List<ChartDataPoint>,
  ));
}


}


/// @nodoc
mixin _$ChartDataPoint {

/// The specific date and time for this data point.
 DateTime get date;/// The value at this point in time (can be price, volume, or market cap).
 double get value;
/// Create a copy of ChartDataPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartDataPointCopyWith<ChartDataPoint> get copyWith => _$ChartDataPointCopyWithImpl<ChartDataPoint>(this as ChartDataPoint, _$identity);

  /// Serializes this ChartDataPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartDataPoint&&(identical(other.date, date) || other.date == date)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,value);

@override
String toString() {
  return 'ChartDataPoint(date: $date, value: $value)';
}


}

/// @nodoc
abstract mixin class $ChartDataPointCopyWith<$Res>  {
  factory $ChartDataPointCopyWith(ChartDataPoint value, $Res Function(ChartDataPoint) _then) = _$ChartDataPointCopyWithImpl;
@useResult
$Res call({
 DateTime date, double value
});




}
/// @nodoc
class _$ChartDataPointCopyWithImpl<$Res>
    implements $ChartDataPointCopyWith<$Res> {
  _$ChartDataPointCopyWithImpl(this._self, this._then);

  final ChartDataPoint _self;
  final $Res Function(ChartDataPoint) _then;

/// Create a copy of ChartDataPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? value = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ChartDataPoint].
extension ChartDataPointPatterns on ChartDataPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChartDataPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChartDataPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChartDataPoint value)  $default,){
final _that = this;
switch (_that) {
case _ChartDataPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChartDataPoint value)?  $default,){
final _that = this;
switch (_that) {
case _ChartDataPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  double value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChartDataPoint() when $default != null:
return $default(_that.date,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  double value)  $default,) {final _that = this;
switch (_that) {
case _ChartDataPoint():
return $default(_that.date,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  double value)?  $default,) {final _that = this;
switch (_that) {
case _ChartDataPoint() when $default != null:
return $default(_that.date,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChartDataPoint implements ChartDataPoint {
  const _ChartDataPoint({required this.date, required this.value});
  factory _ChartDataPoint.fromJson(Map<String, dynamic> json) => _$ChartDataPointFromJson(json);

/// The specific date and time for this data point.
@override final  DateTime date;
/// The value at this point in time (can be price, volume, or market cap).
@override final  double value;

/// Create a copy of ChartDataPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartDataPointCopyWith<_ChartDataPoint> get copyWith => __$ChartDataPointCopyWithImpl<_ChartDataPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChartDataPointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChartDataPoint&&(identical(other.date, date) || other.date == date)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,value);

@override
String toString() {
  return 'ChartDataPoint(date: $date, value: $value)';
}


}

/// @nodoc
abstract mixin class _$ChartDataPointCopyWith<$Res> implements $ChartDataPointCopyWith<$Res> {
  factory _$ChartDataPointCopyWith(_ChartDataPoint value, $Res Function(_ChartDataPoint) _then) = __$ChartDataPointCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, double value
});




}
/// @nodoc
class __$ChartDataPointCopyWithImpl<$Res>
    implements _$ChartDataPointCopyWith<$Res> {
  __$ChartDataPointCopyWithImpl(this._self, this._then);

  final _ChartDataPoint _self;
  final $Res Function(_ChartDataPoint) _then;

/// Create a copy of ChartDataPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? value = null,}) {
  return _then(_ChartDataPoint(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
