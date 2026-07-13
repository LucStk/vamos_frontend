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

 MapMode get mode; MapSelection get selection; MapOverlayState get overlay;
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapStateCopyWith<MapState> get copyWith => _$MapStateCopyWithImpl<MapState>(this as MapState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.selection, selection) || other.selection == selection)&&(identical(other.overlay, overlay) || other.overlay == overlay));
}


@override
int get hashCode => Object.hash(runtimeType,mode,selection,overlay);

@override
String toString() {
  return 'MapState(mode: $mode, selection: $selection, overlay: $overlay)';
}


}

/// @nodoc
abstract mixin class $MapStateCopyWith<$Res>  {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) _then) = _$MapStateCopyWithImpl;
@useResult
$Res call({
 MapMode mode, MapSelection selection, MapOverlayState overlay
});


$MapModeCopyWith<$Res> get mode;$MapSelectionCopyWith<$Res> get selection;$MapOverlayStateCopyWith<$Res> get overlay;

}
/// @nodoc
class _$MapStateCopyWithImpl<$Res>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._self, this._then);

  final MapState _self;
  final $Res Function(MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? selection = null,Object? overlay = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MapMode,selection: null == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as MapSelection,overlay: null == overlay ? _self.overlay : overlay // ignore: cast_nullable_to_non_nullable
as MapOverlayState,
  ));
}
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapModeCopyWith<$Res> get mode {
  
  return $MapModeCopyWith<$Res>(_self.mode, (value) {
    return _then(_self.copyWith(mode: value));
  });
}/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapSelectionCopyWith<$Res> get selection {
  
  return $MapSelectionCopyWith<$Res>(_self.selection, (value) {
    return _then(_self.copyWith(selection: value));
  });
}/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapOverlayStateCopyWith<$Res> get overlay {
  
  return $MapOverlayStateCopyWith<$Res>(_self.overlay, (value) {
    return _then(_self.copyWith(overlay: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MapMode mode,  MapSelection selection,  MapOverlayState overlay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.mode,_that.selection,_that.overlay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MapMode mode,  MapSelection selection,  MapOverlayState overlay)  $default,) {final _that = this;
switch (_that) {
case _MapState():
return $default(_that.mode,_that.selection,_that.overlay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MapMode mode,  MapSelection selection,  MapOverlayState overlay)?  $default,) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.mode,_that.selection,_that.overlay);case _:
  return null;

}
}

}

/// @nodoc


class _MapState implements MapState {
  const _MapState({this.mode = const Idle(), this.selection = const MapSelection.none(), this.overlay = const MapOverlayState.hidden()});
  

@override@JsonKey() final  MapMode mode;
@override@JsonKey() final  MapSelection selection;
@override@JsonKey() final  MapOverlayState overlay;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapStateCopyWith<_MapState> get copyWith => __$MapStateCopyWithImpl<_MapState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.selection, selection) || other.selection == selection)&&(identical(other.overlay, overlay) || other.overlay == overlay));
}


@override
int get hashCode => Object.hash(runtimeType,mode,selection,overlay);

@override
String toString() {
  return 'MapState(mode: $mode, selection: $selection, overlay: $overlay)';
}


}

/// @nodoc
abstract mixin class _$MapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory _$MapStateCopyWith(_MapState value, $Res Function(_MapState) _then) = __$MapStateCopyWithImpl;
@override @useResult
$Res call({
 MapMode mode, MapSelection selection, MapOverlayState overlay
});


@override $MapModeCopyWith<$Res> get mode;@override $MapSelectionCopyWith<$Res> get selection;@override $MapOverlayStateCopyWith<$Res> get overlay;

}
/// @nodoc
class __$MapStateCopyWithImpl<$Res>
    implements _$MapStateCopyWith<$Res> {
  __$MapStateCopyWithImpl(this._self, this._then);

  final _MapState _self;
  final $Res Function(_MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? selection = null,Object? overlay = null,}) {
  return _then(_MapState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MapMode,selection: null == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as MapSelection,overlay: null == overlay ? _self.overlay : overlay // ignore: cast_nullable_to_non_nullable
as MapOverlayState,
  ));
}

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapModeCopyWith<$Res> get mode {
  
  return $MapModeCopyWith<$Res>(_self.mode, (value) {
    return _then(_self.copyWith(mode: value));
  });
}/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapSelectionCopyWith<$Res> get selection {
  
  return $MapSelectionCopyWith<$Res>(_self.selection, (value) {
    return _then(_self.copyWith(selection: value));
  });
}/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapOverlayStateCopyWith<$Res> get overlay {
  
  return $MapOverlayStateCopyWith<$Res>(_self.overlay, (value) {
    return _then(_self.copyWith(overlay: value));
  });
}
}

/// @nodoc
mixin _$MapMode {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapMode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapMode()';
}


}

/// @nodoc
class $MapModeCopyWith<$Res>  {
$MapModeCopyWith(MapMode _, $Res Function(MapMode) __);
}


/// Adds pattern-matching-related methods to [MapMode].
extension MapModePatterns on MapMode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Idle value)?  idle,TResult Function( SketchMode value)?  sketchMode,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case SketchMode() when sketchMode != null:
return sketchMode(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Idle value)  idle,required TResult Function( SketchMode value)  sketchMode,}){
final _that = this;
switch (_that) {
case Idle():
return idle(_that);case SketchMode():
return sketchMode(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Idle value)?  idle,TResult? Function( SketchMode value)?  sketchMode,}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case SketchMode() when sketchMode != null:
return sketchMode(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( VertexRef vertexStart,  List<LatLng> itineraire,  VertexRef? touchedVertex)?  sketchMode,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case SketchMode() when sketchMode != null:
return sketchMode(_that.vertexStart,_that.itineraire,_that.touchedVertex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( VertexRef vertexStart,  List<LatLng> itineraire,  VertexRef? touchedVertex)  sketchMode,}) {final _that = this;
switch (_that) {
case Idle():
return idle();case SketchMode():
return sketchMode(_that.vertexStart,_that.itineraire,_that.touchedVertex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( VertexRef vertexStart,  List<LatLng> itineraire,  VertexRef? touchedVertex)?  sketchMode,}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case SketchMode() when sketchMode != null:
return sketchMode(_that.vertexStart,_that.itineraire,_that.touchedVertex);case _:
  return null;

}
}

}

/// @nodoc


class Idle implements MapMode {
  const Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapMode.idle()';
}


}




/// @nodoc


class SketchMode implements MapMode {
  const SketchMode({required this.vertexStart, required final  List<LatLng> itineraire, this.touchedVertex}): _itineraire = itineraire;
  

 final  VertexRef vertexStart;
 final  List<LatLng> _itineraire;
 List<LatLng> get itineraire {
  if (_itineraire is EqualUnmodifiableListView) return _itineraire;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itineraire);
}

 final  VertexRef? touchedVertex;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SketchModeCopyWith<SketchMode> get copyWith => _$SketchModeCopyWithImpl<SketchMode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SketchMode&&(identical(other.vertexStart, vertexStart) || other.vertexStart == vertexStart)&&const DeepCollectionEquality().equals(other._itineraire, _itineraire)&&(identical(other.touchedVertex, touchedVertex) || other.touchedVertex == touchedVertex));
}


@override
int get hashCode => Object.hash(runtimeType,vertexStart,const DeepCollectionEquality().hash(_itineraire),touchedVertex);

@override
String toString() {
  return 'MapMode.sketchMode(vertexStart: $vertexStart, itineraire: $itineraire, touchedVertex: $touchedVertex)';
}


}

/// @nodoc
abstract mixin class $SketchModeCopyWith<$Res> implements $MapModeCopyWith<$Res> {
  factory $SketchModeCopyWith(SketchMode value, $Res Function(SketchMode) _then) = _$SketchModeCopyWithImpl;
@useResult
$Res call({
 VertexRef vertexStart, List<LatLng> itineraire, VertexRef? touchedVertex
});


$VertexRefCopyWith<$Res> get vertexStart;$VertexRefCopyWith<$Res>? get touchedVertex;

}
/// @nodoc
class _$SketchModeCopyWithImpl<$Res>
    implements $SketchModeCopyWith<$Res> {
  _$SketchModeCopyWithImpl(this._self, this._then);

  final SketchMode _self;
  final $Res Function(SketchMode) _then;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vertexStart = null,Object? itineraire = null,Object? touchedVertex = freezed,}) {
  return _then(SketchMode(
vertexStart: null == vertexStart ? _self.vertexStart : vertexStart // ignore: cast_nullable_to_non_nullable
as VertexRef,itineraire: null == itineraire ? _self._itineraire : itineraire // ignore: cast_nullable_to_non_nullable
as List<LatLng>,touchedVertex: freezed == touchedVertex ? _self.touchedVertex : touchedVertex // ignore: cast_nullable_to_non_nullable
as VertexRef?,
  ));
}

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VertexRefCopyWith<$Res> get vertexStart {
  
  return $VertexRefCopyWith<$Res>(_self.vertexStart, (value) {
    return _then(_self.copyWith(vertexStart: value));
  });
}/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VertexRefCopyWith<$Res>? get touchedVertex {
    if (_self.touchedVertex == null) {
    return null;
  }

  return $VertexRefCopyWith<$Res>(_self.touchedVertex!, (value) {
    return _then(_self.copyWith(touchedVertex: value));
  });
}
}

/// @nodoc
mixin _$MapSelection {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapSelection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapSelection()';
}


}

/// @nodoc
class $MapSelectionCopyWith<$Res>  {
$MapSelectionCopyWith(MapSelection _, $Res Function(MapSelection) __);
}


/// Adds pattern-matching-related methods to [MapSelection].
extension MapSelectionPatterns on MapSelection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NoSelection value)?  none,TResult Function( VertexSelection value)?  vertex,TResult Function( SegmentSelection value)?  segment,TResult Function( CursorSelection value)?  cursor,TResult Function( WaypointSelection value)?  waypoint,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NoSelection() when none != null:
return none(_that);case VertexSelection() when vertex != null:
return vertex(_that);case SegmentSelection() when segment != null:
return segment(_that);case CursorSelection() when cursor != null:
return cursor(_that);case WaypointSelection() when waypoint != null:
return waypoint(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NoSelection value)  none,required TResult Function( VertexSelection value)  vertex,required TResult Function( SegmentSelection value)  segment,required TResult Function( CursorSelection value)  cursor,required TResult Function( WaypointSelection value)  waypoint,}){
final _that = this;
switch (_that) {
case NoSelection():
return none(_that);case VertexSelection():
return vertex(_that);case SegmentSelection():
return segment(_that);case CursorSelection():
return cursor(_that);case WaypointSelection():
return waypoint(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NoSelection value)?  none,TResult? Function( VertexSelection value)?  vertex,TResult? Function( SegmentSelection value)?  segment,TResult? Function( CursorSelection value)?  cursor,TResult? Function( WaypointSelection value)?  waypoint,}){
final _that = this;
switch (_that) {
case NoSelection() when none != null:
return none(_that);case VertexSelection() when vertex != null:
return vertex(_that);case SegmentSelection() when segment != null:
return segment(_that);case CursorSelection() when cursor != null:
return cursor(_that);case WaypointSelection() when waypoint != null:
return waypoint(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function( VertexRef vertexRef)?  vertex,TResult Function( SegmentRef segmentRef)?  segment,TResult Function( LatLng latLng)?  cursor,TResult Function( Id<Waypoint> waypointId,  VertexRef vertexRef)?  waypoint,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NoSelection() when none != null:
return none();case VertexSelection() when vertex != null:
return vertex(_that.vertexRef);case SegmentSelection() when segment != null:
return segment(_that.segmentRef);case CursorSelection() when cursor != null:
return cursor(_that.latLng);case WaypointSelection() when waypoint != null:
return waypoint(_that.waypointId,_that.vertexRef);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function( VertexRef vertexRef)  vertex,required TResult Function( SegmentRef segmentRef)  segment,required TResult Function( LatLng latLng)  cursor,required TResult Function( Id<Waypoint> waypointId,  VertexRef vertexRef)  waypoint,}) {final _that = this;
switch (_that) {
case NoSelection():
return none();case VertexSelection():
return vertex(_that.vertexRef);case SegmentSelection():
return segment(_that.segmentRef);case CursorSelection():
return cursor(_that.latLng);case WaypointSelection():
return waypoint(_that.waypointId,_that.vertexRef);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function( VertexRef vertexRef)?  vertex,TResult? Function( SegmentRef segmentRef)?  segment,TResult? Function( LatLng latLng)?  cursor,TResult? Function( Id<Waypoint> waypointId,  VertexRef vertexRef)?  waypoint,}) {final _that = this;
switch (_that) {
case NoSelection() when none != null:
return none();case VertexSelection() when vertex != null:
return vertex(_that.vertexRef);case SegmentSelection() when segment != null:
return segment(_that.segmentRef);case CursorSelection() when cursor != null:
return cursor(_that.latLng);case WaypointSelection() when waypoint != null:
return waypoint(_that.waypointId,_that.vertexRef);case _:
  return null;

}
}

}

/// @nodoc


class NoSelection implements MapSelection {
  const NoSelection();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoSelection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapSelection.none()';
}


}




/// @nodoc


class VertexSelection implements MapSelection {
  const VertexSelection({required this.vertexRef});
  

 final  VertexRef vertexRef;

/// Create a copy of MapSelection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VertexSelectionCopyWith<VertexSelection> get copyWith => _$VertexSelectionCopyWithImpl<VertexSelection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VertexSelection&&(identical(other.vertexRef, vertexRef) || other.vertexRef == vertexRef));
}


@override
int get hashCode => Object.hash(runtimeType,vertexRef);

@override
String toString() {
  return 'MapSelection.vertex(vertexRef: $vertexRef)';
}


}

/// @nodoc
abstract mixin class $VertexSelectionCopyWith<$Res> implements $MapSelectionCopyWith<$Res> {
  factory $VertexSelectionCopyWith(VertexSelection value, $Res Function(VertexSelection) _then) = _$VertexSelectionCopyWithImpl;
@useResult
$Res call({
 VertexRef vertexRef
});


$VertexRefCopyWith<$Res> get vertexRef;

}
/// @nodoc
class _$VertexSelectionCopyWithImpl<$Res>
    implements $VertexSelectionCopyWith<$Res> {
  _$VertexSelectionCopyWithImpl(this._self, this._then);

  final VertexSelection _self;
  final $Res Function(VertexSelection) _then;

/// Create a copy of MapSelection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vertexRef = null,}) {
  return _then(VertexSelection(
vertexRef: null == vertexRef ? _self.vertexRef : vertexRef // ignore: cast_nullable_to_non_nullable
as VertexRef,
  ));
}

/// Create a copy of MapSelection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VertexRefCopyWith<$Res> get vertexRef {
  
  return $VertexRefCopyWith<$Res>(_self.vertexRef, (value) {
    return _then(_self.copyWith(vertexRef: value));
  });
}
}

/// @nodoc


class SegmentSelection implements MapSelection {
  const SegmentSelection({required this.segmentRef});
  

 final  SegmentRef segmentRef;

/// Create a copy of MapSelection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentSelectionCopyWith<SegmentSelection> get copyWith => _$SegmentSelectionCopyWithImpl<SegmentSelection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentSelection&&(identical(other.segmentRef, segmentRef) || other.segmentRef == segmentRef));
}


@override
int get hashCode => Object.hash(runtimeType,segmentRef);

@override
String toString() {
  return 'MapSelection.segment(segmentRef: $segmentRef)';
}


}

/// @nodoc
abstract mixin class $SegmentSelectionCopyWith<$Res> implements $MapSelectionCopyWith<$Res> {
  factory $SegmentSelectionCopyWith(SegmentSelection value, $Res Function(SegmentSelection) _then) = _$SegmentSelectionCopyWithImpl;
@useResult
$Res call({
 SegmentRef segmentRef
});


$SegmentRefCopyWith<$Res> get segmentRef;

}
/// @nodoc
class _$SegmentSelectionCopyWithImpl<$Res>
    implements $SegmentSelectionCopyWith<$Res> {
  _$SegmentSelectionCopyWithImpl(this._self, this._then);

  final SegmentSelection _self;
  final $Res Function(SegmentSelection) _then;

/// Create a copy of MapSelection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? segmentRef = null,}) {
  return _then(SegmentSelection(
segmentRef: null == segmentRef ? _self.segmentRef : segmentRef // ignore: cast_nullable_to_non_nullable
as SegmentRef,
  ));
}

/// Create a copy of MapSelection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SegmentRefCopyWith<$Res> get segmentRef {
  
  return $SegmentRefCopyWith<$Res>(_self.segmentRef, (value) {
    return _then(_self.copyWith(segmentRef: value));
  });
}
}

/// @nodoc


class CursorSelection implements MapSelection {
  const CursorSelection({required this.latLng});
  

 final  LatLng latLng;

/// Create a copy of MapSelection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CursorSelectionCopyWith<CursorSelection> get copyWith => _$CursorSelectionCopyWithImpl<CursorSelection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CursorSelection&&(identical(other.latLng, latLng) || other.latLng == latLng));
}


@override
int get hashCode => Object.hash(runtimeType,latLng);

@override
String toString() {
  return 'MapSelection.cursor(latLng: $latLng)';
}


}

/// @nodoc
abstract mixin class $CursorSelectionCopyWith<$Res> implements $MapSelectionCopyWith<$Res> {
  factory $CursorSelectionCopyWith(CursorSelection value, $Res Function(CursorSelection) _then) = _$CursorSelectionCopyWithImpl;
@useResult
$Res call({
 LatLng latLng
});




}
/// @nodoc
class _$CursorSelectionCopyWithImpl<$Res>
    implements $CursorSelectionCopyWith<$Res> {
  _$CursorSelectionCopyWithImpl(this._self, this._then);

  final CursorSelection _self;
  final $Res Function(CursorSelection) _then;

/// Create a copy of MapSelection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? latLng = null,}) {
  return _then(CursorSelection(
latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

/// @nodoc


class WaypointSelection implements MapSelection {
  const WaypointSelection({required this.waypointId, required this.vertexRef});
  

 final  Id<Waypoint> waypointId;
 final  VertexRef vertexRef;

/// Create a copy of MapSelection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaypointSelectionCopyWith<WaypointSelection> get copyWith => _$WaypointSelectionCopyWithImpl<WaypointSelection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaypointSelection&&(identical(other.waypointId, waypointId) || other.waypointId == waypointId)&&(identical(other.vertexRef, vertexRef) || other.vertexRef == vertexRef));
}


@override
int get hashCode => Object.hash(runtimeType,waypointId,vertexRef);

@override
String toString() {
  return 'MapSelection.waypoint(waypointId: $waypointId, vertexRef: $vertexRef)';
}


}

/// @nodoc
abstract mixin class $WaypointSelectionCopyWith<$Res> implements $MapSelectionCopyWith<$Res> {
  factory $WaypointSelectionCopyWith(WaypointSelection value, $Res Function(WaypointSelection) _then) = _$WaypointSelectionCopyWithImpl;
@useResult
$Res call({
 Id<Waypoint> waypointId, VertexRef vertexRef
});


$VertexRefCopyWith<$Res> get vertexRef;

}
/// @nodoc
class _$WaypointSelectionCopyWithImpl<$Res>
    implements $WaypointSelectionCopyWith<$Res> {
  _$WaypointSelectionCopyWithImpl(this._self, this._then);

  final WaypointSelection _self;
  final $Res Function(WaypointSelection) _then;

/// Create a copy of MapSelection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? waypointId = null,Object? vertexRef = null,}) {
  return _then(WaypointSelection(
waypointId: null == waypointId ? _self.waypointId : waypointId // ignore: cast_nullable_to_non_nullable
as Id<Waypoint>,vertexRef: null == vertexRef ? _self.vertexRef : vertexRef // ignore: cast_nullable_to_non_nullable
as VertexRef,
  ));
}

/// Create a copy of MapSelection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VertexRefCopyWith<$Res> get vertexRef {
  
  return $VertexRefCopyWith<$Res>(_self.vertexRef, (value) {
    return _then(_self.copyWith(vertexRef: value));
  });
}
}

/// @nodoc
mixin _$PopUpState {

 LatLng get latLng;
/// Create a copy of PopUpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PopUpStateCopyWith<PopUpState> get copyWith => _$PopUpStateCopyWithImpl<PopUpState>(this as PopUpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopUpState&&(identical(other.latLng, latLng) || other.latLng == latLng));
}


@override
int get hashCode => Object.hash(runtimeType,latLng);

@override
String toString() {
  return 'PopUpState(latLng: $latLng)';
}


}

/// @nodoc
abstract mixin class $PopUpStateCopyWith<$Res>  {
  factory $PopUpStateCopyWith(PopUpState value, $Res Function(PopUpState) _then) = _$PopUpStateCopyWithImpl;
@useResult
$Res call({
 LatLng latLng
});




}
/// @nodoc
class _$PopUpStateCopyWithImpl<$Res>
    implements $PopUpStateCopyWith<$Res> {
  _$PopUpStateCopyWithImpl(this._self, this._then);

  final PopUpState _self;
  final $Res Function(PopUpState) _then;

/// Create a copy of PopUpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latLng = null,}) {
  return _then(_self.copyWith(
latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}

}


/// Adds pattern-matching-related methods to [PopUpState].
extension PopUpStatePatterns on PopUpState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PopUpState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PopUpState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PopUpState value)  $default,){
final _that = this;
switch (_that) {
case _PopUpState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PopUpState value)?  $default,){
final _that = this;
switch (_that) {
case _PopUpState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LatLng latLng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PopUpState() when $default != null:
return $default(_that.latLng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LatLng latLng)  $default,) {final _that = this;
switch (_that) {
case _PopUpState():
return $default(_that.latLng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LatLng latLng)?  $default,) {final _that = this;
switch (_that) {
case _PopUpState() when $default != null:
return $default(_that.latLng);case _:
  return null;

}
}

}

/// @nodoc


class _PopUpState implements PopUpState {
  const _PopUpState({required this.latLng});
  

@override final  LatLng latLng;

/// Create a copy of PopUpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PopUpStateCopyWith<_PopUpState> get copyWith => __$PopUpStateCopyWithImpl<_PopUpState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PopUpState&&(identical(other.latLng, latLng) || other.latLng == latLng));
}


@override
int get hashCode => Object.hash(runtimeType,latLng);

@override
String toString() {
  return 'PopUpState(latLng: $latLng)';
}


}

/// @nodoc
abstract mixin class _$PopUpStateCopyWith<$Res> implements $PopUpStateCopyWith<$Res> {
  factory _$PopUpStateCopyWith(_PopUpState value, $Res Function(_PopUpState) _then) = __$PopUpStateCopyWithImpl;
@override @useResult
$Res call({
 LatLng latLng
});




}
/// @nodoc
class __$PopUpStateCopyWithImpl<$Res>
    implements _$PopUpStateCopyWith<$Res> {
  __$PopUpStateCopyWithImpl(this._self, this._then);

  final _PopUpState _self;
  final $Res Function(_PopUpState) _then;

/// Create a copy of PopUpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latLng = null,}) {
  return _then(_PopUpState(
latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

/// @nodoc
mixin _$MapOverlayState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapOverlayState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapOverlayState()';
}


}

/// @nodoc
class $MapOverlayStateCopyWith<$Res>  {
$MapOverlayStateCopyWith(MapOverlayState _, $Res Function(MapOverlayState) __);
}


/// Adds pattern-matching-related methods to [MapOverlayState].
extension MapOverlayStatePatterns on MapOverlayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OverlayHidden value)?  hidden,TResult Function( OverlayPopup value)?  popup,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OverlayHidden() when hidden != null:
return hidden(_that);case OverlayPopup() when popup != null:
return popup(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OverlayHidden value)  hidden,required TResult Function( OverlayPopup value)  popup,}){
final _that = this;
switch (_that) {
case OverlayHidden():
return hidden(_that);case OverlayPopup():
return popup(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OverlayHidden value)?  hidden,TResult? Function( OverlayPopup value)?  popup,}){
final _that = this;
switch (_that) {
case OverlayHidden() when hidden != null:
return hidden(_that);case OverlayPopup() when popup != null:
return popup(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  hidden,TResult Function( PopUpState popUpState)?  popup,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OverlayHidden() when hidden != null:
return hidden();case OverlayPopup() when popup != null:
return popup(_that.popUpState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  hidden,required TResult Function( PopUpState popUpState)  popup,}) {final _that = this;
switch (_that) {
case OverlayHidden():
return hidden();case OverlayPopup():
return popup(_that.popUpState);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  hidden,TResult? Function( PopUpState popUpState)?  popup,}) {final _that = this;
switch (_that) {
case OverlayHidden() when hidden != null:
return hidden();case OverlayPopup() when popup != null:
return popup(_that.popUpState);case _:
  return null;

}
}

}

/// @nodoc


class OverlayHidden implements MapOverlayState {
  const OverlayHidden();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverlayHidden);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapOverlayState.hidden()';
}


}




/// @nodoc


class OverlayPopup implements MapOverlayState {
  const OverlayPopup({required this.popUpState});
  

 final  PopUpState popUpState;

/// Create a copy of MapOverlayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverlayPopupCopyWith<OverlayPopup> get copyWith => _$OverlayPopupCopyWithImpl<OverlayPopup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverlayPopup&&(identical(other.popUpState, popUpState) || other.popUpState == popUpState));
}


@override
int get hashCode => Object.hash(runtimeType,popUpState);

@override
String toString() {
  return 'MapOverlayState.popup(popUpState: $popUpState)';
}


}

/// @nodoc
abstract mixin class $OverlayPopupCopyWith<$Res> implements $MapOverlayStateCopyWith<$Res> {
  factory $OverlayPopupCopyWith(OverlayPopup value, $Res Function(OverlayPopup) _then) = _$OverlayPopupCopyWithImpl;
@useResult
$Res call({
 PopUpState popUpState
});


$PopUpStateCopyWith<$Res> get popUpState;

}
/// @nodoc
class _$OverlayPopupCopyWithImpl<$Res>
    implements $OverlayPopupCopyWith<$Res> {
  _$OverlayPopupCopyWithImpl(this._self, this._then);

  final OverlayPopup _self;
  final $Res Function(OverlayPopup) _then;

/// Create a copy of MapOverlayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? popUpState = null,}) {
  return _then(OverlayPopup(
popUpState: null == popUpState ? _self.popUpState : popUpState // ignore: cast_nullable_to_non_nullable
as PopUpState,
  ));
}

/// Create a copy of MapOverlayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PopUpStateCopyWith<$Res> get popUpState {
  
  return $PopUpStateCopyWith<$Res>(_self.popUpState, (value) {
    return _then(_self.copyWith(popUpState: value));
  });
}
}

// dart format on
