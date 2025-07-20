// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_asset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PortfolioAsset {

/// The full [Coin] object containing live market data (name, image, price, etc.).
 Coin get coin;/// The total amount of this coin the user currently holds (sum of all buys and sells).
 double get amountHeld;/// The total fiat value the user has spent to acquire the currently held amount (cost basis).
 double get totalInvested;/// The current total fiat value of the user's holding (`amountHeld` * `coin.currentPrice`).
 double get currentValue;/// The total profit or loss in fiat currency (`currentValue` - `totalInvested`).
 double get profitOrLoss;/// The total profit or loss as a percentage.
 double get profitOrLossPercentage;
/// Create a copy of PortfolioAsset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioAssetCopyWith<PortfolioAsset> get copyWith => _$PortfolioAssetCopyWithImpl<PortfolioAsset>(this as PortfolioAsset, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioAsset&&(identical(other.coin, coin) || other.coin == coin)&&(identical(other.amountHeld, amountHeld) || other.amountHeld == amountHeld)&&(identical(other.totalInvested, totalInvested) || other.totalInvested == totalInvested)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.profitOrLoss, profitOrLoss) || other.profitOrLoss == profitOrLoss)&&(identical(other.profitOrLossPercentage, profitOrLossPercentage) || other.profitOrLossPercentage == profitOrLossPercentage));
}


@override
int get hashCode => Object.hash(runtimeType,coin,amountHeld,totalInvested,currentValue,profitOrLoss,profitOrLossPercentage);

@override
String toString() {
  return 'PortfolioAsset(coin: $coin, amountHeld: $amountHeld, totalInvested: $totalInvested, currentValue: $currentValue, profitOrLoss: $profitOrLoss, profitOrLossPercentage: $profitOrLossPercentage)';
}


}

/// @nodoc
abstract mixin class $PortfolioAssetCopyWith<$Res>  {
  factory $PortfolioAssetCopyWith(PortfolioAsset value, $Res Function(PortfolioAsset) _then) = _$PortfolioAssetCopyWithImpl;
@useResult
$Res call({
 Coin coin, double amountHeld, double totalInvested, double currentValue, double profitOrLoss, double profitOrLossPercentage
});


$CoinCopyWith<$Res> get coin;

}
/// @nodoc
class _$PortfolioAssetCopyWithImpl<$Res>
    implements $PortfolioAssetCopyWith<$Res> {
  _$PortfolioAssetCopyWithImpl(this._self, this._then);

  final PortfolioAsset _self;
  final $Res Function(PortfolioAsset) _then;

/// Create a copy of PortfolioAsset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coin = null,Object? amountHeld = null,Object? totalInvested = null,Object? currentValue = null,Object? profitOrLoss = null,Object? profitOrLossPercentage = null,}) {
  return _then(_self.copyWith(
coin: null == coin ? _self.coin : coin // ignore: cast_nullable_to_non_nullable
as Coin,amountHeld: null == amountHeld ? _self.amountHeld : amountHeld // ignore: cast_nullable_to_non_nullable
as double,totalInvested: null == totalInvested ? _self.totalInvested : totalInvested // ignore: cast_nullable_to_non_nullable
as double,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double,profitOrLoss: null == profitOrLoss ? _self.profitOrLoss : profitOrLoss // ignore: cast_nullable_to_non_nullable
as double,profitOrLossPercentage: null == profitOrLossPercentage ? _self.profitOrLossPercentage : profitOrLossPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of PortfolioAsset
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoinCopyWith<$Res> get coin {
  
  return $CoinCopyWith<$Res>(_self.coin, (value) {
    return _then(_self.copyWith(coin: value));
  });
}
}


/// Adds pattern-matching-related methods to [PortfolioAsset].
extension PortfolioAssetPatterns on PortfolioAsset {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioAsset value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioAsset() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioAsset value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioAsset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioAsset value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioAsset() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Coin coin,  double amountHeld,  double totalInvested,  double currentValue,  double profitOrLoss,  double profitOrLossPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioAsset() when $default != null:
return $default(_that.coin,_that.amountHeld,_that.totalInvested,_that.currentValue,_that.profitOrLoss,_that.profitOrLossPercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Coin coin,  double amountHeld,  double totalInvested,  double currentValue,  double profitOrLoss,  double profitOrLossPercentage)  $default,) {final _that = this;
switch (_that) {
case _PortfolioAsset():
return $default(_that.coin,_that.amountHeld,_that.totalInvested,_that.currentValue,_that.profitOrLoss,_that.profitOrLossPercentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Coin coin,  double amountHeld,  double totalInvested,  double currentValue,  double profitOrLoss,  double profitOrLossPercentage)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioAsset() when $default != null:
return $default(_that.coin,_that.amountHeld,_that.totalInvested,_that.currentValue,_that.profitOrLoss,_that.profitOrLossPercentage);case _:
  return null;

}
}

}

/// @nodoc


class _PortfolioAsset implements PortfolioAsset {
  const _PortfolioAsset({required this.coin, required this.amountHeld, required this.totalInvested, required this.currentValue, required this.profitOrLoss, required this.profitOrLossPercentage});
  

/// The full [Coin] object containing live market data (name, image, price, etc.).
@override final  Coin coin;
/// The total amount of this coin the user currently holds (sum of all buys and sells).
@override final  double amountHeld;
/// The total fiat value the user has spent to acquire the currently held amount (cost basis).
@override final  double totalInvested;
/// The current total fiat value of the user's holding (`amountHeld` * `coin.currentPrice`).
@override final  double currentValue;
/// The total profit or loss in fiat currency (`currentValue` - `totalInvested`).
@override final  double profitOrLoss;
/// The total profit or loss as a percentage.
@override final  double profitOrLossPercentage;

/// Create a copy of PortfolioAsset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioAssetCopyWith<_PortfolioAsset> get copyWith => __$PortfolioAssetCopyWithImpl<_PortfolioAsset>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioAsset&&(identical(other.coin, coin) || other.coin == coin)&&(identical(other.amountHeld, amountHeld) || other.amountHeld == amountHeld)&&(identical(other.totalInvested, totalInvested) || other.totalInvested == totalInvested)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.profitOrLoss, profitOrLoss) || other.profitOrLoss == profitOrLoss)&&(identical(other.profitOrLossPercentage, profitOrLossPercentage) || other.profitOrLossPercentage == profitOrLossPercentage));
}


@override
int get hashCode => Object.hash(runtimeType,coin,amountHeld,totalInvested,currentValue,profitOrLoss,profitOrLossPercentage);

@override
String toString() {
  return 'PortfolioAsset(coin: $coin, amountHeld: $amountHeld, totalInvested: $totalInvested, currentValue: $currentValue, profitOrLoss: $profitOrLoss, profitOrLossPercentage: $profitOrLossPercentage)';
}


}

/// @nodoc
abstract mixin class _$PortfolioAssetCopyWith<$Res> implements $PortfolioAssetCopyWith<$Res> {
  factory _$PortfolioAssetCopyWith(_PortfolioAsset value, $Res Function(_PortfolioAsset) _then) = __$PortfolioAssetCopyWithImpl;
@override @useResult
$Res call({
 Coin coin, double amountHeld, double totalInvested, double currentValue, double profitOrLoss, double profitOrLossPercentage
});


@override $CoinCopyWith<$Res> get coin;

}
/// @nodoc
class __$PortfolioAssetCopyWithImpl<$Res>
    implements _$PortfolioAssetCopyWith<$Res> {
  __$PortfolioAssetCopyWithImpl(this._self, this._then);

  final _PortfolioAsset _self;
  final $Res Function(_PortfolioAsset) _then;

/// Create a copy of PortfolioAsset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coin = null,Object? amountHeld = null,Object? totalInvested = null,Object? currentValue = null,Object? profitOrLoss = null,Object? profitOrLossPercentage = null,}) {
  return _then(_PortfolioAsset(
coin: null == coin ? _self.coin : coin // ignore: cast_nullable_to_non_nullable
as Coin,amountHeld: null == amountHeld ? _self.amountHeld : amountHeld // ignore: cast_nullable_to_non_nullable
as double,totalInvested: null == totalInvested ? _self.totalInvested : totalInvested // ignore: cast_nullable_to_non_nullable
as double,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double,profitOrLoss: null == profitOrLoss ? _self.profitOrLoss : profitOrLoss // ignore: cast_nullable_to_non_nullable
as double,profitOrLossPercentage: null == profitOrLossPercentage ? _self.profitOrLossPercentage : profitOrLossPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of PortfolioAsset
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoinCopyWith<$Res> get coin {
  
  return $CoinCopyWith<$Res>(_self.coin, (value) {
    return _then(_self.copyWith(coin: value));
  });
}
}

// dart format on
