// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoinDetails {

/// A map of language codes (e.g., 'en', 'es') to their respective coin descriptions.
 Map<String, String> get description;/// Contains URLs for the coin's homepage, blockchain explorers, etc.
 CoinLinks get links;/// Contains detailed market data like all-time high, all-time low, etc.
@JsonKey(name: 'market_data') MarketData get marketData;
/// Create a copy of CoinDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinDetailsCopyWith<CoinDetails> get copyWith => _$CoinDetailsCopyWithImpl<CoinDetails>(this as CoinDetails, _$identity);

  /// Serializes this CoinDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinDetails&&const DeepCollectionEquality().equals(other.description, description)&&(identical(other.links, links) || other.links == links)&&(identical(other.marketData, marketData) || other.marketData == marketData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(description),links,marketData);

@override
String toString() {
  return 'CoinDetails(description: $description, links: $links, marketData: $marketData)';
}


}

/// @nodoc
abstract mixin class $CoinDetailsCopyWith<$Res>  {
  factory $CoinDetailsCopyWith(CoinDetails value, $Res Function(CoinDetails) _then) = _$CoinDetailsCopyWithImpl;
@useResult
$Res call({
 Map<String, String> description, CoinLinks links,@JsonKey(name: 'market_data') MarketData marketData
});


$CoinLinksCopyWith<$Res> get links;$MarketDataCopyWith<$Res> get marketData;

}
/// @nodoc
class _$CoinDetailsCopyWithImpl<$Res>
    implements $CoinDetailsCopyWith<$Res> {
  _$CoinDetailsCopyWithImpl(this._self, this._then);

  final CoinDetails _self;
  final $Res Function(CoinDetails) _then;

/// Create a copy of CoinDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? description = null,Object? links = null,Object? marketData = null,}) {
  return _then(_self.copyWith(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as CoinLinks,marketData: null == marketData ? _self.marketData : marketData // ignore: cast_nullable_to_non_nullable
as MarketData,
  ));
}
/// Create a copy of CoinDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoinLinksCopyWith<$Res> get links {
  
  return $CoinLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of CoinDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MarketDataCopyWith<$Res> get marketData {
  
  return $MarketDataCopyWith<$Res>(_self.marketData, (value) {
    return _then(_self.copyWith(marketData: value));
  });
}
}


/// Adds pattern-matching-related methods to [CoinDetails].
extension CoinDetailsPatterns on CoinDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinDetails value)  $default,){
final _that = this;
switch (_that) {
case _CoinDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinDetails value)?  $default,){
final _that = this;
switch (_that) {
case _CoinDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, String> description,  CoinLinks links, @JsonKey(name: 'market_data')  MarketData marketData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinDetails() when $default != null:
return $default(_that.description,_that.links,_that.marketData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, String> description,  CoinLinks links, @JsonKey(name: 'market_data')  MarketData marketData)  $default,) {final _that = this;
switch (_that) {
case _CoinDetails():
return $default(_that.description,_that.links,_that.marketData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, String> description,  CoinLinks links, @JsonKey(name: 'market_data')  MarketData marketData)?  $default,) {final _that = this;
switch (_that) {
case _CoinDetails() when $default != null:
return $default(_that.description,_that.links,_that.marketData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoinDetails implements CoinDetails {
  const _CoinDetails({required final  Map<String, String> description, required this.links, @JsonKey(name: 'market_data') required this.marketData}): _description = description;
  factory _CoinDetails.fromJson(Map<String, dynamic> json) => _$CoinDetailsFromJson(json);

/// A map of language codes (e.g., 'en', 'es') to their respective coin descriptions.
 final  Map<String, String> _description;
/// A map of language codes (e.g., 'en', 'es') to their respective coin descriptions.
@override Map<String, String> get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}

/// Contains URLs for the coin's homepage, blockchain explorers, etc.
@override final  CoinLinks links;
/// Contains detailed market data like all-time high, all-time low, etc.
@override@JsonKey(name: 'market_data') final  MarketData marketData;

/// Create a copy of CoinDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinDetailsCopyWith<_CoinDetails> get copyWith => __$CoinDetailsCopyWithImpl<_CoinDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoinDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinDetails&&const DeepCollectionEquality().equals(other._description, _description)&&(identical(other.links, links) || other.links == links)&&(identical(other.marketData, marketData) || other.marketData == marketData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_description),links,marketData);

@override
String toString() {
  return 'CoinDetails(description: $description, links: $links, marketData: $marketData)';
}


}

/// @nodoc
abstract mixin class _$CoinDetailsCopyWith<$Res> implements $CoinDetailsCopyWith<$Res> {
  factory _$CoinDetailsCopyWith(_CoinDetails value, $Res Function(_CoinDetails) _then) = __$CoinDetailsCopyWithImpl;
@override @useResult
$Res call({
 Map<String, String> description, CoinLinks links,@JsonKey(name: 'market_data') MarketData marketData
});


@override $CoinLinksCopyWith<$Res> get links;@override $MarketDataCopyWith<$Res> get marketData;

}
/// @nodoc
class __$CoinDetailsCopyWithImpl<$Res>
    implements _$CoinDetailsCopyWith<$Res> {
  __$CoinDetailsCopyWithImpl(this._self, this._then);

  final _CoinDetails _self;
  final $Res Function(_CoinDetails) _then;

/// Create a copy of CoinDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? description = null,Object? links = null,Object? marketData = null,}) {
  return _then(_CoinDetails(
description: null == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as CoinLinks,marketData: null == marketData ? _self.marketData : marketData // ignore: cast_nullable_to_non_nullable
as MarketData,
  ));
}

/// Create a copy of CoinDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoinLinksCopyWith<$Res> get links {
  
  return $CoinLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of CoinDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MarketDataCopyWith<$Res> get marketData {
  
  return $MarketDataCopyWith<$Res>(_self.marketData, (value) {
    return _then(_self.copyWith(marketData: value));
  });
}
}


/// @nodoc
mixin _$CoinLinks {

/// A list of homepage URLs. Typically only the first one is used.
@JsonKey(name: 'homepage', defaultValue: []) List<String> get homepage;/// A list of blockchain explorer URLs.
@JsonKey(name: 'blockchain_site', defaultValue: []) List<String> get blockchainSite;
/// Create a copy of CoinLinks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinLinksCopyWith<CoinLinks> get copyWith => _$CoinLinksCopyWithImpl<CoinLinks>(this as CoinLinks, _$identity);

  /// Serializes this CoinLinks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinLinks&&const DeepCollectionEquality().equals(other.homepage, homepage)&&const DeepCollectionEquality().equals(other.blockchainSite, blockchainSite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(homepage),const DeepCollectionEquality().hash(blockchainSite));

@override
String toString() {
  return 'CoinLinks(homepage: $homepage, blockchainSite: $blockchainSite)';
}


}

/// @nodoc
abstract mixin class $CoinLinksCopyWith<$Res>  {
  factory $CoinLinksCopyWith(CoinLinks value, $Res Function(CoinLinks) _then) = _$CoinLinksCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'homepage', defaultValue: []) List<String> homepage,@JsonKey(name: 'blockchain_site', defaultValue: []) List<String> blockchainSite
});




}
/// @nodoc
class _$CoinLinksCopyWithImpl<$Res>
    implements $CoinLinksCopyWith<$Res> {
  _$CoinLinksCopyWithImpl(this._self, this._then);

  final CoinLinks _self;
  final $Res Function(CoinLinks) _then;

/// Create a copy of CoinLinks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? homepage = null,Object? blockchainSite = null,}) {
  return _then(_self.copyWith(
homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as List<String>,blockchainSite: null == blockchainSite ? _self.blockchainSite : blockchainSite // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CoinLinks].
extension CoinLinksPatterns on CoinLinks {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinLinks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinLinks() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinLinks value)  $default,){
final _that = this;
switch (_that) {
case _CoinLinks():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinLinks value)?  $default,){
final _that = this;
switch (_that) {
case _CoinLinks() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'homepage', defaultValue: [])  List<String> homepage, @JsonKey(name: 'blockchain_site', defaultValue: [])  List<String> blockchainSite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinLinks() when $default != null:
return $default(_that.homepage,_that.blockchainSite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'homepage', defaultValue: [])  List<String> homepage, @JsonKey(name: 'blockchain_site', defaultValue: [])  List<String> blockchainSite)  $default,) {final _that = this;
switch (_that) {
case _CoinLinks():
return $default(_that.homepage,_that.blockchainSite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'homepage', defaultValue: [])  List<String> homepage, @JsonKey(name: 'blockchain_site', defaultValue: [])  List<String> blockchainSite)?  $default,) {final _that = this;
switch (_that) {
case _CoinLinks() when $default != null:
return $default(_that.homepage,_that.blockchainSite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoinLinks implements CoinLinks {
  const _CoinLinks({@JsonKey(name: 'homepage', defaultValue: []) required final  List<String> homepage, @JsonKey(name: 'blockchain_site', defaultValue: []) required final  List<String> blockchainSite}): _homepage = homepage,_blockchainSite = blockchainSite;
  factory _CoinLinks.fromJson(Map<String, dynamic> json) => _$CoinLinksFromJson(json);

/// A list of homepage URLs. Typically only the first one is used.
 final  List<String> _homepage;
/// A list of homepage URLs. Typically only the first one is used.
@override@JsonKey(name: 'homepage', defaultValue: []) List<String> get homepage {
  if (_homepage is EqualUnmodifiableListView) return _homepage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_homepage);
}

/// A list of blockchain explorer URLs.
 final  List<String> _blockchainSite;
/// A list of blockchain explorer URLs.
@override@JsonKey(name: 'blockchain_site', defaultValue: []) List<String> get blockchainSite {
  if (_blockchainSite is EqualUnmodifiableListView) return _blockchainSite;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blockchainSite);
}


/// Create a copy of CoinLinks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinLinksCopyWith<_CoinLinks> get copyWith => __$CoinLinksCopyWithImpl<_CoinLinks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoinLinksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinLinks&&const DeepCollectionEquality().equals(other._homepage, _homepage)&&const DeepCollectionEquality().equals(other._blockchainSite, _blockchainSite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_homepage),const DeepCollectionEquality().hash(_blockchainSite));

@override
String toString() {
  return 'CoinLinks(homepage: $homepage, blockchainSite: $blockchainSite)';
}


}

/// @nodoc
abstract mixin class _$CoinLinksCopyWith<$Res> implements $CoinLinksCopyWith<$Res> {
  factory _$CoinLinksCopyWith(_CoinLinks value, $Res Function(_CoinLinks) _then) = __$CoinLinksCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'homepage', defaultValue: []) List<String> homepage,@JsonKey(name: 'blockchain_site', defaultValue: []) List<String> blockchainSite
});




}
/// @nodoc
class __$CoinLinksCopyWithImpl<$Res>
    implements _$CoinLinksCopyWith<$Res> {
  __$CoinLinksCopyWithImpl(this._self, this._then);

  final _CoinLinks _self;
  final $Res Function(_CoinLinks) _then;

/// Create a copy of CoinLinks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? homepage = null,Object? blockchainSite = null,}) {
  return _then(_CoinLinks(
homepage: null == homepage ? _self._homepage : homepage // ignore: cast_nullable_to_non_nullable
as List<String>,blockchainSite: null == blockchainSite ? _self._blockchainSite : blockchainSite // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$MarketData {

/// A map of fiat currency codes to the all-time high value.
@JsonKey(name: 'ath') Map<String, double> get allTimeHigh;/// A map of fiat currency codes to the all-time low value.
@JsonKey(name: 'atl') Map<String, double> get allTimeLow;/// A map of fiat currency codes to the total 24-hour trading volume.
@JsonKey(name: 'total_volume') Map<String, double> get totalVolume;
/// Create a copy of MarketData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketDataCopyWith<MarketData> get copyWith => _$MarketDataCopyWithImpl<MarketData>(this as MarketData, _$identity);

  /// Serializes this MarketData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketData&&const DeepCollectionEquality().equals(other.allTimeHigh, allTimeHigh)&&const DeepCollectionEquality().equals(other.allTimeLow, allTimeLow)&&const DeepCollectionEquality().equals(other.totalVolume, totalVolume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(allTimeHigh),const DeepCollectionEquality().hash(allTimeLow),const DeepCollectionEquality().hash(totalVolume));

@override
String toString() {
  return 'MarketData(allTimeHigh: $allTimeHigh, allTimeLow: $allTimeLow, totalVolume: $totalVolume)';
}


}

/// @nodoc
abstract mixin class $MarketDataCopyWith<$Res>  {
  factory $MarketDataCopyWith(MarketData value, $Res Function(MarketData) _then) = _$MarketDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ath') Map<String, double> allTimeHigh,@JsonKey(name: 'atl') Map<String, double> allTimeLow,@JsonKey(name: 'total_volume') Map<String, double> totalVolume
});




}
/// @nodoc
class _$MarketDataCopyWithImpl<$Res>
    implements $MarketDataCopyWith<$Res> {
  _$MarketDataCopyWithImpl(this._self, this._then);

  final MarketData _self;
  final $Res Function(MarketData) _then;

/// Create a copy of MarketData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allTimeHigh = null,Object? allTimeLow = null,Object? totalVolume = null,}) {
  return _then(_self.copyWith(
allTimeHigh: null == allTimeHigh ? _self.allTimeHigh : allTimeHigh // ignore: cast_nullable_to_non_nullable
as Map<String, double>,allTimeLow: null == allTimeLow ? _self.allTimeLow : allTimeLow // ignore: cast_nullable_to_non_nullable
as Map<String, double>,totalVolume: null == totalVolume ? _self.totalVolume : totalVolume // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketData].
extension MarketDataPatterns on MarketData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketData value)  $default,){
final _that = this;
switch (_that) {
case _MarketData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketData value)?  $default,){
final _that = this;
switch (_that) {
case _MarketData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ath')  Map<String, double> allTimeHigh, @JsonKey(name: 'atl')  Map<String, double> allTimeLow, @JsonKey(name: 'total_volume')  Map<String, double> totalVolume)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketData() when $default != null:
return $default(_that.allTimeHigh,_that.allTimeLow,_that.totalVolume);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ath')  Map<String, double> allTimeHigh, @JsonKey(name: 'atl')  Map<String, double> allTimeLow, @JsonKey(name: 'total_volume')  Map<String, double> totalVolume)  $default,) {final _that = this;
switch (_that) {
case _MarketData():
return $default(_that.allTimeHigh,_that.allTimeLow,_that.totalVolume);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ath')  Map<String, double> allTimeHigh, @JsonKey(name: 'atl')  Map<String, double> allTimeLow, @JsonKey(name: 'total_volume')  Map<String, double> totalVolume)?  $default,) {final _that = this;
switch (_that) {
case _MarketData() when $default != null:
return $default(_that.allTimeHigh,_that.allTimeLow,_that.totalVolume);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketData implements MarketData {
  const _MarketData({@JsonKey(name: 'ath') required final  Map<String, double> allTimeHigh, @JsonKey(name: 'atl') required final  Map<String, double> allTimeLow, @JsonKey(name: 'total_volume') required final  Map<String, double> totalVolume}): _allTimeHigh = allTimeHigh,_allTimeLow = allTimeLow,_totalVolume = totalVolume;
  factory _MarketData.fromJson(Map<String, dynamic> json) => _$MarketDataFromJson(json);

/// A map of fiat currency codes to the all-time high value.
 final  Map<String, double> _allTimeHigh;
/// A map of fiat currency codes to the all-time high value.
@override@JsonKey(name: 'ath') Map<String, double> get allTimeHigh {
  if (_allTimeHigh is EqualUnmodifiableMapView) return _allTimeHigh;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_allTimeHigh);
}

/// A map of fiat currency codes to the all-time low value.
 final  Map<String, double> _allTimeLow;
/// A map of fiat currency codes to the all-time low value.
@override@JsonKey(name: 'atl') Map<String, double> get allTimeLow {
  if (_allTimeLow is EqualUnmodifiableMapView) return _allTimeLow;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_allTimeLow);
}

/// A map of fiat currency codes to the total 24-hour trading volume.
 final  Map<String, double> _totalVolume;
/// A map of fiat currency codes to the total 24-hour trading volume.
@override@JsonKey(name: 'total_volume') Map<String, double> get totalVolume {
  if (_totalVolume is EqualUnmodifiableMapView) return _totalVolume;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_totalVolume);
}


/// Create a copy of MarketData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketDataCopyWith<_MarketData> get copyWith => __$MarketDataCopyWithImpl<_MarketData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketData&&const DeepCollectionEquality().equals(other._allTimeHigh, _allTimeHigh)&&const DeepCollectionEquality().equals(other._allTimeLow, _allTimeLow)&&const DeepCollectionEquality().equals(other._totalVolume, _totalVolume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allTimeHigh),const DeepCollectionEquality().hash(_allTimeLow),const DeepCollectionEquality().hash(_totalVolume));

@override
String toString() {
  return 'MarketData(allTimeHigh: $allTimeHigh, allTimeLow: $allTimeLow, totalVolume: $totalVolume)';
}


}

/// @nodoc
abstract mixin class _$MarketDataCopyWith<$Res> implements $MarketDataCopyWith<$Res> {
  factory _$MarketDataCopyWith(_MarketData value, $Res Function(_MarketData) _then) = __$MarketDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ath') Map<String, double> allTimeHigh,@JsonKey(name: 'atl') Map<String, double> allTimeLow,@JsonKey(name: 'total_volume') Map<String, double> totalVolume
});




}
/// @nodoc
class __$MarketDataCopyWithImpl<$Res>
    implements _$MarketDataCopyWith<$Res> {
  __$MarketDataCopyWithImpl(this._self, this._then);

  final _MarketData _self;
  final $Res Function(_MarketData) _then;

/// Create a copy of MarketData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allTimeHigh = null,Object? allTimeLow = null,Object? totalVolume = null,}) {
  return _then(_MarketData(
allTimeHigh: null == allTimeHigh ? _self._allTimeHigh : allTimeHigh // ignore: cast_nullable_to_non_nullable
as Map<String, double>,allTimeLow: null == allTimeLow ? _self._allTimeLow : allTimeLow // ignore: cast_nullable_to_non_nullable
as Map<String, double>,totalVolume: null == totalVolume ? _self._totalVolume : totalVolume // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

// dart format on
