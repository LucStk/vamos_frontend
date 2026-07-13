// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'segment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Segment {

 Id<Segment> get id; Id<Vertex> get startVertexId; Id<Vertex> get endVertexId; List<LatLng> get geometry; MobilityType get mobilityType;
/// Create a copy of Segment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentCopyWith<Segment> get copyWith => _$SegmentCopyWithImpl<Segment>(this as Segment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Segment&&(identical(other.id, id) || other.id == id)&&(identical(other.startVertexId, startVertexId) || other.startVertexId == startVertexId)&&(identical(other.endVertexId, endVertexId) || other.endVertexId == endVertexId)&&const DeepCollectionEquality().equals(other.geometry, geometry)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType));
}


@override
int get hashCode => Object.hash(runtimeType,id,startVertexId,endVertexId,const DeepCollectionEquality().hash(geometry),mobilityType);

@override
String toString() {
  return 'Segment(id: $id, startVertexId: $startVertexId, endVertexId: $endVertexId, geometry: $geometry, mobilityType: $mobilityType)';
}


}

/// @nodoc
abstract mixin class $SegmentCopyWith<$Res>  {
  factory $SegmentCopyWith(Segment value, $Res Function(Segment) _then) = _$SegmentCopyWithImpl;
@useResult
$Res call({
 Id<Segment> id, Id<Vertex> startVertexId, Id<Vertex> endVertexId, List<LatLng> geometry, MobilityType mobilityType
});




}
/// @nodoc
class _$SegmentCopyWithImpl<$Res>
    implements $SegmentCopyWith<$Res> {
  _$SegmentCopyWithImpl(this._self, this._then);

  final Segment _self;
  final $Res Function(Segment) _then;

/// Create a copy of Segment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startVertexId = null,Object? endVertexId = null,Object? geometry = null,Object? mobilityType = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<Segment>,startVertexId: null == startVertexId ? _self.startVertexId : startVertexId // ignore: cast_nullable_to_non_nullable
as Id<Vertex>,endVertexId: null == endVertexId ? _self.endVertexId : endVertexId // ignore: cast_nullable_to_non_nullable
as Id<Vertex>,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,
  ));
}

}


/// Adds pattern-matching-related methods to [Segment].
extension SegmentPatterns on Segment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Segment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Segment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Segment value)  $default,){
final _that = this;
switch (_that) {
case _Segment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Segment value)?  $default,){
final _that = this;
switch (_that) {
case _Segment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Id<Segment> id,  Id<Vertex> startVertexId,  Id<Vertex> endVertexId,  List<LatLng> geometry,  MobilityType mobilityType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Segment() when $default != null:
return $default(_that.id,_that.startVertexId,_that.endVertexId,_that.geometry,_that.mobilityType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Id<Segment> id,  Id<Vertex> startVertexId,  Id<Vertex> endVertexId,  List<LatLng> geometry,  MobilityType mobilityType)  $default,) {final _that = this;
switch (_that) {
case _Segment():
return $default(_that.id,_that.startVertexId,_that.endVertexId,_that.geometry,_that.mobilityType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Id<Segment> id,  Id<Vertex> startVertexId,  Id<Vertex> endVertexId,  List<LatLng> geometry,  MobilityType mobilityType)?  $default,) {final _that = this;
switch (_that) {
case _Segment() when $default != null:
return $default(_that.id,_that.startVertexId,_that.endVertexId,_that.geometry,_that.mobilityType);case _:
  return null;

}
}

}

/// @nodoc


class _Segment extends Segment {
  const _Segment({required this.id, required this.startVertexId, required this.endVertexId, required final  List<LatLng> geometry, this.mobilityType = MobilityType.bike}): _geometry = geometry,super._();
  

@override final  Id<Segment> id;
@override final  Id<Vertex> startVertexId;
@override final  Id<Vertex> endVertexId;
 final  List<LatLng> _geometry;
@override List<LatLng> get geometry {
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometry);
}

@override@JsonKey() final  MobilityType mobilityType;

/// Create a copy of Segment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SegmentCopyWith<_Segment> get copyWith => __$SegmentCopyWithImpl<_Segment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Segment&&(identical(other.id, id) || other.id == id)&&(identical(other.startVertexId, startVertexId) || other.startVertexId == startVertexId)&&(identical(other.endVertexId, endVertexId) || other.endVertexId == endVertexId)&&const DeepCollectionEquality().equals(other._geometry, _geometry)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType));
}


@override
int get hashCode => Object.hash(runtimeType,id,startVertexId,endVertexId,const DeepCollectionEquality().hash(_geometry),mobilityType);

@override
String toString() {
  return 'Segment(id: $id, startVertexId: $startVertexId, endVertexId: $endVertexId, geometry: $geometry, mobilityType: $mobilityType)';
}


}

/// @nodoc
abstract mixin class _$SegmentCopyWith<$Res> implements $SegmentCopyWith<$Res> {
  factory _$SegmentCopyWith(_Segment value, $Res Function(_Segment) _then) = __$SegmentCopyWithImpl;
@override @useResult
$Res call({
 Id<Segment> id, Id<Vertex> startVertexId, Id<Vertex> endVertexId, List<LatLng> geometry, MobilityType mobilityType
});




}
/// @nodoc
class __$SegmentCopyWithImpl<$Res>
    implements _$SegmentCopyWith<$Res> {
  __$SegmentCopyWithImpl(this._self, this._then);

  final _Segment _self;
  final $Res Function(_Segment) _then;

/// Create a copy of Segment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startVertexId = null,Object? endVertexId = null,Object? geometry = null,Object? mobilityType = null,}) {
  return _then(_Segment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<Segment>,startVertexId: null == startVertexId ? _self.startVertexId : startVertexId // ignore: cast_nullable_to_non_nullable
as Id<Vertex>,endVertexId: null == endVertexId ? _self.endVertexId : endVertexId // ignore: cast_nullable_to_non_nullable
as Id<Vertex>,geometry: null == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,
  ));
}


}

/// @nodoc
mixin _$SegmentPatch {

 SegmentId get id; Id<Vertex> get startVertexId; Id<Vertex> get endVertexId; Geometry get geometryOverride; MobilityType get mobilityType; bool get recomputing; Object? get error;
/// Create a copy of SegmentPatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentPatchCopyWith<SegmentPatch> get copyWith => _$SegmentPatchCopyWithImpl<SegmentPatch>(this as SegmentPatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentPatch&&(identical(other.id, id) || other.id == id)&&(identical(other.startVertexId, startVertexId) || other.startVertexId == startVertexId)&&(identical(other.endVertexId, endVertexId) || other.endVertexId == endVertexId)&&const DeepCollectionEquality().equals(other.geometryOverride, geometryOverride)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,id,startVertexId,endVertexId,const DeepCollectionEquality().hash(geometryOverride),mobilityType,recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'SegmentPatch(id: $id, startVertexId: $startVertexId, endVertexId: $endVertexId, geometryOverride: $geometryOverride, mobilityType: $mobilityType, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class $SegmentPatchCopyWith<$Res>  {
  factory $SegmentPatchCopyWith(SegmentPatch value, $Res Function(SegmentPatch) _then) = _$SegmentPatchCopyWithImpl;
@useResult
$Res call({
 SegmentId id, Id<Vertex> startVertexId, Id<Vertex> endVertexId, Geometry geometryOverride, MobilityType mobilityType, bool recomputing, Object? error
});




}
/// @nodoc
class _$SegmentPatchCopyWithImpl<$Res>
    implements $SegmentPatchCopyWith<$Res> {
  _$SegmentPatchCopyWithImpl(this._self, this._then);

  final SegmentPatch _self;
  final $Res Function(SegmentPatch) _then;

/// Create a copy of SegmentPatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startVertexId = null,Object? endVertexId = null,Object? geometryOverride = null,Object? mobilityType = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SegmentId,startVertexId: null == startVertexId ? _self.startVertexId : startVertexId // ignore: cast_nullable_to_non_nullable
as Id<Vertex>,endVertexId: null == endVertexId ? _self.endVertexId : endVertexId // ignore: cast_nullable_to_non_nullable
as Id<Vertex>,geometryOverride: null == geometryOverride ? _self.geometryOverride : geometryOverride // ignore: cast_nullable_to_non_nullable
as Geometry,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [SegmentPatch].
extension SegmentPatchPatterns on SegmentPatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SegmentPatch value)?  internal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SegmentPatch() when internal != null:
return internal(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SegmentPatch value)  internal,}){
final _that = this;
switch (_that) {
case _SegmentPatch():
return internal(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SegmentPatch value)?  internal,}){
final _that = this;
switch (_that) {
case _SegmentPatch() when internal != null:
return internal(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SegmentId id,  Id<Vertex> startVertexId,  Id<Vertex> endVertexId,  Geometry geometryOverride,  MobilityType mobilityType,  bool recomputing,  Object? error)?  internal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SegmentPatch() when internal != null:
return internal(_that.id,_that.startVertexId,_that.endVertexId,_that.geometryOverride,_that.mobilityType,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SegmentId id,  Id<Vertex> startVertexId,  Id<Vertex> endVertexId,  Geometry geometryOverride,  MobilityType mobilityType,  bool recomputing,  Object? error)  internal,}) {final _that = this;
switch (_that) {
case _SegmentPatch():
return internal(_that.id,_that.startVertexId,_that.endVertexId,_that.geometryOverride,_that.mobilityType,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SegmentId id,  Id<Vertex> startVertexId,  Id<Vertex> endVertexId,  Geometry geometryOverride,  MobilityType mobilityType,  bool recomputing,  Object? error)?  internal,}) {final _that = this;
switch (_that) {
case _SegmentPatch() when internal != null:
return internal(_that.id,_that.startVertexId,_that.endVertexId,_that.geometryOverride,_that.mobilityType,_that.recomputing,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SegmentPatch extends SegmentPatch implements Patch<Segment> {
  const _SegmentPatch({required this.id, required this.startVertexId, required this.endVertexId, required final  Geometry geometryOverride, this.mobilityType = MobilityType.bike, this.recomputing = false, this.error}): _geometryOverride = geometryOverride,super._();
  

@override final  SegmentId id;
@override final  Id<Vertex> startVertexId;
@override final  Id<Vertex> endVertexId;
 final  Geometry _geometryOverride;
@override Geometry get geometryOverride {
  if (_geometryOverride is EqualUnmodifiableListView) return _geometryOverride;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometryOverride);
}

@override@JsonKey() final  MobilityType mobilityType;
@override@JsonKey() final  bool recomputing;
@override final  Object? error;

/// Create a copy of SegmentPatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SegmentPatchCopyWith<_SegmentPatch> get copyWith => __$SegmentPatchCopyWithImpl<_SegmentPatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SegmentPatch&&(identical(other.id, id) || other.id == id)&&(identical(other.startVertexId, startVertexId) || other.startVertexId == startVertexId)&&(identical(other.endVertexId, endVertexId) || other.endVertexId == endVertexId)&&const DeepCollectionEquality().equals(other._geometryOverride, _geometryOverride)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,id,startVertexId,endVertexId,const DeepCollectionEquality().hash(_geometryOverride),mobilityType,recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'SegmentPatch.internal(id: $id, startVertexId: $startVertexId, endVertexId: $endVertexId, geometryOverride: $geometryOverride, mobilityType: $mobilityType, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SegmentPatchCopyWith<$Res> implements $SegmentPatchCopyWith<$Res> {
  factory _$SegmentPatchCopyWith(_SegmentPatch value, $Res Function(_SegmentPatch) _then) = __$SegmentPatchCopyWithImpl;
@override @useResult
$Res call({
 SegmentId id, Id<Vertex> startVertexId, Id<Vertex> endVertexId, Geometry geometryOverride, MobilityType mobilityType, bool recomputing, Object? error
});




}
/// @nodoc
class __$SegmentPatchCopyWithImpl<$Res>
    implements _$SegmentPatchCopyWith<$Res> {
  __$SegmentPatchCopyWithImpl(this._self, this._then);

  final _SegmentPatch _self;
  final $Res Function(_SegmentPatch) _then;

/// Create a copy of SegmentPatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startVertexId = null,Object? endVertexId = null,Object? geometryOverride = null,Object? mobilityType = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_SegmentPatch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SegmentId,startVertexId: null == startVertexId ? _self.startVertexId : startVertexId // ignore: cast_nullable_to_non_nullable
as Id<Vertex>,endVertexId: null == endVertexId ? _self.endVertexId : endVertexId // ignore: cast_nullable_to_non_nullable
as Id<Vertex>,geometryOverride: null == geometryOverride ? _self._geometryOverride : geometryOverride // ignore: cast_nullable_to_non_nullable
as Geometry,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
