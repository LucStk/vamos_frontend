// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'display_vertex.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DisplayVertex {

 Vertex get vertex; LatLng get currentLatLng;// La position actuellement affichée sur la carte
 bool get isDragging;
/// Create a copy of DisplayVertex
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisplayVertexCopyWith<DisplayVertex> get copyWith => _$DisplayVertexCopyWithImpl<DisplayVertex>(this as DisplayVertex, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisplayVertex&&(identical(other.vertex, vertex) || other.vertex == vertex)&&(identical(other.currentLatLng, currentLatLng) || other.currentLatLng == currentLatLng)&&(identical(other.isDragging, isDragging) || other.isDragging == isDragging));
}


@override
int get hashCode => Object.hash(runtimeType,vertex,currentLatLng,isDragging);

@override
String toString() {
  return 'DisplayVertex(vertex: $vertex, currentLatLng: $currentLatLng, isDragging: $isDragging)';
}


}

/// @nodoc
abstract mixin class $DisplayVertexCopyWith<$Res>  {
  factory $DisplayVertexCopyWith(DisplayVertex value, $Res Function(DisplayVertex) _then) = _$DisplayVertexCopyWithImpl;
@useResult
$Res call({
 Vertex vertex, LatLng currentLatLng, bool isDragging
});


$VertexCopyWith<$Res> get vertex;

}
/// @nodoc
class _$DisplayVertexCopyWithImpl<$Res>
    implements $DisplayVertexCopyWith<$Res> {
  _$DisplayVertexCopyWithImpl(this._self, this._then);

  final DisplayVertex _self;
  final $Res Function(DisplayVertex) _then;

/// Create a copy of DisplayVertex
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vertex = null,Object? currentLatLng = null,Object? isDragging = null,}) {
  return _then(_self.copyWith(
vertex: null == vertex ? _self.vertex : vertex // ignore: cast_nullable_to_non_nullable
as Vertex,currentLatLng: null == currentLatLng ? _self.currentLatLng : currentLatLng // ignore: cast_nullable_to_non_nullable
as LatLng,isDragging: null == isDragging ? _self.isDragging : isDragging // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of DisplayVertex
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VertexCopyWith<$Res> get vertex {
  
  return $VertexCopyWith<$Res>(_self.vertex, (value) {
    return _then(_self.copyWith(vertex: value));
  });
}
}


/// Adds pattern-matching-related methods to [DisplayVertex].
extension DisplayVertexPatterns on DisplayVertex {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DisplayVertex value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DisplayVertex() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DisplayVertex value)  $default,){
final _that = this;
switch (_that) {
case _DisplayVertex():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DisplayVertex value)?  $default,){
final _that = this;
switch (_that) {
case _DisplayVertex() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Vertex vertex,  LatLng currentLatLng,  bool isDragging)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DisplayVertex() when $default != null:
return $default(_that.vertex,_that.currentLatLng,_that.isDragging);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Vertex vertex,  LatLng currentLatLng,  bool isDragging)  $default,) {final _that = this;
switch (_that) {
case _DisplayVertex():
return $default(_that.vertex,_that.currentLatLng,_that.isDragging);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Vertex vertex,  LatLng currentLatLng,  bool isDragging)?  $default,) {final _that = this;
switch (_that) {
case _DisplayVertex() when $default != null:
return $default(_that.vertex,_that.currentLatLng,_that.isDragging);case _:
  return null;

}
}

}

/// @nodoc


class _DisplayVertex implements DisplayVertex {
  const _DisplayVertex({required this.vertex, required this.currentLatLng, this.isDragging = false});
  

@override final  Vertex vertex;
@override final  LatLng currentLatLng;
// La position actuellement affichée sur la carte
@override@JsonKey() final  bool isDragging;

/// Create a copy of DisplayVertex
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DisplayVertexCopyWith<_DisplayVertex> get copyWith => __$DisplayVertexCopyWithImpl<_DisplayVertex>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DisplayVertex&&(identical(other.vertex, vertex) || other.vertex == vertex)&&(identical(other.currentLatLng, currentLatLng) || other.currentLatLng == currentLatLng)&&(identical(other.isDragging, isDragging) || other.isDragging == isDragging));
}


@override
int get hashCode => Object.hash(runtimeType,vertex,currentLatLng,isDragging);

@override
String toString() {
  return 'DisplayVertex(vertex: $vertex, currentLatLng: $currentLatLng, isDragging: $isDragging)';
}


}

/// @nodoc
abstract mixin class _$DisplayVertexCopyWith<$Res> implements $DisplayVertexCopyWith<$Res> {
  factory _$DisplayVertexCopyWith(_DisplayVertex value, $Res Function(_DisplayVertex) _then) = __$DisplayVertexCopyWithImpl;
@override @useResult
$Res call({
 Vertex vertex, LatLng currentLatLng, bool isDragging
});


@override $VertexCopyWith<$Res> get vertex;

}
/// @nodoc
class __$DisplayVertexCopyWithImpl<$Res>
    implements _$DisplayVertexCopyWith<$Res> {
  __$DisplayVertexCopyWithImpl(this._self, this._then);

  final _DisplayVertex _self;
  final $Res Function(_DisplayVertex) _then;

/// Create a copy of DisplayVertex
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vertex = null,Object? currentLatLng = null,Object? isDragging = null,}) {
  return _then(_DisplayVertex(
vertex: null == vertex ? _self.vertex : vertex // ignore: cast_nullable_to_non_nullable
as Vertex,currentLatLng: null == currentLatLng ? _self.currentLatLng : currentLatLng // ignore: cast_nullable_to_non_nullable
as LatLng,isDragging: null == isDragging ? _self.isDragging : isDragging // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of DisplayVertex
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VertexCopyWith<$Res> get vertex {
  
  return $VertexCopyWith<$Res>(_self.vertex, (value) {
    return _then(_self.copyWith(vertex: value));
  });
}
}

// dart format on
