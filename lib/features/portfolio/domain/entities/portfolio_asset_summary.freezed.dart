// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_asset_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PortfolioAssetSummary {

/// The unique identifier for the crypto asset (e.g., "bitcoin").
 String get coinId;/// The current total quantity of the asset held by the user.
 double get currentAmount;/// NOTE: All financial values below are ALWAYS stored in the app's
/// single, consistent base currency (e.g., USD) to ensure data integrity.
/// The average price paid for the assets currently held, in the base currency(USD).
 double get averageBuyPriceInBaseCurrency;/// The total money spent on the assets currently held, in the base currency(USD).
 double get totalCostBasisInBaseCurrency;/// The total profit or loss that has been "locked in" from all historical sales of this asset(USD).
 double get realizedPnlInBaseCurrency;
/// Create a copy of PortfolioAssetSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioAssetSummaryCopyWith<PortfolioAssetSummary> get copyWith => _$PortfolioAssetSummaryCopyWithImpl<PortfolioAssetSummary>(this as PortfolioAssetSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioAssetSummary&&(identical(other.coinId, coinId) || other.coinId == coinId)&&(identical(other.currentAmount, currentAmount) || other.currentAmount == currentAmount)&&(identical(other.averageBuyPriceInBaseCurrency, averageBuyPriceInBaseCurrency) || other.averageBuyPriceInBaseCurrency == averageBuyPriceInBaseCurrency)&&(identical(other.totalCostBasisInBaseCurrency, totalCostBasisInBaseCurrency) || other.totalCostBasisInBaseCurrency == totalCostBasisInBaseCurrency)&&(identical(other.realizedPnlInBaseCurrency, realizedPnlInBaseCurrency) || other.realizedPnlInBaseCurrency == realizedPnlInBaseCurrency));
}


@override
int get hashCode => Object.hash(runtimeType,coinId,currentAmount,averageBuyPriceInBaseCurrency,totalCostBasisInBaseCurrency,realizedPnlInBaseCurrency);

@override
String toString() {
  return 'PortfolioAssetSummary(coinId: $coinId, currentAmount: $currentAmount, averageBuyPriceInBaseCurrency: $averageBuyPriceInBaseCurrency, totalCostBasisInBaseCurrency: $totalCostBasisInBaseCurrency, realizedPnlInBaseCurrency: $realizedPnlInBaseCurrency)';
}


}

/// @nodoc
abstract mixin class $PortfolioAssetSummaryCopyWith<$Res>  {
  factory $PortfolioAssetSummaryCopyWith(PortfolioAssetSummary value, $Res Function(PortfolioAssetSummary) _then) = _$PortfolioAssetSummaryCopyWithImpl;
@useResult
$Res call({
 String coinId, double currentAmount, double averageBuyPriceInBaseCurrency, double totalCostBasisInBaseCurrency, double realizedPnlInBaseCurrency
});




}
/// @nodoc
class _$PortfolioAssetSummaryCopyWithImpl<$Res>
    implements $PortfolioAssetSummaryCopyWith<$Res> {
  _$PortfolioAssetSummaryCopyWithImpl(this._self, this._then);

  final PortfolioAssetSummary _self;
  final $Res Function(PortfolioAssetSummary) _then;

/// Create a copy of PortfolioAssetSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coinId = null,Object? currentAmount = null,Object? averageBuyPriceInBaseCurrency = null,Object? totalCostBasisInBaseCurrency = null,Object? realizedPnlInBaseCurrency = null,}) {
  return _then(_self.copyWith(
coinId: null == coinId ? _self.coinId : coinId // ignore: cast_nullable_to_non_nullable
as String,currentAmount: null == currentAmount ? _self.currentAmount : currentAmount // ignore: cast_nullable_to_non_nullable
as double,averageBuyPriceInBaseCurrency: null == averageBuyPriceInBaseCurrency ? _self.averageBuyPriceInBaseCurrency : averageBuyPriceInBaseCurrency // ignore: cast_nullable_to_non_nullable
as double,totalCostBasisInBaseCurrency: null == totalCostBasisInBaseCurrency ? _self.totalCostBasisInBaseCurrency : totalCostBasisInBaseCurrency // ignore: cast_nullable_to_non_nullable
as double,realizedPnlInBaseCurrency: null == realizedPnlInBaseCurrency ? _self.realizedPnlInBaseCurrency : realizedPnlInBaseCurrency // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioAssetSummary].
extension PortfolioAssetSummaryPatterns on PortfolioAssetSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioAssetSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioAssetSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioAssetSummary value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioAssetSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioAssetSummary value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioAssetSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String coinId,  double currentAmount,  double averageBuyPriceInBaseCurrency,  double totalCostBasisInBaseCurrency,  double realizedPnlInBaseCurrency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioAssetSummary() when $default != null:
return $default(_that.coinId,_that.currentAmount,_that.averageBuyPriceInBaseCurrency,_that.totalCostBasisInBaseCurrency,_that.realizedPnlInBaseCurrency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String coinId,  double currentAmount,  double averageBuyPriceInBaseCurrency,  double totalCostBasisInBaseCurrency,  double realizedPnlInBaseCurrency)  $default,) {final _that = this;
switch (_that) {
case _PortfolioAssetSummary():
return $default(_that.coinId,_that.currentAmount,_that.averageBuyPriceInBaseCurrency,_that.totalCostBasisInBaseCurrency,_that.realizedPnlInBaseCurrency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String coinId,  double currentAmount,  double averageBuyPriceInBaseCurrency,  double totalCostBasisInBaseCurrency,  double realizedPnlInBaseCurrency)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioAssetSummary() when $default != null:
return $default(_that.coinId,_that.currentAmount,_that.averageBuyPriceInBaseCurrency,_that.totalCostBasisInBaseCurrency,_that.realizedPnlInBaseCurrency);case _:
  return null;

}
}

}

/// @nodoc


class _PortfolioAssetSummary implements PortfolioAssetSummary {
  const _PortfolioAssetSummary({required this.coinId, required this.currentAmount, required this.averageBuyPriceInBaseCurrency, required this.totalCostBasisInBaseCurrency, required this.realizedPnlInBaseCurrency});
  

/// The unique identifier for the crypto asset (e.g., "bitcoin").
@override final  String coinId;
/// The current total quantity of the asset held by the user.
@override final  double currentAmount;
/// NOTE: All financial values below are ALWAYS stored in the app's
/// single, consistent base currency (e.g., USD) to ensure data integrity.
/// The average price paid for the assets currently held, in the base currency(USD).
@override final  double averageBuyPriceInBaseCurrency;
/// The total money spent on the assets currently held, in the base currency(USD).
@override final  double totalCostBasisInBaseCurrency;
/// The total profit or loss that has been "locked in" from all historical sales of this asset(USD).
@override final  double realizedPnlInBaseCurrency;

/// Create a copy of PortfolioAssetSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioAssetSummaryCopyWith<_PortfolioAssetSummary> get copyWith => __$PortfolioAssetSummaryCopyWithImpl<_PortfolioAssetSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioAssetSummary&&(identical(other.coinId, coinId) || other.coinId == coinId)&&(identical(other.currentAmount, currentAmount) || other.currentAmount == currentAmount)&&(identical(other.averageBuyPriceInBaseCurrency, averageBuyPriceInBaseCurrency) || other.averageBuyPriceInBaseCurrency == averageBuyPriceInBaseCurrency)&&(identical(other.totalCostBasisInBaseCurrency, totalCostBasisInBaseCurrency) || other.totalCostBasisInBaseCurrency == totalCostBasisInBaseCurrency)&&(identical(other.realizedPnlInBaseCurrency, realizedPnlInBaseCurrency) || other.realizedPnlInBaseCurrency == realizedPnlInBaseCurrency));
}


@override
int get hashCode => Object.hash(runtimeType,coinId,currentAmount,averageBuyPriceInBaseCurrency,totalCostBasisInBaseCurrency,realizedPnlInBaseCurrency);

@override
String toString() {
  return 'PortfolioAssetSummary(coinId: $coinId, currentAmount: $currentAmount, averageBuyPriceInBaseCurrency: $averageBuyPriceInBaseCurrency, totalCostBasisInBaseCurrency: $totalCostBasisInBaseCurrency, realizedPnlInBaseCurrency: $realizedPnlInBaseCurrency)';
}


}

/// @nodoc
abstract mixin class _$PortfolioAssetSummaryCopyWith<$Res> implements $PortfolioAssetSummaryCopyWith<$Res> {
  factory _$PortfolioAssetSummaryCopyWith(_PortfolioAssetSummary value, $Res Function(_PortfolioAssetSummary) _then) = __$PortfolioAssetSummaryCopyWithImpl;
@override @useResult
$Res call({
 String coinId, double currentAmount, double averageBuyPriceInBaseCurrency, double totalCostBasisInBaseCurrency, double realizedPnlInBaseCurrency
});




}
/// @nodoc
class __$PortfolioAssetSummaryCopyWithImpl<$Res>
    implements _$PortfolioAssetSummaryCopyWith<$Res> {
  __$PortfolioAssetSummaryCopyWithImpl(this._self, this._then);

  final _PortfolioAssetSummary _self;
  final $Res Function(_PortfolioAssetSummary) _then;

/// Create a copy of PortfolioAssetSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coinId = null,Object? currentAmount = null,Object? averageBuyPriceInBaseCurrency = null,Object? totalCostBasisInBaseCurrency = null,Object? realizedPnlInBaseCurrency = null,}) {
  return _then(_PortfolioAssetSummary(
coinId: null == coinId ? _self.coinId : coinId // ignore: cast_nullable_to_non_nullable
as String,currentAmount: null == currentAmount ? _self.currentAmount : currentAmount // ignore: cast_nullable_to_non_nullable
as double,averageBuyPriceInBaseCurrency: null == averageBuyPriceInBaseCurrency ? _self.averageBuyPriceInBaseCurrency : averageBuyPriceInBaseCurrency // ignore: cast_nullable_to_non_nullable
as double,totalCostBasisInBaseCurrency: null == totalCostBasisInBaseCurrency ? _self.totalCostBasisInBaseCurrency : totalCostBasisInBaseCurrency // ignore: cast_nullable_to_non_nullable
as double,realizedPnlInBaseCurrency: null == realizedPnlInBaseCurrency ? _self.realizedPnlInBaseCurrency : realizedPnlInBaseCurrency // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
