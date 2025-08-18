// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_asset_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PortfolioAssetSummaryModel {

@HiveField(0) String get coinId;@HiveField(1) double get currentAmount;@HiveField(2) double get averageBuyPriceInBaseCurrency;@HiveField(3) double get totalCostBasisInBaseCurrency;@HiveField(4) double get realizedPnlInBaseCurrency;
/// Create a copy of PortfolioAssetSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioAssetSummaryModelCopyWith<PortfolioAssetSummaryModel> get copyWith => _$PortfolioAssetSummaryModelCopyWithImpl<PortfolioAssetSummaryModel>(this as PortfolioAssetSummaryModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioAssetSummaryModel&&(identical(other.coinId, coinId) || other.coinId == coinId)&&(identical(other.currentAmount, currentAmount) || other.currentAmount == currentAmount)&&(identical(other.averageBuyPriceInBaseCurrency, averageBuyPriceInBaseCurrency) || other.averageBuyPriceInBaseCurrency == averageBuyPriceInBaseCurrency)&&(identical(other.totalCostBasisInBaseCurrency, totalCostBasisInBaseCurrency) || other.totalCostBasisInBaseCurrency == totalCostBasisInBaseCurrency)&&(identical(other.realizedPnlInBaseCurrency, realizedPnlInBaseCurrency) || other.realizedPnlInBaseCurrency == realizedPnlInBaseCurrency));
}


@override
int get hashCode => Object.hash(runtimeType,coinId,currentAmount,averageBuyPriceInBaseCurrency,totalCostBasisInBaseCurrency,realizedPnlInBaseCurrency);

@override
String toString() {
  return 'PortfolioAssetSummaryModel(coinId: $coinId, currentAmount: $currentAmount, averageBuyPriceInBaseCurrency: $averageBuyPriceInBaseCurrency, totalCostBasisInBaseCurrency: $totalCostBasisInBaseCurrency, realizedPnlInBaseCurrency: $realizedPnlInBaseCurrency)';
}


}

/// @nodoc
abstract mixin class $PortfolioAssetSummaryModelCopyWith<$Res>  {
  factory $PortfolioAssetSummaryModelCopyWith(PortfolioAssetSummaryModel value, $Res Function(PortfolioAssetSummaryModel) _then) = _$PortfolioAssetSummaryModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String coinId,@HiveField(1) double currentAmount,@HiveField(2) double averageBuyPriceInBaseCurrency,@HiveField(3) double totalCostBasisInBaseCurrency,@HiveField(4) double realizedPnlInBaseCurrency
});




}
/// @nodoc
class _$PortfolioAssetSummaryModelCopyWithImpl<$Res>
    implements $PortfolioAssetSummaryModelCopyWith<$Res> {
  _$PortfolioAssetSummaryModelCopyWithImpl(this._self, this._then);

  final PortfolioAssetSummaryModel _self;
  final $Res Function(PortfolioAssetSummaryModel) _then;

/// Create a copy of PortfolioAssetSummaryModel
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


/// Adds pattern-matching-related methods to [PortfolioAssetSummaryModel].
extension PortfolioAssetSummaryModelPatterns on PortfolioAssetSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioAssetSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioAssetSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioAssetSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioAssetSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioAssetSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioAssetSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String coinId, @HiveField(1)  double currentAmount, @HiveField(2)  double averageBuyPriceInBaseCurrency, @HiveField(3)  double totalCostBasisInBaseCurrency, @HiveField(4)  double realizedPnlInBaseCurrency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioAssetSummaryModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String coinId, @HiveField(1)  double currentAmount, @HiveField(2)  double averageBuyPriceInBaseCurrency, @HiveField(3)  double totalCostBasisInBaseCurrency, @HiveField(4)  double realizedPnlInBaseCurrency)  $default,) {final _that = this;
switch (_that) {
case _PortfolioAssetSummaryModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String coinId, @HiveField(1)  double currentAmount, @HiveField(2)  double averageBuyPriceInBaseCurrency, @HiveField(3)  double totalCostBasisInBaseCurrency, @HiveField(4)  double realizedPnlInBaseCurrency)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioAssetSummaryModel() when $default != null:
return $default(_that.coinId,_that.currentAmount,_that.averageBuyPriceInBaseCurrency,_that.totalCostBasisInBaseCurrency,_that.realizedPnlInBaseCurrency);case _:
  return null;

}
}

}

/// @nodoc


class _PortfolioAssetSummaryModel extends PortfolioAssetSummaryModel {
  const _PortfolioAssetSummaryModel({@HiveField(0) required this.coinId, @HiveField(1) required this.currentAmount, @HiveField(2) required this.averageBuyPriceInBaseCurrency, @HiveField(3) required this.totalCostBasisInBaseCurrency, @HiveField(4) required this.realizedPnlInBaseCurrency}): super._();
  

@override@HiveField(0) final  String coinId;
@override@HiveField(1) final  double currentAmount;
@override@HiveField(2) final  double averageBuyPriceInBaseCurrency;
@override@HiveField(3) final  double totalCostBasisInBaseCurrency;
@override@HiveField(4) final  double realizedPnlInBaseCurrency;

/// Create a copy of PortfolioAssetSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioAssetSummaryModelCopyWith<_PortfolioAssetSummaryModel> get copyWith => __$PortfolioAssetSummaryModelCopyWithImpl<_PortfolioAssetSummaryModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioAssetSummaryModel&&(identical(other.coinId, coinId) || other.coinId == coinId)&&(identical(other.currentAmount, currentAmount) || other.currentAmount == currentAmount)&&(identical(other.averageBuyPriceInBaseCurrency, averageBuyPriceInBaseCurrency) || other.averageBuyPriceInBaseCurrency == averageBuyPriceInBaseCurrency)&&(identical(other.totalCostBasisInBaseCurrency, totalCostBasisInBaseCurrency) || other.totalCostBasisInBaseCurrency == totalCostBasisInBaseCurrency)&&(identical(other.realizedPnlInBaseCurrency, realizedPnlInBaseCurrency) || other.realizedPnlInBaseCurrency == realizedPnlInBaseCurrency));
}


@override
int get hashCode => Object.hash(runtimeType,coinId,currentAmount,averageBuyPriceInBaseCurrency,totalCostBasisInBaseCurrency,realizedPnlInBaseCurrency);

@override
String toString() {
  return 'PortfolioAssetSummaryModel(coinId: $coinId, currentAmount: $currentAmount, averageBuyPriceInBaseCurrency: $averageBuyPriceInBaseCurrency, totalCostBasisInBaseCurrency: $totalCostBasisInBaseCurrency, realizedPnlInBaseCurrency: $realizedPnlInBaseCurrency)';
}


}

/// @nodoc
abstract mixin class _$PortfolioAssetSummaryModelCopyWith<$Res> implements $PortfolioAssetSummaryModelCopyWith<$Res> {
  factory _$PortfolioAssetSummaryModelCopyWith(_PortfolioAssetSummaryModel value, $Res Function(_PortfolioAssetSummaryModel) _then) = __$PortfolioAssetSummaryModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String coinId,@HiveField(1) double currentAmount,@HiveField(2) double averageBuyPriceInBaseCurrency,@HiveField(3) double totalCostBasisInBaseCurrency,@HiveField(4) double realizedPnlInBaseCurrency
});




}
/// @nodoc
class __$PortfolioAssetSummaryModelCopyWithImpl<$Res>
    implements _$PortfolioAssetSummaryModelCopyWith<$Res> {
  __$PortfolioAssetSummaryModelCopyWithImpl(this._self, this._then);

  final _PortfolioAssetSummaryModel _self;
  final $Res Function(_PortfolioAssetSummaryModel) _then;

/// Create a copy of PortfolioAssetSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coinId = null,Object? currentAmount = null,Object? averageBuyPriceInBaseCurrency = null,Object? totalCostBasisInBaseCurrency = null,Object? realizedPnlInBaseCurrency = null,}) {
  return _then(_PortfolioAssetSummaryModel(
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
