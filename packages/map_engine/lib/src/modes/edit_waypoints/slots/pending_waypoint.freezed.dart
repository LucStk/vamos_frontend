// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_waypoint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PendingWaypoint {

 MapHit get hit;
/// Create a copy of PendingWaypoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingWaypointCopyWith<PendingWaypoint> get copyWith => _$PendingWaypointCopyWithImpl<PendingWaypoint>(this as PendingWaypoint, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PendingWaypoint;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingWaypoint&&(identical(other.hit, _this.hit) || other.hit == _this.hit));
}


@override
int get hashCode {
  final _this = this as PendingWaypoint;
  return Object.hash(runtimeType,_this.hit);
}

@override
String toString() {
  final _this = this as PendingWaypoint;
  return 'PendingWaypoint(hit: ${_this.hit})';
}


}

/// @nodoc
abstract mixin class $PendingWaypointCopyWith<$Res>  {
  factory $PendingWaypointCopyWith(PendingWaypoint value, $Res Function(PendingWaypoint) _then) = _$PendingWaypointCopyWithImpl;
@useResult
$Res call({
 MapHit hit
});




}
/// @nodoc
class _$PendingWaypointCopyWithImpl<$Res>
    implements $PendingWaypointCopyWith<$Res> {
  _$PendingWaypointCopyWithImpl(this._self, this._then);

  final PendingWaypoint _self;
  final $Res Function(PendingWaypoint) _then;

/// Create a copy of PendingWaypoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hit = null,}) {
  return _then(PendingWaypoint(
hit: null == hit ? _self.hit : hit // ignore: cast_nullable_to_non_nullable
as MapHit,
  ));
}

}


/// Adds pattern-matching-related methods to [PendingWaypoint].
extension PendingWaypointPatterns on PendingWaypoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PendingWaypoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PendingWaypoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PendingWaypoint value)  $default,){
final _that = this;
switch (_that) {
case _PendingWaypoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PendingWaypoint value)?  $default,){
final _that = this;
switch (_that) {
case _PendingWaypoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MapHit hit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PendingWaypoint() when $default != null:
return $default(_that.hit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MapHit hit)  $default,) {final _that = this;
switch (_that) {
case _PendingWaypoint():
return $default(_that.hit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MapHit hit)?  $default,) {final _that = this;
switch (_that) {
case _PendingWaypoint() when $default != null:
return $default(_that.hit);case _:
  return null;

}
}

}

/// @nodoc


class _PendingWaypoint extends PendingWaypoint {
  const _PendingWaypoint({required this.hit}): super._();
  

@override final  MapHit hit;

/// Create a copy of PendingWaypoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingWaypointCopyWith<_PendingWaypoint> get copyWith => __$PendingWaypointCopyWithImpl<_PendingWaypoint>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingWaypoint&&(identical(other.hit, hit) || other.hit == hit));
}


@override
int get hashCode {
    return Object.hash(runtimeType,hit);
}

@override
String toString() {
    return 'PendingWaypoint(hit: $hit)';
}


}

/// @nodoc
abstract mixin class _$PendingWaypointCopyWith<$Res> implements $PendingWaypointCopyWith<$Res> {
  factory _$PendingWaypointCopyWith(_PendingWaypoint value, $Res Function(_PendingWaypoint) _then) = __$PendingWaypointCopyWithImpl;
@override @useResult
$Res call({
 MapHit hit
});




}
/// @nodoc
class __$PendingWaypointCopyWithImpl<$Res>
    implements _$PendingWaypointCopyWith<$Res> {
  __$PendingWaypointCopyWithImpl(this._self, this._then);

  final _PendingWaypoint _self;
  final $Res Function(_PendingWaypoint) _then;

/// Create a copy of PendingWaypoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hit = null,}) {
  return _then(_PendingWaypoint(
hit: null == hit ? _self.hit : hit // ignore: cast_nullable_to_non_nullable
as MapHit,
  ));
}


}

// dart format on
