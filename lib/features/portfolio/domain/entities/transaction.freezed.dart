// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Transaction {

/// ULID string
 String get id;/// Coin id, e.g. bitcoin, etherium
 String get coinId;/// The type of the transaction (buy or sell).
 TransactionType get type;/// The quantity of the crypto asset transacted.
 double get amount;/// The price of a single unit of the crypto asset in the specified [fiatCurrency].
 double get pricePerCoin;/// The fiat currency in which the transaction was made.
 FiatCurrency get fiatCurrency;/// The exchange rate to the app's base currency (e.g., USD) on the transaction date.
/// Example: If 1 EUR = 1.08 USD, this value is 1.08. For a USD transaction, it's 1.0.
 double get conversionRateToBase;/// The exact date and time of the transaction.
 DateTime get transactionDate;
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCopyWith<Transaction> get copyWith => _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.coinId, coinId) || other.coinId == coinId)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.pricePerCoin, pricePerCoin) || other.pricePerCoin == pricePerCoin)&&(identical(other.fiatCurrency, fiatCurrency) || other.fiatCurrency == fiatCurrency)&&(identical(other.conversionRateToBase, conversionRateToBase) || other.conversionRateToBase == conversionRateToBase)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,coinId,type,amount,pricePerCoin,fiatCurrency,conversionRateToBase,transactionDate);

@override
String toString() {
  return 'Transaction(id: $id, coinId: $coinId, type: $type, amount: $amount, pricePerCoin: $pricePerCoin, fiatCurrency: $fiatCurrency, conversionRateToBase: $conversionRateToBase, transactionDate: $transactionDate)';
}


}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res>  {
  factory $TransactionCopyWith(Transaction value, $Res Function(Transaction) _then) = _$TransactionCopyWithImpl;
@useResult
$Res call({
 String id, String coinId, TransactionType type, double amount, double pricePerCoin, FiatCurrency fiatCurrency, double conversionRateToBase, DateTime transactionDate
});




}
/// @nodoc
class _$TransactionCopyWithImpl<$Res>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? coinId = null,Object? type = null,Object? amount = null,Object? pricePerCoin = null,Object? fiatCurrency = null,Object? conversionRateToBase = null,Object? transactionDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coinId: null == coinId ? _self.coinId : coinId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,pricePerCoin: null == pricePerCoin ? _self.pricePerCoin : pricePerCoin // ignore: cast_nullable_to_non_nullable
as double,fiatCurrency: null == fiatCurrency ? _self.fiatCurrency : fiatCurrency // ignore: cast_nullable_to_non_nullable
as FiatCurrency,conversionRateToBase: null == conversionRateToBase ? _self.conversionRateToBase : conversionRateToBase // ignore: cast_nullable_to_non_nullable
as double,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Transaction].
extension TransactionPatterns on Transaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transaction value)  $default,){
final _that = this;
switch (_that) {
case _Transaction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transaction value)?  $default,){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String coinId,  TransactionType type,  double amount,  double pricePerCoin,  FiatCurrency fiatCurrency,  double conversionRateToBase,  DateTime transactionDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String coinId,  TransactionType type,  double amount,  double pricePerCoin,  FiatCurrency fiatCurrency,  double conversionRateToBase,  DateTime transactionDate)  $default,) {final _that = this;
switch (_that) {
case _Transaction():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String coinId,  TransactionType type,  double amount,  double pricePerCoin,  FiatCurrency fiatCurrency,  double conversionRateToBase,  DateTime transactionDate)?  $default,) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.coinId,_that.type,_that.amount,_that.pricePerCoin,_that.fiatCurrency,_that.conversionRateToBase,_that.transactionDate);case _:
  return null;

}
}

}

/// @nodoc


class _Transaction extends Transaction {
  const _Transaction({required this.id, required this.coinId, required this.type, required this.amount, required this.pricePerCoin, required this.fiatCurrency, required this.conversionRateToBase, required this.transactionDate}): super._();
  

/// ULID string
@override final  String id;
/// Coin id, e.g. bitcoin, etherium
@override final  String coinId;
/// The type of the transaction (buy or sell).
@override final  TransactionType type;
/// The quantity of the crypto asset transacted.
@override final  double amount;
/// The price of a single unit of the crypto asset in the specified [fiatCurrency].
@override final  double pricePerCoin;
/// The fiat currency in which the transaction was made.
@override final  FiatCurrency fiatCurrency;
/// The exchange rate to the app's base currency (e.g., USD) on the transaction date.
/// Example: If 1 EUR = 1.08 USD, this value is 1.08. For a USD transaction, it's 1.0.
@override final  double conversionRateToBase;
/// The exact date and time of the transaction.
@override final  DateTime transactionDate;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionCopyWith<_Transaction> get copyWith => __$TransactionCopyWithImpl<_Transaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.coinId, coinId) || other.coinId == coinId)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.pricePerCoin, pricePerCoin) || other.pricePerCoin == pricePerCoin)&&(identical(other.fiatCurrency, fiatCurrency) || other.fiatCurrency == fiatCurrency)&&(identical(other.conversionRateToBase, conversionRateToBase) || other.conversionRateToBase == conversionRateToBase)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,coinId,type,amount,pricePerCoin,fiatCurrency,conversionRateToBase,transactionDate);

@override
String toString() {
  return 'Transaction(id: $id, coinId: $coinId, type: $type, amount: $amount, pricePerCoin: $pricePerCoin, fiatCurrency: $fiatCurrency, conversionRateToBase: $conversionRateToBase, transactionDate: $transactionDate)';
}


}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(_Transaction value, $Res Function(_Transaction) _then) = __$TransactionCopyWithImpl;
@override @useResult
$Res call({
 String id, String coinId, TransactionType type, double amount, double pricePerCoin, FiatCurrency fiatCurrency, double conversionRateToBase, DateTime transactionDate
});




}
/// @nodoc
class __$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(this._self, this._then);

  final _Transaction _self;
  final $Res Function(_Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? coinId = null,Object? type = null,Object? amount = null,Object? pricePerCoin = null,Object? fiatCurrency = null,Object? conversionRateToBase = null,Object? transactionDate = null,}) {
  return _then(_Transaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coinId: null == coinId ? _self.coinId : coinId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,pricePerCoin: null == pricePerCoin ? _self.pricePerCoin : pricePerCoin // ignore: cast_nullable_to_non_nullable
as double,fiatCurrency: null == fiatCurrency ? _self.fiatCurrency : fiatCurrency // ignore: cast_nullable_to_non_nullable
as FiatCurrency,conversionRateToBase: null == conversionRateToBase ? _self.conversionRateToBase : conversionRateToBase // ignore: cast_nullable_to_non_nullable
as double,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
