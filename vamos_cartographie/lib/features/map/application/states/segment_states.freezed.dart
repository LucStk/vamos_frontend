// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'segment_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LineNode implements DiagnosticableTreeMixin {

 String get uid; LatLng get latLng;
/// Create a copy of LineNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LineNodeCopyWith<LineNode> get copyWith => _$LineNodeCopyWithImpl<LineNode>(this as LineNode, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LineNode'))
    ..add(DiagnosticsProperty('uid', uid))..add(DiagnosticsProperty('latLng', latLng));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LineNode&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.latLng, latLng) || other.latLng == latLng));
}


@override
int get hashCode => Object.hash(runtimeType,uid,latLng);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LineNode(uid: $uid, latLng: $latLng)';
}


}

/// @nodoc
abstract mixin class $LineNodeCopyWith<$Res>  {
  factory $LineNodeCopyWith(LineNode value, $Res Function(LineNode) _then) = _$LineNodeCopyWithImpl;
@useResult
$Res call({
 String uid, LatLng latLng
});




}
/// @nodoc
class _$LineNodeCopyWithImpl<$Res>
    implements $LineNodeCopyWith<$Res> {
  _$LineNodeCopyWithImpl(this._self, this._then);

  final LineNode _self;
  final $Res Function(LineNode) _then;

/// Create a copy of LineNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? latLng = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}

}


/// Adds pattern-matching-related methods to [LineNode].
extension LineNodePatterns on LineNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WaypointNode value)?  waypoint,TResult Function( IntermediateNode value)?  intermediate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WaypointNode() when waypoint != null:
return waypoint(_that);case IntermediateNode() when intermediate != null:
return intermediate(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WaypointNode value)  waypoint,required TResult Function( IntermediateNode value)  intermediate,}){
final _that = this;
switch (_that) {
case WaypointNode():
return waypoint(_that);case IntermediateNode():
return intermediate(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WaypointNode value)?  waypoint,TResult? Function( IntermediateNode value)?  intermediate,}){
final _that = this;
switch (_that) {
case WaypointNode() when waypoint != null:
return waypoint(_that);case IntermediateNode() when intermediate != null:
return intermediate(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String uid,  int waypointId,  LatLng latLng)?  waypoint,TResult Function( String uid,  int index,  LatLng latLng)?  intermediate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WaypointNode() when waypoint != null:
return waypoint(_that.uid,_that.waypointId,_that.latLng);case IntermediateNode() when intermediate != null:
return intermediate(_that.uid,_that.index,_that.latLng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String uid,  int waypointId,  LatLng latLng)  waypoint,required TResult Function( String uid,  int index,  LatLng latLng)  intermediate,}) {final _that = this;
switch (_that) {
case WaypointNode():
return waypoint(_that.uid,_that.waypointId,_that.latLng);case IntermediateNode():
return intermediate(_that.uid,_that.index,_that.latLng);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String uid,  int waypointId,  LatLng latLng)?  waypoint,TResult? Function( String uid,  int index,  LatLng latLng)?  intermediate,}) {final _that = this;
switch (_that) {
case WaypointNode() when waypoint != null:
return waypoint(_that.uid,_that.waypointId,_that.latLng);case IntermediateNode() when intermediate != null:
return intermediate(_that.uid,_that.index,_that.latLng);case _:
  return null;

}
}

}

/// @nodoc


class WaypointNode extends LineNode with DiagnosticableTreeMixin {
  const WaypointNode({required this.uid, required this.waypointId, required this.latLng}): super._();
  

@override final  String uid;
 final  int waypointId;
@override final  LatLng latLng;

/// Create a copy of LineNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaypointNodeCopyWith<WaypointNode> get copyWith => _$WaypointNodeCopyWithImpl<WaypointNode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LineNode.waypoint'))
    ..add(DiagnosticsProperty('uid', uid))..add(DiagnosticsProperty('waypointId', waypointId))..add(DiagnosticsProperty('latLng', latLng));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaypointNode&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.waypointId, waypointId) || other.waypointId == waypointId)&&(identical(other.latLng, latLng) || other.latLng == latLng));
}


@override
int get hashCode => Object.hash(runtimeType,uid,waypointId,latLng);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LineNode.waypoint(uid: $uid, waypointId: $waypointId, latLng: $latLng)';
}


}

/// @nodoc
abstract mixin class $WaypointNodeCopyWith<$Res> implements $LineNodeCopyWith<$Res> {
  factory $WaypointNodeCopyWith(WaypointNode value, $Res Function(WaypointNode) _then) = _$WaypointNodeCopyWithImpl;
@override @useResult
$Res call({
 String uid, int waypointId, LatLng latLng
});




}
/// @nodoc
class _$WaypointNodeCopyWithImpl<$Res>
    implements $WaypointNodeCopyWith<$Res> {
  _$WaypointNodeCopyWithImpl(this._self, this._then);

  final WaypointNode _self;
  final $Res Function(WaypointNode) _then;

/// Create a copy of LineNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? waypointId = null,Object? latLng = null,}) {
  return _then(WaypointNode(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,waypointId: null == waypointId ? _self.waypointId : waypointId // ignore: cast_nullable_to_non_nullable
as int,latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

/// @nodoc


class IntermediateNode extends LineNode with DiagnosticableTreeMixin {
  const IntermediateNode({required this.uid, required this.index, required this.latLng}): super._();
  

@override final  String uid;
 final  int index;
@override final  LatLng latLng;

/// Create a copy of LineNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IntermediateNodeCopyWith<IntermediateNode> get copyWith => _$IntermediateNodeCopyWithImpl<IntermediateNode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LineNode.intermediate'))
    ..add(DiagnosticsProperty('uid', uid))..add(DiagnosticsProperty('index', index))..add(DiagnosticsProperty('latLng', latLng));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntermediateNode&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.index, index) || other.index == index)&&(identical(other.latLng, latLng) || other.latLng == latLng));
}


@override
int get hashCode => Object.hash(runtimeType,uid,index,latLng);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LineNode.intermediate(uid: $uid, index: $index, latLng: $latLng)';
}


}

/// @nodoc
abstract mixin class $IntermediateNodeCopyWith<$Res> implements $LineNodeCopyWith<$Res> {
  factory $IntermediateNodeCopyWith(IntermediateNode value, $Res Function(IntermediateNode) _then) = _$IntermediateNodeCopyWithImpl;
@override @useResult
$Res call({
 String uid, int index, LatLng latLng
});




}
/// @nodoc
class _$IntermediateNodeCopyWithImpl<$Res>
    implements $IntermediateNodeCopyWith<$Res> {
  _$IntermediateNodeCopyWithImpl(this._self, this._then);

  final IntermediateNode _self;
  final $Res Function(IntermediateNode) _then;

/// Create a copy of LineNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? index = null,Object? latLng = null,}) {
  return _then(IntermediateNode(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

// dart format on
