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
mixin _$Transaction {

/// A unique identifier for the transaction (e.g., a UUID).
@HiveField(0) String get id;/// The ID of the coin being transacted, linking to a [Coin].id.
@HiveField(1) String get coinId;/// The type of transaction, either [TransactionType.buy] or [TransactionType.sell].
@HiveField(2) TransactionType get type;/// The quantity of the coin that was bought or sold.
@HiveField(3) double get amount;/// The price of a single coin at the time of the transaction.
/// This should be stored in a consistent base currency (e.g., USD).
@HiveField(4) double get pricePerCoin;/// The date and time the transaction occurred.
@HiveField(5) DateTime get date;
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCopyWith<Transaction> get copyWith => _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.coinId, coinId) || other.coinId == coinId)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.pricePerCoin, pricePerCoin) || other.pricePerCoin == pricePerCoin)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,id,coinId,type,amount,pricePerCoin,date);

@override
String toString() {
  return 'Transaction(id: $id, coinId: $coinId, type: $type, amount: $amount, pricePerCoin: $pricePerCoin, date: $date)';
}


}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res>  {
  factory $TransactionCopyWith(Transaction value, $Res Function(Transaction) _then) = _$TransactionCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String coinId,@HiveField(2) TransactionType type,@HiveField(3) double amount,@HiveField(4) double pricePerCoin,@HiveField(5) DateTime date
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? coinId = null,Object? type = null,Object? amount = null,Object? pricePerCoin = null,Object? date = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coinId: null == coinId ? _self.coinId : coinId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,pricePerCoin: null == pricePerCoin ? _self.pricePerCoin : pricePerCoin // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String coinId, @HiveField(2)  TransactionType type, @HiveField(3)  double amount, @HiveField(4)  double pricePerCoin, @HiveField(5)  DateTime date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.coinId,_that.type,_that.amount,_that.pricePerCoin,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String coinId, @HiveField(2)  TransactionType type, @HiveField(3)  double amount, @HiveField(4)  double pricePerCoin, @HiveField(5)  DateTime date)  $default,) {final _that = this;
switch (_that) {
case _Transaction():
return $default(_that.id,_that.coinId,_that.type,_that.amount,_that.pricePerCoin,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String id, @HiveField(1)  String coinId, @HiveField(2)  TransactionType type, @HiveField(3)  double amount, @HiveField(4)  double pricePerCoin, @HiveField(5)  DateTime date)?  $default,) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.coinId,_that.type,_that.amount,_that.pricePerCoin,_that.date);case _:
  return null;

}
}

}

/// @nodoc


class _Transaction implements Transaction {
  const _Transaction({@HiveField(0) required this.id, @HiveField(1) required this.coinId, @HiveField(2) required this.type, @HiveField(3) required this.amount, @HiveField(4) required this.pricePerCoin, @HiveField(5) required this.date});
  

/// A unique identifier for the transaction (e.g., a UUID).
@override@HiveField(0) final  String id;
/// The ID of the coin being transacted, linking to a [Coin].id.
@override@HiveField(1) final  String coinId;
/// The type of transaction, either [TransactionType.buy] or [TransactionType.sell].
@override@HiveField(2) final  TransactionType type;
/// The quantity of the coin that was bought or sold.
@override@HiveField(3) final  double amount;
/// The price of a single coin at the time of the transaction.
/// This should be stored in a consistent base currency (e.g., USD).
@override@HiveField(4) final  double pricePerCoin;
/// The date and time the transaction occurred.
@override@HiveField(5) final  DateTime date;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionCopyWith<_Transaction> get copyWith => __$TransactionCopyWithImpl<_Transaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.coinId, coinId) || other.coinId == coinId)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.pricePerCoin, pricePerCoin) || other.pricePerCoin == pricePerCoin)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,id,coinId,type,amount,pricePerCoin,date);

@override
String toString() {
  return 'Transaction(id: $id, coinId: $coinId, type: $type, amount: $amount, pricePerCoin: $pricePerCoin, date: $date)';
}


}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(_Transaction value, $Res Function(_Transaction) _then) = __$TransactionCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String coinId,@HiveField(2) TransactionType type,@HiveField(3) double amount,@HiveField(4) double pricePerCoin,@HiveField(5) DateTime date
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? coinId = null,Object? type = null,Object? amount = null,Object? pricePerCoin = null,Object? date = null,}) {
  return _then(_Transaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coinId: null == coinId ? _self.coinId : coinId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,pricePerCoin: null == pricePerCoin ? _self.pricePerCoin : pricePerCoin // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
