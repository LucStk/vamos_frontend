// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapState {

 Trip get currentTrip; bool get isDirty; List<Waypoint> get waypointsSnapshot; List<Segment> get segmentsSnapshot;
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapStateCopyWith<MapState> get copyWith => _$MapStateCopyWithImpl<MapState>(this as MapState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapState&&(identical(other.currentTrip, currentTrip) || other.currentTrip == currentTrip)&&(identical(other.isDirty, isDirty) || other.isDirty == isDirty)&&const DeepCollectionEquality().equals(other.waypointsSnapshot, waypointsSnapshot)&&const DeepCollectionEquality().equals(other.segmentsSnapshot, segmentsSnapshot));
}


@override
int get hashCode => Object.hash(runtimeType,currentTrip,isDirty,const DeepCollectionEquality().hash(waypointsSnapshot),const DeepCollectionEquality().hash(segmentsSnapshot));

@override
String toString() {
  return 'MapState(currentTrip: $currentTrip, isDirty: $isDirty, waypointsSnapshot: $waypointsSnapshot, segmentsSnapshot: $segmentsSnapshot)';
}


}

/// @nodoc
abstract mixin class $MapStateCopyWith<$Res>  {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) _then) = _$MapStateCopyWithImpl;
@useResult
$Res call({
 Trip currentTrip, bool isDirty, List<Waypoint> waypointsSnapshot, List<Segment> segmentsSnapshot
});


$TripCopyWith<$Res> get currentTrip;

}
/// @nodoc
class _$MapStateCopyWithImpl<$Res>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._self, this._then);

  final MapState _self;
  final $Res Function(MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentTrip = null,Object? isDirty = null,Object? waypointsSnapshot = null,Object? segmentsSnapshot = null,}) {
  return _then(_self.copyWith(
currentTrip: null == currentTrip ? _self.currentTrip : currentTrip // ignore: cast_nullable_to_non_nullable
as Trip,isDirty: null == isDirty ? _self.isDirty : isDirty // ignore: cast_nullable_to_non_nullable
as bool,waypointsSnapshot: null == waypointsSnapshot ? _self.waypointsSnapshot : waypointsSnapshot // ignore: cast_nullable_to_non_nullable
as List<Waypoint>,segmentsSnapshot: null == segmentsSnapshot ? _self.segmentsSnapshot : segmentsSnapshot // ignore: cast_nullable_to_non_nullable
as List<Segment>,
  ));
}
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripCopyWith<$Res> get currentTrip {
  
  return $TripCopyWith<$Res>(_self.currentTrip, (value) {
    return _then(_self.copyWith(currentTrip: value));
  });
}
}


/// Adds pattern-matching-related methods to [MapState].
extension MapStatePatterns on MapState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapState value)  $default,){
final _that = this;
switch (_that) {
case _MapState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapState value)?  $default,){
final _that = this;
switch (_that) {
case _MapState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Trip currentTrip,  bool isDirty,  List<Waypoint> waypointsSnapshot,  List<Segment> segmentsSnapshot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.currentTrip,_that.isDirty,_that.waypointsSnapshot,_that.segmentsSnapshot);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Trip currentTrip,  bool isDirty,  List<Waypoint> waypointsSnapshot,  List<Segment> segmentsSnapshot)  $default,) {final _that = this;
switch (_that) {
case _MapState():
return $default(_that.currentTrip,_that.isDirty,_that.waypointsSnapshot,_that.segmentsSnapshot);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Trip currentTrip,  bool isDirty,  List<Waypoint> waypointsSnapshot,  List<Segment> segmentsSnapshot)?  $default,) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.currentTrip,_that.isDirty,_that.waypointsSnapshot,_that.segmentsSnapshot);case _:
  return null;

}
}

}

/// @nodoc


class _MapState extends MapState {
  const _MapState({required this.currentTrip, this.isDirty = false, final  List<Waypoint> waypointsSnapshot = const [], final  List<Segment> segmentsSnapshot = const []}): _waypointsSnapshot = waypointsSnapshot,_segmentsSnapshot = segmentsSnapshot,super._();
  

@override final  Trip currentTrip;
@override@JsonKey() final  bool isDirty;
 final  List<Waypoint> _waypointsSnapshot;
@override@JsonKey() List<Waypoint> get waypointsSnapshot {
  if (_waypointsSnapshot is EqualUnmodifiableListView) return _waypointsSnapshot;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_waypointsSnapshot);
}

 final  List<Segment> _segmentsSnapshot;
@override@JsonKey() List<Segment> get segmentsSnapshot {
  if (_segmentsSnapshot is EqualUnmodifiableListView) return _segmentsSnapshot;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_segmentsSnapshot);
}


/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapStateCopyWith<_MapState> get copyWith => __$MapStateCopyWithImpl<_MapState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapState&&(identical(other.currentTrip, currentTrip) || other.currentTrip == currentTrip)&&(identical(other.isDirty, isDirty) || other.isDirty == isDirty)&&const DeepCollectionEquality().equals(other._waypointsSnapshot, _waypointsSnapshot)&&const DeepCollectionEquality().equals(other._segmentsSnapshot, _segmentsSnapshot));
}


@override
int get hashCode => Object.hash(runtimeType,currentTrip,isDirty,const DeepCollectionEquality().hash(_waypointsSnapshot),const DeepCollectionEquality().hash(_segmentsSnapshot));

@override
String toString() {
  return 'MapState(currentTrip: $currentTrip, isDirty: $isDirty, waypointsSnapshot: $waypointsSnapshot, segmentsSnapshot: $segmentsSnapshot)';
}


}

/// @nodoc
abstract mixin class _$MapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory _$MapStateCopyWith(_MapState value, $Res Function(_MapState) _then) = __$MapStateCopyWithImpl;
@override @useResult
$Res call({
 Trip currentTrip, bool isDirty, List<Waypoint> waypointsSnapshot, List<Segment> segmentsSnapshot
});


@override $TripCopyWith<$Res> get currentTrip;

}
/// @nodoc
class __$MapStateCopyWithImpl<$Res>
    implements _$MapStateCopyWith<$Res> {
  __$MapStateCopyWithImpl(this._self, this._then);

  final _MapState _self;
  final $Res Function(_MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTrip = null,Object? isDirty = null,Object? waypointsSnapshot = null,Object? segmentsSnapshot = null,}) {
  return _then(_MapState(
currentTrip: null == currentTrip ? _self.currentTrip : currentTrip // ignore: cast_nullable_to_non_nullable
as Trip,isDirty: null == isDirty ? _self.isDirty : isDirty // ignore: cast_nullable_to_non_nullable
as bool,waypointsSnapshot: null == waypointsSnapshot ? _self._waypointsSnapshot : waypointsSnapshot // ignore: cast_nullable_to_non_nullable
as List<Waypoint>,segmentsSnapshot: null == segmentsSnapshot ? _self._segmentsSnapshot : segmentsSnapshot // ignore: cast_nullable_to_non_nullable
as List<Segment>,
  ));
}

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripCopyWith<$Res> get currentTrip {
  
  return $TripCopyWith<$Res>(_self.currentTrip, (value) {
    return _then(_self.copyWith(currentTrip: value));
  });
}
}

// dart format on
