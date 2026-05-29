// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_interaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapInteraction {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapInteraction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapInteraction()';
}


}

/// @nodoc
class $MapInteractionCopyWith<$Res>  {
$MapInteractionCopyWith(MapInteraction _, $Res Function(MapInteraction) __);
}


/// Adds pattern-matching-related methods to [MapInteraction].
extension MapInteractionPatterns on MapInteraction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NoMapInteraction value)?  none,TResult Function( CreatingWaypointInteraction value)?  creatingWaypoint,TResult Function( CreatingSegmentInteraction value)?  creatingSegment,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NoMapInteraction() when none != null:
return none(_that);case CreatingWaypointInteraction() when creatingWaypoint != null:
return creatingWaypoint(_that);case CreatingSegmentInteraction() when creatingSegment != null:
return creatingSegment(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NoMapInteraction value)  none,required TResult Function( CreatingWaypointInteraction value)  creatingWaypoint,required TResult Function( CreatingSegmentInteraction value)  creatingSegment,}){
final _that = this;
switch (_that) {
case NoMapInteraction():
return none(_that);case CreatingWaypointInteraction():
return creatingWaypoint(_that);case CreatingSegmentInteraction():
return creatingSegment(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NoMapInteraction value)?  none,TResult? Function( CreatingWaypointInteraction value)?  creatingWaypoint,TResult? Function( CreatingSegmentInteraction value)?  creatingSegment,}){
final _that = this;
switch (_that) {
case NoMapInteraction() when none != null:
return none(_that);case CreatingWaypointInteraction() when creatingWaypoint != null:
return creatingWaypoint(_that);case CreatingSegmentInteraction() when creatingSegment != null:
return creatingSegment(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function( LatLng position,  bool isDragging)?  creatingWaypoint,TResult Function( LatLng start,  LatLng? current)?  creatingSegment,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NoMapInteraction() when none != null:
return none();case CreatingWaypointInteraction() when creatingWaypoint != null:
return creatingWaypoint(_that.position,_that.isDragging);case CreatingSegmentInteraction() when creatingSegment != null:
return creatingSegment(_that.start,_that.current);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function( LatLng position,  bool isDragging)  creatingWaypoint,required TResult Function( LatLng start,  LatLng? current)  creatingSegment,}) {final _that = this;
switch (_that) {
case NoMapInteraction():
return none();case CreatingWaypointInteraction():
return creatingWaypoint(_that.position,_that.isDragging);case CreatingSegmentInteraction():
return creatingSegment(_that.start,_that.current);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function( LatLng position,  bool isDragging)?  creatingWaypoint,TResult? Function( LatLng start,  LatLng? current)?  creatingSegment,}) {final _that = this;
switch (_that) {
case NoMapInteraction() when none != null:
return none();case CreatingWaypointInteraction() when creatingWaypoint != null:
return creatingWaypoint(_that.position,_that.isDragging);case CreatingSegmentInteraction() when creatingSegment != null:
return creatingSegment(_that.start,_that.current);case _:
  return null;

}
}

}

/// @nodoc


class NoMapInteraction implements MapInteraction {
  const NoMapInteraction();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoMapInteraction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapInteraction.none()';
}


}




/// @nodoc


class CreatingWaypointInteraction implements MapInteraction {
  const CreatingWaypointInteraction({required this.position, this.isDragging = false});
  

 final  LatLng position;
@JsonKey() final  bool isDragging;

/// Create a copy of MapInteraction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatingWaypointInteractionCopyWith<CreatingWaypointInteraction> get copyWith => _$CreatingWaypointInteractionCopyWithImpl<CreatingWaypointInteraction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatingWaypointInteraction&&(identical(other.position, position) || other.position == position)&&(identical(other.isDragging, isDragging) || other.isDragging == isDragging));
}


@override
int get hashCode => Object.hash(runtimeType,position,isDragging);

@override
String toString() {
  return 'MapInteraction.creatingWaypoint(position: $position, isDragging: $isDragging)';
}


}

/// @nodoc
abstract mixin class $CreatingWaypointInteractionCopyWith<$Res> implements $MapInteractionCopyWith<$Res> {
  factory $CreatingWaypointInteractionCopyWith(CreatingWaypointInteraction value, $Res Function(CreatingWaypointInteraction) _then) = _$CreatingWaypointInteractionCopyWithImpl;
@useResult
$Res call({
 LatLng position, bool isDragging
});




}
/// @nodoc
class _$CreatingWaypointInteractionCopyWithImpl<$Res>
    implements $CreatingWaypointInteractionCopyWith<$Res> {
  _$CreatingWaypointInteractionCopyWithImpl(this._self, this._then);

  final CreatingWaypointInteraction _self;
  final $Res Function(CreatingWaypointInteraction) _then;

/// Create a copy of MapInteraction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? position = null,Object? isDragging = null,}) {
  return _then(CreatingWaypointInteraction(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,isDragging: null == isDragging ? _self.isDragging : isDragging // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class CreatingSegmentInteraction implements MapInteraction {
  const CreatingSegmentInteraction({required this.start, this.current});
  

 final  LatLng start;
 final  LatLng? current;

/// Create a copy of MapInteraction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatingSegmentInteractionCopyWith<CreatingSegmentInteraction> get copyWith => _$CreatingSegmentInteractionCopyWithImpl<CreatingSegmentInteraction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatingSegmentInteraction&&(identical(other.start, start) || other.start == start)&&(identical(other.current, current) || other.current == current));
}


@override
int get hashCode => Object.hash(runtimeType,start,current);

@override
String toString() {
  return 'MapInteraction.creatingSegment(start: $start, current: $current)';
}


}

/// @nodoc
abstract mixin class $CreatingSegmentInteractionCopyWith<$Res> implements $MapInteractionCopyWith<$Res> {
  factory $CreatingSegmentInteractionCopyWith(CreatingSegmentInteraction value, $Res Function(CreatingSegmentInteraction) _then) = _$CreatingSegmentInteractionCopyWithImpl;
@useResult
$Res call({
 LatLng start, LatLng? current
});




}
/// @nodoc
class _$CreatingSegmentInteractionCopyWithImpl<$Res>
    implements $CreatingSegmentInteractionCopyWith<$Res> {
  _$CreatingSegmentInteractionCopyWithImpl(this._self, this._then);

  final CreatingSegmentInteraction _self;
  final $Res Function(CreatingSegmentInteraction) _then;

/// Create a copy of MapInteraction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? start = null,Object? current = freezed,}) {
  return _then(CreatingSegmentInteraction(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as LatLng,current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as LatLng?,
  ));
}


}

// dart format on
