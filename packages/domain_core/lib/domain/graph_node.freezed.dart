// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GraphNode<T extends HasId> {

 T get current; T? get lastRemoteValue; int get revision;
/// Create a copy of GraphNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GraphNodeCopyWith<T, GraphNode<T>> get copyWith => _$GraphNodeCopyWithImpl<T, GraphNode<T>>(this as GraphNode<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphNode<T>&&const DeepCollectionEquality().equals(other.current, current)&&const DeepCollectionEquality().equals(other.lastRemoteValue, lastRemoteValue)&&(identical(other.revision, revision) || other.revision == revision));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(current),const DeepCollectionEquality().hash(lastRemoteValue),revision);

@override
String toString() {
  return 'GraphNode<$T>(current: $current, lastRemoteValue: $lastRemoteValue, revision: $revision)';
}


}

/// @nodoc
abstract mixin class $GraphNodeCopyWith<T extends HasId,$Res>  {
  factory $GraphNodeCopyWith(GraphNode<T> value, $Res Function(GraphNode<T>) _then) = _$GraphNodeCopyWithImpl;
@useResult
$Res call({
 T current, T? lastRemoteValue, int revision
});




}
/// @nodoc
class _$GraphNodeCopyWithImpl<T extends HasId,$Res>
    implements $GraphNodeCopyWith<T, $Res> {
  _$GraphNodeCopyWithImpl(this._self, this._then);

  final GraphNode<T> _self;
  final $Res Function(GraphNode<T>) _then;

/// Create a copy of GraphNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = null,Object? lastRemoteValue = freezed,Object? revision = null,}) {
  return _then(_self.copyWith(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as T,lastRemoteValue: freezed == lastRemoteValue ? _self.lastRemoteValue : lastRemoteValue // ignore: cast_nullable_to_non_nullable
as T?,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GraphNode].
extension GraphNodePatterns<T extends HasId> on GraphNode<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GraphNode<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GraphNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GraphNode<T> value)  $default,){
final _that = this;
switch (_that) {
case _GraphNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GraphNode<T> value)?  $default,){
final _that = this;
switch (_that) {
case _GraphNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T current,  T? lastRemoteValue,  int revision)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GraphNode() when $default != null:
return $default(_that.current,_that.lastRemoteValue,_that.revision);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T current,  T? lastRemoteValue,  int revision)  $default,) {final _that = this;
switch (_that) {
case _GraphNode():
return $default(_that.current,_that.lastRemoteValue,_that.revision);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T current,  T? lastRemoteValue,  int revision)?  $default,) {final _that = this;
switch (_that) {
case _GraphNode() when $default != null:
return $default(_that.current,_that.lastRemoteValue,_that.revision);case _:
  return null;

}
}

}

/// @nodoc


class _GraphNode<T extends HasId> extends GraphNode<T> {
  const _GraphNode({required this.current, this.lastRemoteValue, this.revision = 0}): super._();
  

@override final  T current;
@override final  T? lastRemoteValue;
@override@JsonKey() final  int revision;

/// Create a copy of GraphNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GraphNodeCopyWith<T, _GraphNode<T>> get copyWith => __$GraphNodeCopyWithImpl<T, _GraphNode<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GraphNode<T>&&const DeepCollectionEquality().equals(other.current, current)&&const DeepCollectionEquality().equals(other.lastRemoteValue, lastRemoteValue)&&(identical(other.revision, revision) || other.revision == revision));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(current),const DeepCollectionEquality().hash(lastRemoteValue),revision);

@override
String toString() {
  return 'GraphNode<$T>(current: $current, lastRemoteValue: $lastRemoteValue, revision: $revision)';
}


}

/// @nodoc
abstract mixin class _$GraphNodeCopyWith<T extends HasId,$Res> implements $GraphNodeCopyWith<T, $Res> {
  factory _$GraphNodeCopyWith(_GraphNode<T> value, $Res Function(_GraphNode<T>) _then) = __$GraphNodeCopyWithImpl;
@override @useResult
$Res call({
 T current, T? lastRemoteValue, int revision
});




}
/// @nodoc
class __$GraphNodeCopyWithImpl<T extends HasId,$Res>
    implements _$GraphNodeCopyWith<T, $Res> {
  __$GraphNodeCopyWithImpl(this._self, this._then);

  final _GraphNode<T> _self;
  final $Res Function(_GraphNode<T>) _then;

/// Create a copy of GraphNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = null,Object? lastRemoteValue = freezed,Object? revision = null,}) {
  return _then(_GraphNode<T>(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as T,lastRemoteValue: freezed == lastRemoteValue ? _self.lastRemoteValue : lastRemoteValue // ignore: cast_nullable_to_non_nullable
as T?,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
