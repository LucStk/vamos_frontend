// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_mode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Idle value)?  idle,TResult Function( CursorDrawn value)?  cursorDrawn,TResult Function( VertexSelected value)?  vertexSelected,TResult Function( DraggingVertex value)?  draggingVertex,TResult Function( SegmentSelected value)?  segmentSelected,TResult Function( CreatingSegment value)?  creatingSegment,TResult Function( SplittingSegment value)?  splittingSegment,TResult Function( WaypointSelected value)?  waypointSelected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case CursorDrawn() when cursorDrawn != null:
return cursorDrawn(_that);case VertexSelected() when vertexSelected != null:
return vertexSelected(_that);case DraggingVertex() when draggingVertex != null:
return draggingVertex(_that);case SegmentSelected() when segmentSelected != null:
return segmentSelected(_that);case CreatingSegment() when creatingSegment != null:
return creatingSegment(_that);case SplittingSegment() when splittingSegment != null:
return splittingSegment(_that);case WaypointSelected() when waypointSelected != null:
return waypointSelected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Idle value)  idle,required TResult Function( CursorDrawn value)  cursorDrawn,required TResult Function( VertexSelected value)  vertexSelected,required TResult Function( DraggingVertex value)  draggingVertex,required TResult Function( SegmentSelected value)  segmentSelected,required TResult Function( CreatingSegment value)  creatingSegment,required TResult Function( SplittingSegment value)  splittingSegment,required TResult Function( WaypointSelected value)  waypointSelected,}){
final _that = this;
switch (_that) {
case Idle():
return idle(_that);case CursorDrawn():
return cursorDrawn(_that);case VertexSelected():
return vertexSelected(_that);case DraggingVertex():
return draggingVertex(_that);case SegmentSelected():
return segmentSelected(_that);case CreatingSegment():
return creatingSegment(_that);case SplittingSegment():
return splittingSegment(_that);case WaypointSelected():
return waypointSelected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Idle value)?  idle,TResult? Function( CursorDrawn value)?  cursorDrawn,TResult? Function( VertexSelected value)?  vertexSelected,TResult? Function( DraggingVertex value)?  draggingVertex,TResult? Function( SegmentSelected value)?  segmentSelected,TResult? Function( CreatingSegment value)?  creatingSegment,TResult? Function( SplittingSegment value)?  splittingSegment,TResult? Function( WaypointSelected value)?  waypointSelected,}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case CursorDrawn() when cursorDrawn != null:
return cursorDrawn(_that);case VertexSelected() when vertexSelected != null:
return vertexSelected(_that);case DraggingVertex() when draggingVertex != null:
return draggingVertex(_that);case SegmentSelected() when segmentSelected != null:
return segmentSelected(_that);case CreatingSegment() when creatingSegment != null:
return creatingSegment(_that);case SplittingSegment() when splittingSegment != null:
return splittingSegment(_that);case WaypointSelected() when waypointSelected != null:
return waypointSelected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( LatLng latLng)?  cursorDrawn,TResult Function( VertexRef vertexRef)?  vertexSelected,TResult Function( VertexRef vertexRef)?  draggingVertex,TResult Function( SegmentRef segmentRef)?  segmentSelected,TResult Function( SegmentRef? segmentRef)?  creatingSegment,TResult Function( SegmentRef segmentRef)?  splittingSegment,TResult Function( Id<Waypoint> waypointId)?  waypointSelected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case CursorDrawn() when cursorDrawn != null:
return cursorDrawn(_that.latLng);case VertexSelected() when vertexSelected != null:
return vertexSelected(_that.vertexRef);case DraggingVertex() when draggingVertex != null:
return draggingVertex(_that.vertexRef);case SegmentSelected() when segmentSelected != null:
return segmentSelected(_that.segmentRef);case CreatingSegment() when creatingSegment != null:
return creatingSegment(_that.segmentRef);case SplittingSegment() when splittingSegment != null:
return splittingSegment(_that.segmentRef);case WaypointSelected() when waypointSelected != null:
return waypointSelected(_that.waypointId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( LatLng latLng)  cursorDrawn,required TResult Function( VertexRef vertexRef)  vertexSelected,required TResult Function( VertexRef vertexRef)  draggingVertex,required TResult Function( SegmentRef segmentRef)  segmentSelected,required TResult Function( SegmentRef? segmentRef)  creatingSegment,required TResult Function( SegmentRef segmentRef)  splittingSegment,required TResult Function( Id<Waypoint> waypointId)  waypointSelected,}) {final _that = this;
switch (_that) {
case Idle():
return idle();case CursorDrawn():
return cursorDrawn(_that.latLng);case VertexSelected():
return vertexSelected(_that.vertexRef);case DraggingVertex():
return draggingVertex(_that.vertexRef);case SegmentSelected():
return segmentSelected(_that.segmentRef);case CreatingSegment():
return creatingSegment(_that.segmentRef);case SplittingSegment():
return splittingSegment(_that.segmentRef);case WaypointSelected():
return waypointSelected(_that.waypointId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( LatLng latLng)?  cursorDrawn,TResult? Function( VertexRef vertexRef)?  vertexSelected,TResult? Function( VertexRef vertexRef)?  draggingVertex,TResult? Function( SegmentRef segmentRef)?  segmentSelected,TResult? Function( SegmentRef? segmentRef)?  creatingSegment,TResult? Function( SegmentRef segmentRef)?  splittingSegment,TResult? Function( Id<Waypoint> waypointId)?  waypointSelected,}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case CursorDrawn() when cursorDrawn != null:
return cursorDrawn(_that.latLng);case VertexSelected() when vertexSelected != null:
return vertexSelected(_that.vertexRef);case DraggingVertex() when draggingVertex != null:
return draggingVertex(_that.vertexRef);case SegmentSelected() when segmentSelected != null:
return segmentSelected(_that.segmentRef);case CreatingSegment() when creatingSegment != null:
return creatingSegment(_that.segmentRef);case SplittingSegment() when splittingSegment != null:
return splittingSegment(_that.segmentRef);case WaypointSelected() when waypointSelected != null:
return waypointSelected(_that.waypointId);case _:
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


class CursorDrawn implements MapMode {
  const CursorDrawn({required this.latLng});
  

 final  LatLng latLng;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CursorDrawnCopyWith<CursorDrawn> get copyWith => _$CursorDrawnCopyWithImpl<CursorDrawn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CursorDrawn&&(identical(other.latLng, latLng) || other.latLng == latLng));
}


@override
int get hashCode => Object.hash(runtimeType,latLng);

@override
String toString() {
  return 'MapMode.cursorDrawn(latLng: $latLng)';
}


}

/// @nodoc
abstract mixin class $CursorDrawnCopyWith<$Res> implements $MapModeCopyWith<$Res> {
  factory $CursorDrawnCopyWith(CursorDrawn value, $Res Function(CursorDrawn) _then) = _$CursorDrawnCopyWithImpl;
@useResult
$Res call({
 LatLng latLng
});




}
/// @nodoc
class _$CursorDrawnCopyWithImpl<$Res>
    implements $CursorDrawnCopyWith<$Res> {
  _$CursorDrawnCopyWithImpl(this._self, this._then);

  final CursorDrawn _self;
  final $Res Function(CursorDrawn) _then;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? latLng = null,}) {
  return _then(CursorDrawn(
latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

/// @nodoc


class VertexSelected implements MapMode {
  const VertexSelected({required this.vertexRef});
  

 final  VertexRef vertexRef;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VertexSelectedCopyWith<VertexSelected> get copyWith => _$VertexSelectedCopyWithImpl<VertexSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VertexSelected&&(identical(other.vertexRef, vertexRef) || other.vertexRef == vertexRef));
}


@override
int get hashCode => Object.hash(runtimeType,vertexRef);

@override
String toString() {
  return 'MapMode.vertexSelected(vertexRef: $vertexRef)';
}


}

/// @nodoc
abstract mixin class $VertexSelectedCopyWith<$Res> implements $MapModeCopyWith<$Res> {
  factory $VertexSelectedCopyWith(VertexSelected value, $Res Function(VertexSelected) _then) = _$VertexSelectedCopyWithImpl;
@useResult
$Res call({
 VertexRef vertexRef
});


$VertexRefCopyWith<$Res> get vertexRef;

}
/// @nodoc
class _$VertexSelectedCopyWithImpl<$Res>
    implements $VertexSelectedCopyWith<$Res> {
  _$VertexSelectedCopyWithImpl(this._self, this._then);

  final VertexSelected _self;
  final $Res Function(VertexSelected) _then;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vertexRef = null,}) {
  return _then(VertexSelected(
vertexRef: null == vertexRef ? _self.vertexRef : vertexRef // ignore: cast_nullable_to_non_nullable
as VertexRef,
  ));
}

/// Create a copy of MapMode
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


class DraggingVertex implements MapMode {
  const DraggingVertex({required this.vertexRef});
  

 final  VertexRef vertexRef;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraggingVertexCopyWith<DraggingVertex> get copyWith => _$DraggingVertexCopyWithImpl<DraggingVertex>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraggingVertex&&(identical(other.vertexRef, vertexRef) || other.vertexRef == vertexRef));
}


@override
int get hashCode => Object.hash(runtimeType,vertexRef);

@override
String toString() {
  return 'MapMode.draggingVertex(vertexRef: $vertexRef)';
}


}

/// @nodoc
abstract mixin class $DraggingVertexCopyWith<$Res> implements $MapModeCopyWith<$Res> {
  factory $DraggingVertexCopyWith(DraggingVertex value, $Res Function(DraggingVertex) _then) = _$DraggingVertexCopyWithImpl;
@useResult
$Res call({
 VertexRef vertexRef
});


$VertexRefCopyWith<$Res> get vertexRef;

}
/// @nodoc
class _$DraggingVertexCopyWithImpl<$Res>
    implements $DraggingVertexCopyWith<$Res> {
  _$DraggingVertexCopyWithImpl(this._self, this._then);

  final DraggingVertex _self;
  final $Res Function(DraggingVertex) _then;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vertexRef = null,}) {
  return _then(DraggingVertex(
vertexRef: null == vertexRef ? _self.vertexRef : vertexRef // ignore: cast_nullable_to_non_nullable
as VertexRef,
  ));
}

/// Create a copy of MapMode
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


class SegmentSelected implements MapMode {
  const SegmentSelected({required this.segmentRef});
  

 final  SegmentRef segmentRef;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentSelectedCopyWith<SegmentSelected> get copyWith => _$SegmentSelectedCopyWithImpl<SegmentSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentSelected&&(identical(other.segmentRef, segmentRef) || other.segmentRef == segmentRef));
}


@override
int get hashCode => Object.hash(runtimeType,segmentRef);

@override
String toString() {
  return 'MapMode.segmentSelected(segmentRef: $segmentRef)';
}


}

/// @nodoc
abstract mixin class $SegmentSelectedCopyWith<$Res> implements $MapModeCopyWith<$Res> {
  factory $SegmentSelectedCopyWith(SegmentSelected value, $Res Function(SegmentSelected) _then) = _$SegmentSelectedCopyWithImpl;
@useResult
$Res call({
 SegmentRef segmentRef
});


$SegmentRefCopyWith<$Res> get segmentRef;

}
/// @nodoc
class _$SegmentSelectedCopyWithImpl<$Res>
    implements $SegmentSelectedCopyWith<$Res> {
  _$SegmentSelectedCopyWithImpl(this._self, this._then);

  final SegmentSelected _self;
  final $Res Function(SegmentSelected) _then;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? segmentRef = null,}) {
  return _then(SegmentSelected(
segmentRef: null == segmentRef ? _self.segmentRef : segmentRef // ignore: cast_nullable_to_non_nullable
as SegmentRef,
  ));
}

/// Create a copy of MapMode
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


class CreatingSegment implements MapMode {
  const CreatingSegment({this.segmentRef});
  

 final  SegmentRef? segmentRef;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatingSegmentCopyWith<CreatingSegment> get copyWith => _$CreatingSegmentCopyWithImpl<CreatingSegment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatingSegment&&(identical(other.segmentRef, segmentRef) || other.segmentRef == segmentRef));
}


@override
int get hashCode => Object.hash(runtimeType,segmentRef);

@override
String toString() {
  return 'MapMode.creatingSegment(segmentRef: $segmentRef)';
}


}

/// @nodoc
abstract mixin class $CreatingSegmentCopyWith<$Res> implements $MapModeCopyWith<$Res> {
  factory $CreatingSegmentCopyWith(CreatingSegment value, $Res Function(CreatingSegment) _then) = _$CreatingSegmentCopyWithImpl;
@useResult
$Res call({
 SegmentRef? segmentRef
});


$SegmentRefCopyWith<$Res>? get segmentRef;

}
/// @nodoc
class _$CreatingSegmentCopyWithImpl<$Res>
    implements $CreatingSegmentCopyWith<$Res> {
  _$CreatingSegmentCopyWithImpl(this._self, this._then);

  final CreatingSegment _self;
  final $Res Function(CreatingSegment) _then;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? segmentRef = freezed,}) {
  return _then(CreatingSegment(
segmentRef: freezed == segmentRef ? _self.segmentRef : segmentRef // ignore: cast_nullable_to_non_nullable
as SegmentRef?,
  ));
}

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SegmentRefCopyWith<$Res>? get segmentRef {
    if (_self.segmentRef == null) {
    return null;
  }

  return $SegmentRefCopyWith<$Res>(_self.segmentRef!, (value) {
    return _then(_self.copyWith(segmentRef: value));
  });
}
}

/// @nodoc


class SplittingSegment implements MapMode {
  const SplittingSegment({required this.segmentRef});
  

 final  SegmentRef segmentRef;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplittingSegmentCopyWith<SplittingSegment> get copyWith => _$SplittingSegmentCopyWithImpl<SplittingSegment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplittingSegment&&(identical(other.segmentRef, segmentRef) || other.segmentRef == segmentRef));
}


@override
int get hashCode => Object.hash(runtimeType,segmentRef);

@override
String toString() {
  return 'MapMode.splittingSegment(segmentRef: $segmentRef)';
}


}

/// @nodoc
abstract mixin class $SplittingSegmentCopyWith<$Res> implements $MapModeCopyWith<$Res> {
  factory $SplittingSegmentCopyWith(SplittingSegment value, $Res Function(SplittingSegment) _then) = _$SplittingSegmentCopyWithImpl;
@useResult
$Res call({
 SegmentRef segmentRef
});


$SegmentRefCopyWith<$Res> get segmentRef;

}
/// @nodoc
class _$SplittingSegmentCopyWithImpl<$Res>
    implements $SplittingSegmentCopyWith<$Res> {
  _$SplittingSegmentCopyWithImpl(this._self, this._then);

  final SplittingSegment _self;
  final $Res Function(SplittingSegment) _then;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? segmentRef = null,}) {
  return _then(SplittingSegment(
segmentRef: null == segmentRef ? _self.segmentRef : segmentRef // ignore: cast_nullable_to_non_nullable
as SegmentRef,
  ));
}

/// Create a copy of MapMode
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


class WaypointSelected implements MapMode {
  const WaypointSelected({required this.waypointId});
  

 final  Id<Waypoint> waypointId;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaypointSelectedCopyWith<WaypointSelected> get copyWith => _$WaypointSelectedCopyWithImpl<WaypointSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaypointSelected&&(identical(other.waypointId, waypointId) || other.waypointId == waypointId));
}


@override
int get hashCode => Object.hash(runtimeType,waypointId);

@override
String toString() {
  return 'MapMode.waypointSelected(waypointId: $waypointId)';
}


}

/// @nodoc
abstract mixin class $WaypointSelectedCopyWith<$Res> implements $MapModeCopyWith<$Res> {
  factory $WaypointSelectedCopyWith(WaypointSelected value, $Res Function(WaypointSelected) _then) = _$WaypointSelectedCopyWithImpl;
@useResult
$Res call({
 Id<Waypoint> waypointId
});




}
/// @nodoc
class _$WaypointSelectedCopyWithImpl<$Res>
    implements $WaypointSelectedCopyWith<$Res> {
  _$WaypointSelectedCopyWithImpl(this._self, this._then);

  final WaypointSelected _self;
  final $Res Function(WaypointSelected) _then;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? waypointId = null,}) {
  return _then(WaypointSelected(
waypointId: null == waypointId ? _self.waypointId : waypointId // ignore: cast_nullable_to_non_nullable
as Id<Waypoint>,
  ));
}


}

// dart format on
