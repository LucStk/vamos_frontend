// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'segment_vertex.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SegmentVertex {

 String get id; LatLng get point;
/// Create a copy of SegmentVertex
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentVertexCopyWith<SegmentVertex> get copyWith => _$SegmentVertexCopyWithImpl<SegmentVertex>(this as SegmentVertex, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentVertex&&(identical(other.id, id) || other.id == id)&&(identical(other.point, point) || other.point == point));
}


@override
int get hashCode => Object.hash(runtimeType,id,point);

@override
String toString() {
  return 'SegmentVertex(id: $id, point: $point)';
}


}

/// @nodoc
abstract mixin class $SegmentVertexCopyWith<$Res>  {
  factory $SegmentVertexCopyWith(SegmentVertex value, $Res Function(SegmentVertex) _then) = _$SegmentVertexCopyWithImpl;
@useResult
$Res call({
 String id, LatLng point
});




}
/// @nodoc
class _$SegmentVertexCopyWithImpl<$Res>
    implements $SegmentVertexCopyWith<$Res> {
  _$SegmentVertexCopyWithImpl(this._self, this._then);

  final SegmentVertex _self;
  final $Res Function(SegmentVertex) _then;

/// Create a copy of SegmentVertex
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? point = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}

}


/// Adds pattern-matching-related methods to [SegmentVertex].
extension SegmentVertexPatterns on SegmentVertex {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SegmentVertex value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SegmentVertex() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SegmentVertex value)  $default,){
final _that = this;
switch (_that) {
case _SegmentVertex():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SegmentVertex value)?  $default,){
final _that = this;
switch (_that) {
case _SegmentVertex() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LatLng point)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SegmentVertex() when $default != null:
return $default(_that.id,_that.point);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LatLng point)  $default,) {final _that = this;
switch (_that) {
case _SegmentVertex():
return $default(_that.id,_that.point);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LatLng point)?  $default,) {final _that = this;
switch (_that) {
case _SegmentVertex() when $default != null:
return $default(_that.id,_that.point);case _:
  return null;

}
}

}

/// @nodoc


class _SegmentVertex implements SegmentVertex {
  const _SegmentVertex({required this.id, required this.point});
  

@override final  String id;
@override final  LatLng point;

/// Create a copy of SegmentVertex
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SegmentVertexCopyWith<_SegmentVertex> get copyWith => __$SegmentVertexCopyWithImpl<_SegmentVertex>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SegmentVertex&&(identical(other.id, id) || other.id == id)&&(identical(other.point, point) || other.point == point));
}


@override
int get hashCode => Object.hash(runtimeType,id,point);

@override
String toString() {
  return 'SegmentVertex(id: $id, point: $point)';
}


}

/// @nodoc
abstract mixin class _$SegmentVertexCopyWith<$Res> implements $SegmentVertexCopyWith<$Res> {
  factory _$SegmentVertexCopyWith(_SegmentVertex value, $Res Function(_SegmentVertex) _then) = __$SegmentVertexCopyWithImpl;
@override @useResult
$Res call({
 String id, LatLng point
});




}
/// @nodoc
class __$SegmentVertexCopyWithImpl<$Res>
    implements _$SegmentVertexCopyWith<$Res> {
  __$SegmentVertexCopyWithImpl(this._self, this._then);

  final _SegmentVertex _self;
  final $Res Function(_SegmentVertex) _then;

/// Create a copy of SegmentVertex
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? point = null,}) {
  return _then(_SegmentVertex(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

// dart format on
