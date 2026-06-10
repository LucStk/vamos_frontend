// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waypoint_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateWaypointResult {

 Waypoint get waypoint; Vertex get vertex;
/// Create a copy of CreateWaypointResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateWaypointResultCopyWith<CreateWaypointResult> get copyWith => _$CreateWaypointResultCopyWithImpl<CreateWaypointResult>(this as CreateWaypointResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWaypointResult&&(identical(other.waypoint, waypoint) || other.waypoint == waypoint)&&(identical(other.vertex, vertex) || other.vertex == vertex));
}


@override
int get hashCode => Object.hash(runtimeType,waypoint,vertex);

@override
String toString() {
  return 'CreateWaypointResult(waypoint: $waypoint, vertex: $vertex)';
}


}

/// @nodoc
abstract mixin class $CreateWaypointResultCopyWith<$Res>  {
  factory $CreateWaypointResultCopyWith(CreateWaypointResult value, $Res Function(CreateWaypointResult) _then) = _$CreateWaypointResultCopyWithImpl;
@useResult
$Res call({
 Waypoint waypoint, Vertex vertex
});


$WaypointCopyWith<$Res> get waypoint;$VertexCopyWith<$Res> get vertex;

}
/// @nodoc
class _$CreateWaypointResultCopyWithImpl<$Res>
    implements $CreateWaypointResultCopyWith<$Res> {
  _$CreateWaypointResultCopyWithImpl(this._self, this._then);

  final CreateWaypointResult _self;
  final $Res Function(CreateWaypointResult) _then;

/// Create a copy of CreateWaypointResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? waypoint = null,Object? vertex = null,}) {
  return _then(_self.copyWith(
waypoint: null == waypoint ? _self.waypoint : waypoint // ignore: cast_nullable_to_non_nullable
as Waypoint,vertex: null == vertex ? _self.vertex : vertex // ignore: cast_nullable_to_non_nullable
as Vertex,
  ));
}
/// Create a copy of CreateWaypointResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WaypointCopyWith<$Res> get waypoint {
  
  return $WaypointCopyWith<$Res>(_self.waypoint, (value) {
    return _then(_self.copyWith(waypoint: value));
  });
}/// Create a copy of CreateWaypointResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VertexCopyWith<$Res> get vertex {
  
  return $VertexCopyWith<$Res>(_self.vertex, (value) {
    return _then(_self.copyWith(vertex: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateWaypointResult].
extension CreateWaypointResultPatterns on CreateWaypointResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateWaypointResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateWaypointResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateWaypointResult value)  $default,){
final _that = this;
switch (_that) {
case _CreateWaypointResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateWaypointResult value)?  $default,){
final _that = this;
switch (_that) {
case _CreateWaypointResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Waypoint waypoint,  Vertex vertex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateWaypointResult() when $default != null:
return $default(_that.waypoint,_that.vertex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Waypoint waypoint,  Vertex vertex)  $default,) {final _that = this;
switch (_that) {
case _CreateWaypointResult():
return $default(_that.waypoint,_that.vertex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Waypoint waypoint,  Vertex vertex)?  $default,) {final _that = this;
switch (_that) {
case _CreateWaypointResult() when $default != null:
return $default(_that.waypoint,_that.vertex);case _:
  return null;

}
}

}

/// @nodoc


class _CreateWaypointResult implements CreateWaypointResult {
  const _CreateWaypointResult({required this.waypoint, required this.vertex});
  

@override final  Waypoint waypoint;
@override final  Vertex vertex;

/// Create a copy of CreateWaypointResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateWaypointResultCopyWith<_CreateWaypointResult> get copyWith => __$CreateWaypointResultCopyWithImpl<_CreateWaypointResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateWaypointResult&&(identical(other.waypoint, waypoint) || other.waypoint == waypoint)&&(identical(other.vertex, vertex) || other.vertex == vertex));
}


@override
int get hashCode => Object.hash(runtimeType,waypoint,vertex);

@override
String toString() {
  return 'CreateWaypointResult(waypoint: $waypoint, vertex: $vertex)';
}


}

/// @nodoc
abstract mixin class _$CreateWaypointResultCopyWith<$Res> implements $CreateWaypointResultCopyWith<$Res> {
  factory _$CreateWaypointResultCopyWith(_CreateWaypointResult value, $Res Function(_CreateWaypointResult) _then) = __$CreateWaypointResultCopyWithImpl;
@override @useResult
$Res call({
 Waypoint waypoint, Vertex vertex
});


@override $WaypointCopyWith<$Res> get waypoint;@override $VertexCopyWith<$Res> get vertex;

}
/// @nodoc
class __$CreateWaypointResultCopyWithImpl<$Res>
    implements _$CreateWaypointResultCopyWith<$Res> {
  __$CreateWaypointResultCopyWithImpl(this._self, this._then);

  final _CreateWaypointResult _self;
  final $Res Function(_CreateWaypointResult) _then;

/// Create a copy of CreateWaypointResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? waypoint = null,Object? vertex = null,}) {
  return _then(_CreateWaypointResult(
waypoint: null == waypoint ? _self.waypoint : waypoint // ignore: cast_nullable_to_non_nullable
as Waypoint,vertex: null == vertex ? _self.vertex : vertex // ignore: cast_nullable_to_non_nullable
as Vertex,
  ));
}

/// Create a copy of CreateWaypointResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WaypointCopyWith<$Res> get waypoint {
  
  return $WaypointCopyWith<$Res>(_self.waypoint, (value) {
    return _then(_self.copyWith(waypoint: value));
  });
}/// Create a copy of CreateWaypointResult
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
