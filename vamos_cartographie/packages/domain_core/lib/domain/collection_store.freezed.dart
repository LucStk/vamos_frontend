// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CollectionStore<T,V extends HasId> {

 Map<Id<T>, V> get store;
/// Create a copy of CollectionStore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectionStoreCopyWith<T, V, CollectionStore<T, V>> get copyWith => _$CollectionStoreCopyWithImpl<T, V, CollectionStore<T, V>>(this as CollectionStore<T, V>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectionStore<T, V>&&const DeepCollectionEquality().equals(other.store, store));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(store));

@override
String toString() {
  return 'CollectionStore<$T, $V>(store: $store)';
}


}

/// @nodoc
abstract mixin class $CollectionStoreCopyWith<T,V extends HasId,$Res>  {
  factory $CollectionStoreCopyWith(CollectionStore<T, V> value, $Res Function(CollectionStore<T, V>) _then) = _$CollectionStoreCopyWithImpl;
@useResult
$Res call({
 Map<Id<T>, V> store
});




}
/// @nodoc
class _$CollectionStoreCopyWithImpl<T,V extends HasId,$Res>
    implements $CollectionStoreCopyWith<T, V, $Res> {
  _$CollectionStoreCopyWithImpl(this._self, this._then);

  final CollectionStore<T, V> _self;
  final $Res Function(CollectionStore<T, V>) _then;

/// Create a copy of CollectionStore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? store = null,}) {
  return _then(_self.copyWith(
store: null == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as Map<Id<T>, V>,
  ));
}

}


/// Adds pattern-matching-related methods to [CollectionStore].
extension CollectionStorePatterns<T,V extends HasId> on CollectionStore<T, V> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CollectionStore<T, V> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CollectionStore() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CollectionStore<T, V> value)  $default,){
final _that = this;
switch (_that) {
case _CollectionStore():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CollectionStore<T, V> value)?  $default,){
final _that = this;
switch (_that) {
case _CollectionStore() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<Id<T>, V> store)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CollectionStore() when $default != null:
return $default(_that.store);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<Id<T>, V> store)  $default,) {final _that = this;
switch (_that) {
case _CollectionStore():
return $default(_that.store);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<Id<T>, V> store)?  $default,) {final _that = this;
switch (_that) {
case _CollectionStore() when $default != null:
return $default(_that.store);case _:
  return null;

}
}

}

/// @nodoc


class _CollectionStore<T,V extends HasId> extends CollectionStore<T, V> {
  const _CollectionStore({final  Map<Id<T>, V> store = const {}}): _store = store,super._();
  

 final  Map<Id<T>, V> _store;
@override@JsonKey() Map<Id<T>, V> get store {
  if (_store is EqualUnmodifiableMapView) return _store;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_store);
}


/// Create a copy of CollectionStore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollectionStoreCopyWith<T, V, _CollectionStore<T, V>> get copyWith => __$CollectionStoreCopyWithImpl<T, V, _CollectionStore<T, V>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollectionStore<T, V>&&const DeepCollectionEquality().equals(other._store, _store));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_store));

@override
String toString() {
  return 'CollectionStore<$T, $V>(store: $store)';
}


}

/// @nodoc
abstract mixin class _$CollectionStoreCopyWith<T,V extends HasId,$Res> implements $CollectionStoreCopyWith<T, V, $Res> {
  factory _$CollectionStoreCopyWith(_CollectionStore<T, V> value, $Res Function(_CollectionStore<T, V>) _then) = __$CollectionStoreCopyWithImpl;
@override @useResult
$Res call({
 Map<Id<T>, V> store
});




}
/// @nodoc
class __$CollectionStoreCopyWithImpl<T,V extends HasId,$Res>
    implements _$CollectionStoreCopyWith<T, V, $Res> {
  __$CollectionStoreCopyWithImpl(this._self, this._then);

  final _CollectionStore<T, V> _self;
  final $Res Function(_CollectionStore<T, V>) _then;

/// Create a copy of CollectionStore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? store = null,}) {
  return _then(_CollectionStore<T, V>(
store: null == store ? _self._store : store // ignore: cast_nullable_to_non_nullable
as Map<Id<T>, V>,
  ));
}


}

// dart format on
