// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripStore {

 SimpleCollectionStore<Trip> get tripStore; OwnerIndex<UserId, TripId> get ownerIndex;
/// Create a copy of TripStore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripStoreCopyWith<TripStore> get copyWith => _$TripStoreCopyWithImpl<TripStore>(this as TripStore, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TripStore;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripStore&&(identical(other.tripStore, _this.tripStore) || other.tripStore == _this.tripStore)&&(identical(other.ownerIndex, _this.ownerIndex) || other.ownerIndex == _this.ownerIndex));
}


@override
int get hashCode {
  final _this = this as TripStore;
  return Object.hash(runtimeType,_this.tripStore,_this.ownerIndex);
}

@override
String toString() {
  final _this = this as TripStore;
  return 'TripStore(tripStore: ${_this.tripStore}, ownerIndex: ${_this.ownerIndex})';
}


}

/// @nodoc
abstract mixin class $TripStoreCopyWith<$Res>  {
  factory $TripStoreCopyWith(TripStore value, $Res Function(TripStore) _then) = _$TripStoreCopyWithImpl;
@useResult
$Res call({
 SimpleCollectionStore<Trip> tripStore, OwnerIndex<UserId, TripId> ownerIndex
});


$CollectionStoreCopyWith<Trip, Trip, $Res> get tripStore;

}
/// @nodoc
class _$TripStoreCopyWithImpl<$Res>
    implements $TripStoreCopyWith<$Res> {
  _$TripStoreCopyWithImpl(this._self, this._then);

  final TripStore _self;
  final $Res Function(TripStore) _then;

/// Create a copy of TripStore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripStore = null,Object? ownerIndex = null,}) {
  return _then(TripStore(
tripStore: null == tripStore ? _self.tripStore : tripStore // ignore: cast_nullable_to_non_nullable
as SimpleCollectionStore<Trip>,ownerIndex: null == ownerIndex ? _self.ownerIndex : ownerIndex // ignore: cast_nullable_to_non_nullable
as OwnerIndex<UserId, TripId>,
  ));
}
/// Create a copy of TripStore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollectionStoreCopyWith<Trip, Trip, $Res> get tripStore {
  
  return $CollectionStoreCopyWith<Trip, Trip, $Res>(_self.tripStore, (value) {
    return _then(_self.copyWith(tripStore: value));
  });
}
}


/// Adds pattern-matching-related methods to [TripStore].
extension TripStorePatterns on TripStore {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripStore value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripStore() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripStore value)  $default,){
final _that = this;
switch (_that) {
case _TripStore():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripStore value)?  $default,){
final _that = this;
switch (_that) {
case _TripStore() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SimpleCollectionStore<Trip> tripStore,  OwnerIndex<UserId, TripId> ownerIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripStore() when $default != null:
return $default(_that.tripStore,_that.ownerIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SimpleCollectionStore<Trip> tripStore,  OwnerIndex<UserId, TripId> ownerIndex)  $default,) {final _that = this;
switch (_that) {
case _TripStore():
return $default(_that.tripStore,_that.ownerIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SimpleCollectionStore<Trip> tripStore,  OwnerIndex<UserId, TripId> ownerIndex)?  $default,) {final _that = this;
switch (_that) {
case _TripStore() when $default != null:
return $default(_that.tripStore,_that.ownerIndex);case _:
  return null;

}
}

}

/// @nodoc


class _TripStore extends TripStore {
  const _TripStore({required this.tripStore, required this.ownerIndex}): super._();
  

@override final  SimpleCollectionStore<Trip> tripStore;
@override final  OwnerIndex<UserId, TripId> ownerIndex;

/// Create a copy of TripStore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripStoreCopyWith<_TripStore> get copyWith => __$TripStoreCopyWithImpl<_TripStore>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripStore&&(identical(other.tripStore, tripStore) || other.tripStore == tripStore)&&(identical(other.ownerIndex, ownerIndex) || other.ownerIndex == ownerIndex));
}


@override
int get hashCode {
    return Object.hash(runtimeType,tripStore,ownerIndex);
}

@override
String toString() {
    return 'TripStore(tripStore: $tripStore, ownerIndex: $ownerIndex)';
}


}

/// @nodoc
abstract mixin class _$TripStoreCopyWith<$Res> implements $TripStoreCopyWith<$Res> {
  factory _$TripStoreCopyWith(_TripStore value, $Res Function(_TripStore) _then) = __$TripStoreCopyWithImpl;
@override @useResult
$Res call({
 SimpleCollectionStore<Trip> tripStore, OwnerIndex<UserId, TripId> ownerIndex
});


@override $CollectionStoreCopyWith<Trip, Trip, $Res> get tripStore;

}
/// @nodoc
class __$TripStoreCopyWithImpl<$Res>
    implements _$TripStoreCopyWith<$Res> {
  __$TripStoreCopyWithImpl(this._self, this._then);

  final _TripStore _self;
  final $Res Function(_TripStore) _then;

/// Create a copy of TripStore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripStore = null,Object? ownerIndex = null,}) {
  return _then(_TripStore(
tripStore: null == tripStore ? _self.tripStore : tripStore // ignore: cast_nullable_to_non_nullable
as SimpleCollectionStore<Trip>,ownerIndex: null == ownerIndex ? _self.ownerIndex : ownerIndex // ignore: cast_nullable_to_non_nullable
as OwnerIndex<UserId, TripId>,
  ));
}

/// Create a copy of TripStore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollectionStoreCopyWith<Trip, Trip, $Res> get tripStore {
  
  return $CollectionStoreCopyWith<Trip, Trip, $Res>(_self.tripStore, (value) {
    return _then(_self.copyWith(tripStore: value));
  });
}
}

// dart format on
