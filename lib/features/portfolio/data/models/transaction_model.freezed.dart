// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionModel {

@HiveField(0) String get id;@HiveField(1) String get coinId;@HiveField(2) String get type;@HiveField(3) double get amount;@HiveField(4) double get pricePerCoin;@HiveField(5) String get fiatCurrency;@HiveField(6) double get conversionRateToBase;@HiveField(7) DateTime get transactionDate;
/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionModelCopyWith<TransactionModel> get copyWith => _$TransactionModelCopyWithImpl<TransactionModel>(this as TransactionModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.coinId, coinId) || other.coinId == coinId)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.pricePerCoin, pricePerCoin) || other.pricePerCoin == pricePerCoin)&&(identical(other.fiatCurrency, fiatCurrency) || other.fiatCurrency == fiatCurrency)&&(identical(other.conversionRateToBase, conversionRateToBase) || other.conversionRateToBase == conversionRateToBase)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,coinId,type,amount,pricePerCoin,fiatCurrency,conversionRateToBase,transactionDate);

@override
String toString() {
  return 'TransactionModel(id: $id, coinId: $coinId, type: $type, amount: $amount, pricePerCoin: $pricePerCoin, fiatCurrency: $fiatCurrency, conversionRateToBase: $conversionRateToBase, transactionDate: $transactionDate)';
}


}

/// @nodoc
abstract mixin class $TransactionModelCopyWith<$Res>  {
  factory $TransactionModelCopyWith(TransactionModel value, $Res Function(TransactionModel) _then) = _$TransactionModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String coinId,@HiveField(2) String type,@HiveField(3) double amount,@HiveField(4) double pricePerCoin,@HiveField(5) String fiatCurrency,@HiveField(6) double conversionRateToBase,@HiveField(7) DateTime transactionDate
});




}
/// @nodoc
class _$TransactionModelCopyWithImpl<$Res>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._self, this._then);

  final TransactionModel _self;
  final $Res Function(TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? coinId = null,Object? type = null,Object? amount = null,Object? pricePerCoin = null,Object? fiatCurrency = null,Object? conversionRateToBase = null,Object? transactionDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coinId: null == coinId ? _self.coinId : coinId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,pricePerCoin: null == pricePerCoin ? _self.pricePerCoin : pricePerCoin // ignore: cast_nullable_to_non_nullable
as double,fiatCurrency: null == fiatCurrency ? _self.fiatCurrency : fiatCurrency // ignore: cast_nullable_to_non_nullable
as String,conversionRateToBase: null == conversionRateToBase ? _self.conversionRateToBase : conversionRateToBase // ignore: cast_nullable_to_non_nullable
as double,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionModel].
extension TransactionModelPatterns on TransactionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String coinId, @HiveField(2)  String type, @HiveField(3)  double amount, @HiveField(4)  double pricePerCoin, @HiveField(5)  String fiatCurrency, @HiveField(6)  double conversionRateToBase, @HiveField(7)  DateTime transactionDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.id,_that.coinId,_that.type,_that.amount,_that.pricePerCoin,_that.fiatCurrency,_that.conversionRateToBase,_that.transactionDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String coinId, @HiveField(2)  String type, @HiveField(3)  double amount, @HiveField(4)  double pricePerCoin, @HiveField(5)  String fiatCurrency, @HiveField(6)  double conversionRateToBase, @HiveField(7)  DateTime transactionDate)  $default,) {final _that = this;
switch (_that) {
case _TransactionModel():
return $default(_that.id,_that.coinId,_that.type,_that.amount,_that.pricePerCoin,_that.fiatCurrency,_that.conversionRateToBase,_that.transactionDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String id, @HiveField(1)  String coinId, @HiveField(2)  String type, @HiveField(3)  double amount, @HiveField(4)  double pricePerCoin, @HiveField(5)  String fiatCurrency, @HiveField(6)  double conversionRateToBase, @HiveField(7)  DateTime transactionDate)?  $default,) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.id,_that.coinId,_that.type,_that.amount,_that.pricePerCoin,_that.fiatCurrency,_that.conversionRateToBase,_that.transactionDate);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionModel extends TransactionModel {
  const _TransactionModel({@HiveField(0) required this.id, @HiveField(1) required this.coinId, @HiveField(2) required this.type, @HiveField(3) required this.amount, @HiveField(4) required this.pricePerCoin, @HiveField(5) required this.fiatCurrency, @HiveField(6) required this.conversionRateToBase, @HiveField(7) required this.transactionDate}): super._();
  

@override@HiveField(0) final  String id;
@override@HiveField(1) final  String coinId;
@override@HiveField(2) final  String type;
@override@HiveField(3) final  double amount;
@override@HiveField(4) final  double pricePerCoin;
@override@HiveField(5) final  String fiatCurrency;
@override@HiveField(6) final  double conversionRateToBase;
@override@HiveField(7) final  DateTime transactionDate;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionModelCopyWith<_TransactionModel> get copyWith => __$TransactionModelCopyWithImpl<_TransactionModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.coinId, coinId) || other.coinId == coinId)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.pricePerCoin, pricePerCoin) || other.pricePerCoin == pricePerCoin)&&(identical(other.fiatCurrency, fiatCurrency) || other.fiatCurrency == fiatCurrency)&&(identical(other.conversionRateToBase, conversionRateToBase) || other.conversionRateToBase == conversionRateToBase)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,coinId,type,amount,pricePerCoin,fiatCurrency,conversionRateToBase,transactionDate);

@override
String toString() {
  return 'TransactionModel(id: $id, coinId: $coinId, type: $type, amount: $amount, pricePerCoin: $pricePerCoin, fiatCurrency: $fiatCurrency, conversionRateToBase: $conversionRateToBase, transactionDate: $transactionDate)';
}


}

/// @nodoc
abstract mixin class _$TransactionModelCopyWith<$Res> implements $TransactionModelCopyWith<$Res> {
  factory _$TransactionModelCopyWith(_TransactionModel value, $Res Function(_TransactionModel) _then) = __$TransactionModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String coinId,@HiveField(2) String type,@HiveField(3) double amount,@HiveField(4) double pricePerCoin,@HiveField(5) String fiatCurrency,@HiveField(6) double conversionRateToBase,@HiveField(7) DateTime transactionDate
});




}
/// @nodoc
class __$TransactionModelCopyWithImpl<$Res>
    implements _$TransactionModelCopyWith<$Res> {
  __$TransactionModelCopyWithImpl(this._self, this._then);

  final _TransactionModel _self;
  final $Res Function(_TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? coinId = null,Object? type = null,Object? amount = null,Object? pricePerCoin = null,Object? fiatCurrency = null,Object? conversionRateToBase = null,Object? transactionDate = null,}) {
  return _then(_TransactionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coinId: null == coinId ? _self.coinId : coinId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,pricePerCoin: null == pricePerCoin ? _self.pricePerCoin : pricePerCoin // ignore: cast_nullable_to_non_nullable
as double,fiatCurrency: null == fiatCurrency ? _self.fiatCurrency : fiatCurrency // ignore: cast_nullable_to_non_nullable
as String,conversionRateToBase: null == conversionRateToBase ? _self.conversionRateToBase : conversionRateToBase // ignore: cast_nullable_to_non_nullable
as double,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
