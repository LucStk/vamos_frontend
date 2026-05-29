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

 int get tripId; List<Waypoint> get waypoints; List<Segment> get segments; List<Waypoint> get savedWaypoints; List<Segment> get savedSegments; MapInteraction get interaction; MapEvent? get event;
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapStateCopyWith<MapState> get copyWith => _$MapStateCopyWithImpl<MapState>(this as MapState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&const DeepCollectionEquality().equals(other.waypoints, waypoints)&&const DeepCollectionEquality().equals(other.segments, segments)&&const DeepCollectionEquality().equals(other.savedWaypoints, savedWaypoints)&&const DeepCollectionEquality().equals(other.savedSegments, savedSegments)&&(identical(other.interaction, interaction) || other.interaction == interaction)&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,const DeepCollectionEquality().hash(waypoints),const DeepCollectionEquality().hash(segments),const DeepCollectionEquality().hash(savedWaypoints),const DeepCollectionEquality().hash(savedSegments),interaction,event);

@override
String toString() {
  return 'MapState(tripId: $tripId, waypoints: $waypoints, segments: $segments, savedWaypoints: $savedWaypoints, savedSegments: $savedSegments, interaction: $interaction, event: $event)';
}


}

/// @nodoc
abstract mixin class $MapStateCopyWith<$Res>  {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) _then) = _$MapStateCopyWithImpl;
@useResult
$Res call({
 int tripId, List<Waypoint> waypoints, List<Segment> segments, List<Waypoint> savedWaypoints, List<Segment> savedSegments, MapInteraction interaction, MapEvent? event
});


$MapInteractionCopyWith<$Res> get interaction;$MapEventCopyWith<$Res>? get event;

}
/// @nodoc
class _$MapStateCopyWithImpl<$Res>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._self, this._then);

  final MapState _self;
  final $Res Function(MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = null,Object? waypoints = null,Object? segments = null,Object? savedWaypoints = null,Object? savedSegments = null,Object? interaction = null,Object? event = freezed,}) {
  return _then(_self.copyWith(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,waypoints: null == waypoints ? _self.waypoints : waypoints // ignore: cast_nullable_to_non_nullable
as List<Waypoint>,segments: null == segments ? _self.segments : segments // ignore: cast_nullable_to_non_nullable
as List<Segment>,savedWaypoints: null == savedWaypoints ? _self.savedWaypoints : savedWaypoints // ignore: cast_nullable_to_non_nullable
as List<Waypoint>,savedSegments: null == savedSegments ? _self.savedSegments : savedSegments // ignore: cast_nullable_to_non_nullable
as List<Segment>,interaction: null == interaction ? _self.interaction : interaction // ignore: cast_nullable_to_non_nullable
as MapInteraction,event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as MapEvent?,
  ));
}
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapInteractionCopyWith<$Res> get interaction {
  
  return $MapInteractionCopyWith<$Res>(_self.interaction, (value) {
    return _then(_self.copyWith(interaction: value));
  });
}/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapEventCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $MapEventCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tripId,  List<Waypoint> waypoints,  List<Segment> segments,  List<Waypoint> savedWaypoints,  List<Segment> savedSegments,  MapInteraction interaction,  MapEvent? event)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.tripId,_that.waypoints,_that.segments,_that.savedWaypoints,_that.savedSegments,_that.interaction,_that.event);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tripId,  List<Waypoint> waypoints,  List<Segment> segments,  List<Waypoint> savedWaypoints,  List<Segment> savedSegments,  MapInteraction interaction,  MapEvent? event)  $default,) {final _that = this;
switch (_that) {
case _MapState():
return $default(_that.tripId,_that.waypoints,_that.segments,_that.savedWaypoints,_that.savedSegments,_that.interaction,_that.event);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tripId,  List<Waypoint> waypoints,  List<Segment> segments,  List<Waypoint> savedWaypoints,  List<Segment> savedSegments,  MapInteraction interaction,  MapEvent? event)?  $default,) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.tripId,_that.waypoints,_that.segments,_that.savedWaypoints,_that.savedSegments,_that.interaction,_that.event);case _:
  return null;

}
}

}

/// @nodoc


class _MapState extends MapState {
  const _MapState({required this.tripId, final  List<Waypoint> waypoints = const [], final  List<Segment> segments = const [], final  List<Waypoint> savedWaypoints = const [], final  List<Segment> savedSegments = const [], this.interaction = const MapInteraction.none(), this.event}): _waypoints = waypoints,_segments = segments,_savedWaypoints = savedWaypoints,_savedSegments = savedSegments,super._();
  

@override final  int tripId;
 final  List<Waypoint> _waypoints;
@override@JsonKey() List<Waypoint> get waypoints {
  if (_waypoints is EqualUnmodifiableListView) return _waypoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_waypoints);
}

 final  List<Segment> _segments;
@override@JsonKey() List<Segment> get segments {
  if (_segments is EqualUnmodifiableListView) return _segments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_segments);
}

 final  List<Waypoint> _savedWaypoints;
@override@JsonKey() List<Waypoint> get savedWaypoints {
  if (_savedWaypoints is EqualUnmodifiableListView) return _savedWaypoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_savedWaypoints);
}

 final  List<Segment> _savedSegments;
@override@JsonKey() List<Segment> get savedSegments {
  if (_savedSegments is EqualUnmodifiableListView) return _savedSegments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_savedSegments);
}

@override@JsonKey() final  MapInteraction interaction;
@override final  MapEvent? event;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapStateCopyWith<_MapState> get copyWith => __$MapStateCopyWithImpl<_MapState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&const DeepCollectionEquality().equals(other._waypoints, _waypoints)&&const DeepCollectionEquality().equals(other._segments, _segments)&&const DeepCollectionEquality().equals(other._savedWaypoints, _savedWaypoints)&&const DeepCollectionEquality().equals(other._savedSegments, _savedSegments)&&(identical(other.interaction, interaction) || other.interaction == interaction)&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,const DeepCollectionEquality().hash(_waypoints),const DeepCollectionEquality().hash(_segments),const DeepCollectionEquality().hash(_savedWaypoints),const DeepCollectionEquality().hash(_savedSegments),interaction,event);

@override
String toString() {
  return 'MapState(tripId: $tripId, waypoints: $waypoints, segments: $segments, savedWaypoints: $savedWaypoints, savedSegments: $savedSegments, interaction: $interaction, event: $event)';
}


}

/// @nodoc
abstract mixin class _$MapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory _$MapStateCopyWith(_MapState value, $Res Function(_MapState) _then) = __$MapStateCopyWithImpl;
@override @useResult
$Res call({
 int tripId, List<Waypoint> waypoints, List<Segment> segments, List<Waypoint> savedWaypoints, List<Segment> savedSegments, MapInteraction interaction, MapEvent? event
});


@override $MapInteractionCopyWith<$Res> get interaction;@override $MapEventCopyWith<$Res>? get event;

}
/// @nodoc
class __$MapStateCopyWithImpl<$Res>
    implements _$MapStateCopyWith<$Res> {
  __$MapStateCopyWithImpl(this._self, this._then);

  final _MapState _self;
  final $Res Function(_MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? waypoints = null,Object? segments = null,Object? savedWaypoints = null,Object? savedSegments = null,Object? interaction = null,Object? event = freezed,}) {
  return _then(_MapState(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,waypoints: null == waypoints ? _self._waypoints : waypoints // ignore: cast_nullable_to_non_nullable
as List<Waypoint>,segments: null == segments ? _self._segments : segments // ignore: cast_nullable_to_non_nullable
as List<Segment>,savedWaypoints: null == savedWaypoints ? _self._savedWaypoints : savedWaypoints // ignore: cast_nullable_to_non_nullable
as List<Waypoint>,savedSegments: null == savedSegments ? _self._savedSegments : savedSegments // ignore: cast_nullable_to_non_nullable
as List<Segment>,interaction: null == interaction ? _self.interaction : interaction // ignore: cast_nullable_to_non_nullable
as MapInteraction,event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as MapEvent?,
  ));
}

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapInteractionCopyWith<$Res> get interaction {
  
  return $MapInteractionCopyWith<$Res>(_self.interaction, (value) {
    return _then(_self.copyWith(interaction: value));
  });
}/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapEventCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $MapEventCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

// dart format on
