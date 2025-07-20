// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Coin {

/// The unique identifier for the coin (e.g., 'bitcoin').
@HiveField(0) String get id;/// The ticker symbol for the coin (e.g., 'btc').
@HiveField(1) String get symbol;/// The display name of the coin (e.g., 'Bitcoin').
@HiveField(2) String get name;/// The URL of the coin's logo image.
@HiveField(3) String get image;/// The current price in the user's selected fiat currency.
@HiveField(4)@JsonKey(name: 'current_price') double get currentPrice;/// The total market capitalization in the user's selected fiat currency.
@HiveField(5)@JsonKey(name: 'market_cap') int get marketCap;/// The percentage change in price over the last 24 hours.
@HiveField(6)@JsonKey(name: 'price_change_percentage_24h') double get priceChangePercentage24h;/// A small list of price points for the last 7 days, used for a preview sparkline chart.
/// This can be null if the API doesn't provide it.
@HiveField(7)@JsonKey(name: 'sparkline_in_7d') Sparkline? get sparkline;
/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinCopyWith<Coin> get copyWith => _$CoinCopyWithImpl<Coin>(this as Coin, _$identity);

  /// Serializes this Coin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Coin&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.priceChangePercentage24h, priceChangePercentage24h) || other.priceChangePercentage24h == priceChangePercentage24h)&&(identical(other.sparkline, sparkline) || other.sparkline == sparkline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,symbol,name,image,currentPrice,marketCap,priceChangePercentage24h,sparkline);

@override
String toString() {
  return 'Coin(id: $id, symbol: $symbol, name: $name, image: $image, currentPrice: $currentPrice, marketCap: $marketCap, priceChangePercentage24h: $priceChangePercentage24h, sparkline: $sparkline)';
}


}

/// @nodoc
abstract mixin class $CoinCopyWith<$Res>  {
  factory $CoinCopyWith(Coin value, $Res Function(Coin) _then) = _$CoinCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String symbol,@HiveField(2) String name,@HiveField(3) String image,@HiveField(4)@JsonKey(name: 'current_price') double currentPrice,@HiveField(5)@JsonKey(name: 'market_cap') int marketCap,@HiveField(6)@JsonKey(name: 'price_change_percentage_24h') double priceChangePercentage24h,@HiveField(7)@JsonKey(name: 'sparkline_in_7d') Sparkline? sparkline
});


$SparklineCopyWith<$Res>? get sparkline;

}
/// @nodoc
class _$CoinCopyWithImpl<$Res>
    implements $CoinCopyWith<$Res> {
  _$CoinCopyWithImpl(this._self, this._then);

  final Coin _self;
  final $Res Function(Coin) _then;

/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? image = null,Object? currentPrice = null,Object? marketCap = null,Object? priceChangePercentage24h = null,Object? sparkline = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,marketCap: null == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as int,priceChangePercentage24h: null == priceChangePercentage24h ? _self.priceChangePercentage24h : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
as double,sparkline: freezed == sparkline ? _self.sparkline : sparkline // ignore: cast_nullable_to_non_nullable
as Sparkline?,
  ));
}
/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SparklineCopyWith<$Res>? get sparkline {
    if (_self.sparkline == null) {
    return null;
  }

  return $SparklineCopyWith<$Res>(_self.sparkline!, (value) {
    return _then(_self.copyWith(sparkline: value));
  });
}
}


/// Adds pattern-matching-related methods to [Coin].
extension CoinPatterns on Coin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Coin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Coin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Coin value)  $default,){
final _that = this;
switch (_that) {
case _Coin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Coin value)?  $default,){
final _that = this;
switch (_that) {
case _Coin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String symbol, @HiveField(2)  String name, @HiveField(3)  String image, @HiveField(4)@JsonKey(name: 'current_price')  double currentPrice, @HiveField(5)@JsonKey(name: 'market_cap')  int marketCap, @HiveField(6)@JsonKey(name: 'price_change_percentage_24h')  double priceChangePercentage24h, @HiveField(7)@JsonKey(name: 'sparkline_in_7d')  Sparkline? sparkline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Coin() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.currentPrice,_that.marketCap,_that.priceChangePercentage24h,_that.sparkline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String symbol, @HiveField(2)  String name, @HiveField(3)  String image, @HiveField(4)@JsonKey(name: 'current_price')  double currentPrice, @HiveField(5)@JsonKey(name: 'market_cap')  int marketCap, @HiveField(6)@JsonKey(name: 'price_change_percentage_24h')  double priceChangePercentage24h, @HiveField(7)@JsonKey(name: 'sparkline_in_7d')  Sparkline? sparkline)  $default,) {final _that = this;
switch (_that) {
case _Coin():
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.currentPrice,_that.marketCap,_that.priceChangePercentage24h,_that.sparkline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String id, @HiveField(1)  String symbol, @HiveField(2)  String name, @HiveField(3)  String image, @HiveField(4)@JsonKey(name: 'current_price')  double currentPrice, @HiveField(5)@JsonKey(name: 'market_cap')  int marketCap, @HiveField(6)@JsonKey(name: 'price_change_percentage_24h')  double priceChangePercentage24h, @HiveField(7)@JsonKey(name: 'sparkline_in_7d')  Sparkline? sparkline)?  $default,) {final _that = this;
switch (_that) {
case _Coin() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.currentPrice,_that.marketCap,_that.priceChangePercentage24h,_that.sparkline);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Coin implements Coin {
  const _Coin({@HiveField(0) required this.id, @HiveField(1) required this.symbol, @HiveField(2) required this.name, @HiveField(3) required this.image, @HiveField(4)@JsonKey(name: 'current_price') required this.currentPrice, @HiveField(5)@JsonKey(name: 'market_cap') required this.marketCap, @HiveField(6)@JsonKey(name: 'price_change_percentage_24h') required this.priceChangePercentage24h, @HiveField(7)@JsonKey(name: 'sparkline_in_7d') this.sparkline});
  factory _Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);

/// The unique identifier for the coin (e.g., 'bitcoin').
@override@HiveField(0) final  String id;
/// The ticker symbol for the coin (e.g., 'btc').
@override@HiveField(1) final  String symbol;
/// The display name of the coin (e.g., 'Bitcoin').
@override@HiveField(2) final  String name;
/// The URL of the coin's logo image.
@override@HiveField(3) final  String image;
/// The current price in the user's selected fiat currency.
@override@HiveField(4)@JsonKey(name: 'current_price') final  double currentPrice;
/// The total market capitalization in the user's selected fiat currency.
@override@HiveField(5)@JsonKey(name: 'market_cap') final  int marketCap;
/// The percentage change in price over the last 24 hours.
@override@HiveField(6)@JsonKey(name: 'price_change_percentage_24h') final  double priceChangePercentage24h;
/// A small list of price points for the last 7 days, used for a preview sparkline chart.
/// This can be null if the API doesn't provide it.
@override@HiveField(7)@JsonKey(name: 'sparkline_in_7d') final  Sparkline? sparkline;

/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinCopyWith<_Coin> get copyWith => __$CoinCopyWithImpl<_Coin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoinToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Coin&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.priceChangePercentage24h, priceChangePercentage24h) || other.priceChangePercentage24h == priceChangePercentage24h)&&(identical(other.sparkline, sparkline) || other.sparkline == sparkline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,symbol,name,image,currentPrice,marketCap,priceChangePercentage24h,sparkline);

@override
String toString() {
  return 'Coin(id: $id, symbol: $symbol, name: $name, image: $image, currentPrice: $currentPrice, marketCap: $marketCap, priceChangePercentage24h: $priceChangePercentage24h, sparkline: $sparkline)';
}


}

/// @nodoc
abstract mixin class _$CoinCopyWith<$Res> implements $CoinCopyWith<$Res> {
  factory _$CoinCopyWith(_Coin value, $Res Function(_Coin) _then) = __$CoinCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String symbol,@HiveField(2) String name,@HiveField(3) String image,@HiveField(4)@JsonKey(name: 'current_price') double currentPrice,@HiveField(5)@JsonKey(name: 'market_cap') int marketCap,@HiveField(6)@JsonKey(name: 'price_change_percentage_24h') double priceChangePercentage24h,@HiveField(7)@JsonKey(name: 'sparkline_in_7d') Sparkline? sparkline
});


@override $SparklineCopyWith<$Res>? get sparkline;

}
/// @nodoc
class __$CoinCopyWithImpl<$Res>
    implements _$CoinCopyWith<$Res> {
  __$CoinCopyWithImpl(this._self, this._then);

  final _Coin _self;
  final $Res Function(_Coin) _then;

/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? image = null,Object? currentPrice = null,Object? marketCap = null,Object? priceChangePercentage24h = null,Object? sparkline = freezed,}) {
  return _then(_Coin(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,marketCap: null == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as int,priceChangePercentage24h: null == priceChangePercentage24h ? _self.priceChangePercentage24h : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
as double,sparkline: freezed == sparkline ? _self.sparkline : sparkline // ignore: cast_nullable_to_non_nullable
as Sparkline?,
  ));
}

/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SparklineCopyWith<$Res>? get sparkline {
    if (_self.sparkline == null) {
    return null;
  }

  return $SparklineCopyWith<$Res>(_self.sparkline!, (value) {
    return _then(_self.copyWith(sparkline: value));
  });
}
}


/// @nodoc
mixin _$Sparkline {

/// A list of price points over a time period.
@HiveField(0) List<double> get price;
/// Create a copy of Sparkline
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SparklineCopyWith<Sparkline> get copyWith => _$SparklineCopyWithImpl<Sparkline>(this as Sparkline, _$identity);

  /// Serializes this Sparkline to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sparkline&&const DeepCollectionEquality().equals(other.price, price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(price));

@override
String toString() {
  return 'Sparkline(price: $price)';
}


}

/// @nodoc
abstract mixin class $SparklineCopyWith<$Res>  {
  factory $SparklineCopyWith(Sparkline value, $Res Function(Sparkline) _then) = _$SparklineCopyWithImpl;
@useResult
$Res call({
@HiveField(0) List<double> price
});




}
/// @nodoc
class _$SparklineCopyWithImpl<$Res>
    implements $SparklineCopyWith<$Res> {
  _$SparklineCopyWithImpl(this._self, this._then);

  final Sparkline _self;
  final $Res Function(Sparkline) _then;

/// Create a copy of Sparkline
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? price = null,}) {
  return _then(_self.copyWith(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// Adds pattern-matching-related methods to [Sparkline].
extension SparklinePatterns on Sparkline {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sparkline value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sparkline() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sparkline value)  $default,){
final _that = this;
switch (_that) {
case _Sparkline():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sparkline value)?  $default,){
final _that = this;
switch (_that) {
case _Sparkline() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  List<double> price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sparkline() when $default != null:
return $default(_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  List<double> price)  $default,) {final _that = this;
switch (_that) {
case _Sparkline():
return $default(_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  List<double> price)?  $default,) {final _that = this;
switch (_that) {
case _Sparkline() when $default != null:
return $default(_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sparkline implements Sparkline {
  const _Sparkline({@HiveField(0) required final  List<double> price}): _price = price;
  factory _Sparkline.fromJson(Map<String, dynamic> json) => _$SparklineFromJson(json);

/// A list of price points over a time period.
 final  List<double> _price;
/// A list of price points over a time period.
@override@HiveField(0) List<double> get price {
  if (_price is EqualUnmodifiableListView) return _price;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_price);
}


/// Create a copy of Sparkline
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SparklineCopyWith<_Sparkline> get copyWith => __$SparklineCopyWithImpl<_Sparkline>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SparklineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sparkline&&const DeepCollectionEquality().equals(other._price, _price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_price));

@override
String toString() {
  return 'Sparkline(price: $price)';
}


}

/// @nodoc
abstract mixin class _$SparklineCopyWith<$Res> implements $SparklineCopyWith<$Res> {
  factory _$SparklineCopyWith(_Sparkline value, $Res Function(_Sparkline) _then) = __$SparklineCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) List<double> price
});




}
/// @nodoc
class __$SparklineCopyWithImpl<$Res>
    implements _$SparklineCopyWith<$Res> {
  __$SparklineCopyWithImpl(this._self, this._then);

  final _Sparkline _self;
  final $Res Function(_Sparkline) _then;

/// Create a copy of Sparkline
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? price = null,}) {
  return _then(_Sparkline(
price: null == price ? _self._price : price // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}

// dart format on
