// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stored_file_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoredFileStore {

 GraphCollectionStore<StoredFileFields> get storedFileStore; OwnerIndex<Id<dynamic>, StoredFileId> get ownerIndex;
/// Create a copy of StoredFileStore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoredFileStoreCopyWith<StoredFileStore> get copyWith => _$StoredFileStoreCopyWithImpl<StoredFileStore>(this as StoredFileStore, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StoredFileStore;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoredFileStore&&(identical(other.storedFileStore, _this.storedFileStore) || other.storedFileStore == _this.storedFileStore)&&(identical(other.ownerIndex, _this.ownerIndex) || other.ownerIndex == _this.ownerIndex));
}


@override
int get hashCode {
  final _this = this as StoredFileStore;
  return Object.hash(runtimeType,_this.storedFileStore,_this.ownerIndex);
}

@override
String toString() {
  final _this = this as StoredFileStore;
  return 'StoredFileStore(storedFileStore: ${_this.storedFileStore}, ownerIndex: ${_this.ownerIndex})';
}


}

/// @nodoc
abstract mixin class $StoredFileStoreCopyWith<$Res>  {
  factory $StoredFileStoreCopyWith(StoredFileStore value, $Res Function(StoredFileStore) _then) = _$StoredFileStoreCopyWithImpl;
@useResult
$Res call({
 GraphCollectionStore<StoredFileFields> storedFileStore, OwnerIndex<Id<dynamic>, StoredFileId> ownerIndex
});


$CollectionStoreCopyWith<StoredFileFields, GraphNode<StoredFileFields>, $Res> get storedFileStore;

}
/// @nodoc
class _$StoredFileStoreCopyWithImpl<$Res>
    implements $StoredFileStoreCopyWith<$Res> {
  _$StoredFileStoreCopyWithImpl(this._self, this._then);

  final StoredFileStore _self;
  final $Res Function(StoredFileStore) _then;

/// Create a copy of StoredFileStore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? storedFileStore = null,Object? ownerIndex = null,}) {
  return _then(StoredFileStore(
storedFileStore: null == storedFileStore ? _self.storedFileStore : storedFileStore // ignore: cast_nullable_to_non_nullable
as GraphCollectionStore<StoredFileFields>,ownerIndex: null == ownerIndex ? _self.ownerIndex : ownerIndex // ignore: cast_nullable_to_non_nullable
as OwnerIndex<Id<dynamic>, StoredFileId>,
  ));
}
/// Create a copy of StoredFileStore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollectionStoreCopyWith<StoredFileFields, GraphNode<StoredFileFields>, $Res> get storedFileStore {
  
  return $CollectionStoreCopyWith<StoredFileFields, GraphNode<StoredFileFields>, $Res>(_self.storedFileStore, (value) {
    return _then(_self.copyWith(storedFileStore: value));
  });
}
}


/// Adds pattern-matching-related methods to [StoredFileStore].
extension StoredFileStorePatterns on StoredFileStore {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoredFileStore value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoredFileStore() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoredFileStore value)  $default,){
final _that = this;
switch (_that) {
case _StoredFileStore():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoredFileStore value)?  $default,){
final _that = this;
switch (_that) {
case _StoredFileStore() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GraphCollectionStore<StoredFileFields> storedFileStore,  OwnerIndex<Id<dynamic>, StoredFileId> ownerIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoredFileStore() when $default != null:
return $default(_that.storedFileStore,_that.ownerIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GraphCollectionStore<StoredFileFields> storedFileStore,  OwnerIndex<Id<dynamic>, StoredFileId> ownerIndex)  $default,) {final _that = this;
switch (_that) {
case _StoredFileStore():
return $default(_that.storedFileStore,_that.ownerIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GraphCollectionStore<StoredFileFields> storedFileStore,  OwnerIndex<Id<dynamic>, StoredFileId> ownerIndex)?  $default,) {final _that = this;
switch (_that) {
case _StoredFileStore() when $default != null:
return $default(_that.storedFileStore,_that.ownerIndex);case _:
  return null;

}
}

}

/// @nodoc


class _StoredFileStore extends StoredFileStore {
  const _StoredFileStore({required this.storedFileStore, required this.ownerIndex}): super._();
  

@override final  GraphCollectionStore<StoredFileFields> storedFileStore;
@override final  OwnerIndex<Id<dynamic>, StoredFileId> ownerIndex;

/// Create a copy of StoredFileStore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoredFileStoreCopyWith<_StoredFileStore> get copyWith => __$StoredFileStoreCopyWithImpl<_StoredFileStore>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoredFileStore&&(identical(other.storedFileStore, storedFileStore) || other.storedFileStore == storedFileStore)&&(identical(other.ownerIndex, ownerIndex) || other.ownerIndex == ownerIndex));
}


@override
int get hashCode {
    return Object.hash(runtimeType,storedFileStore,ownerIndex);
}

@override
String toString() {
    return 'StoredFileStore(storedFileStore: $storedFileStore, ownerIndex: $ownerIndex)';
}


}

/// @nodoc
abstract mixin class _$StoredFileStoreCopyWith<$Res> implements $StoredFileStoreCopyWith<$Res> {
  factory _$StoredFileStoreCopyWith(_StoredFileStore value, $Res Function(_StoredFileStore) _then) = __$StoredFileStoreCopyWithImpl;
@override @useResult
$Res call({
 GraphCollectionStore<StoredFileFields> storedFileStore, OwnerIndex<Id<dynamic>, StoredFileId> ownerIndex
});


@override $CollectionStoreCopyWith<StoredFileFields, GraphNode<StoredFileFields>, $Res> get storedFileStore;

}
/// @nodoc
class __$StoredFileStoreCopyWithImpl<$Res>
    implements _$StoredFileStoreCopyWith<$Res> {
  __$StoredFileStoreCopyWithImpl(this._self, this._then);

  final _StoredFileStore _self;
  final $Res Function(_StoredFileStore) _then;

/// Create a copy of StoredFileStore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? storedFileStore = null,Object? ownerIndex = null,}) {
  return _then(_StoredFileStore(
storedFileStore: null == storedFileStore ? _self.storedFileStore : storedFileStore // ignore: cast_nullable_to_non_nullable
as GraphCollectionStore<StoredFileFields>,ownerIndex: null == ownerIndex ? _self.ownerIndex : ownerIndex // ignore: cast_nullable_to_non_nullable
as OwnerIndex<Id<dynamic>, StoredFileId>,
  ));
}

/// Create a copy of StoredFileStore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollectionStoreCopyWith<StoredFileFields, GraphNode<StoredFileFields>, $Res> get storedFileStore {
  
  return $CollectionStoreCopyWith<StoredFileFields, GraphNode<StoredFileFields>, $Res>(_self.storedFileStore, (value) {
    return _then(_self.copyWith(storedFileStore: value));
  });
}
}

// dart format on
