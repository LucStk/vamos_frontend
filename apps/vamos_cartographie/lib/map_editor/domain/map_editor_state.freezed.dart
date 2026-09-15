// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SketchMode {

 List<LatLng> get path; VertexId? get touchedVertex; MapObject? get selection;
/// Create a copy of SketchMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SketchModeCopyWith<SketchMode> get copyWith => _$SketchModeCopyWithImpl<SketchMode>(this as SketchMode, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SketchMode&&const DeepCollectionEquality().equals(other.path, path)&&(identical(other.touchedVertex, touchedVertex) || other.touchedVertex == touchedVertex)&&(identical(other.selection, selection) || other.selection == selection));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(path),touchedVertex,selection);

@override
String toString() {
  return 'SketchMode(path: $path, touchedVertex: $touchedVertex, selection: $selection)';
}


}

/// @nodoc
abstract mixin class $SketchModeCopyWith<$Res>  {
  factory $SketchModeCopyWith(SketchMode value, $Res Function(SketchMode) _then) = _$SketchModeCopyWithImpl;
@useResult
$Res call({
 List<LatLng> path, Id<VertexFields>? touchedVertex, MapObject? selection
});




}
/// @nodoc
class _$SketchModeCopyWithImpl<$Res>
    implements $SketchModeCopyWith<$Res> {
  _$SketchModeCopyWithImpl(this._self, this._then);

  final SketchMode _self;
  final $Res Function(SketchMode) _then;

/// Create a copy of SketchMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? touchedVertex = freezed,Object? selection = freezed,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as List<LatLng>,touchedVertex: freezed == touchedVertex ? _self.touchedVertex : touchedVertex // ignore: cast_nullable_to_non_nullable
as Id<VertexFields>?,selection: freezed == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as MapObject?,
  ));
}

}


/// Adds pattern-matching-related methods to [SketchMode].
extension SketchModePatterns on SketchMode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SketchCreation value)?  creation,TResult Function( SketchEdition value)?  edition,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SketchCreation() when creation != null:
return creation(_that);case SketchEdition() when edition != null:
return edition(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SketchCreation value)  creation,required TResult Function( SketchEdition value)  edition,}){
final _that = this;
switch (_that) {
case SketchCreation():
return creation(_that);case SketchEdition():
return edition(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SketchCreation value)?  creation,TResult? Function( SketchEdition value)?  edition,}){
final _that = this;
switch (_that) {
case SketchCreation() when creation != null:
return creation(_that);case SketchEdition() when edition != null:
return edition(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( VertexId vertexStart,  List<LatLng> path,  MobilityType mobilityType,  VertexId? touchedVertex,  MapObject? selection)?  creation,TResult Function( SegmentId segmentId,  List<LatLng> path,  VertexId? touchedVertex,  MapObject? selection)?  edition,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SketchCreation() when creation != null:
return creation(_that.vertexStart,_that.path,_that.mobilityType,_that.touchedVertex,_that.selection);case SketchEdition() when edition != null:
return edition(_that.segmentId,_that.path,_that.touchedVertex,_that.selection);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( VertexId vertexStart,  List<LatLng> path,  MobilityType mobilityType,  VertexId? touchedVertex,  MapObject? selection)  creation,required TResult Function( SegmentId segmentId,  List<LatLng> path,  VertexId? touchedVertex,  MapObject? selection)  edition,}) {final _that = this;
switch (_that) {
case SketchCreation():
return creation(_that.vertexStart,_that.path,_that.mobilityType,_that.touchedVertex,_that.selection);case SketchEdition():
return edition(_that.segmentId,_that.path,_that.touchedVertex,_that.selection);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( VertexId vertexStart,  List<LatLng> path,  MobilityType mobilityType,  VertexId? touchedVertex,  MapObject? selection)?  creation,TResult? Function( SegmentId segmentId,  List<LatLng> path,  VertexId? touchedVertex,  MapObject? selection)?  edition,}) {final _that = this;
switch (_that) {
case SketchCreation() when creation != null:
return creation(_that.vertexStart,_that.path,_that.mobilityType,_that.touchedVertex,_that.selection);case SketchEdition() when edition != null:
return edition(_that.segmentId,_that.path,_that.touchedVertex,_that.selection);case _:
  return null;

}
}

}

/// @nodoc


class SketchCreation extends SketchMode {
  const SketchCreation({required this.vertexStart, required final  List<LatLng> path, required this.mobilityType, this.touchedVertex, this.selection}): _path = path,super._();
  

 final  VertexId vertexStart;
 final  List<LatLng> _path;
@override List<LatLng> get path {
  if (_path is EqualUnmodifiableListView) return _path;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_path);
}

 final  MobilityType mobilityType;
@override final  VertexId? touchedVertex;
@override final  MapObject? selection;

/// Create a copy of SketchMode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SketchCreationCopyWith<SketchCreation> get copyWith => _$SketchCreationCopyWithImpl<SketchCreation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SketchCreation&&(identical(other.vertexStart, vertexStart) || other.vertexStart == vertexStart)&&const DeepCollectionEquality().equals(other._path, _path)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType)&&(identical(other.touchedVertex, touchedVertex) || other.touchedVertex == touchedVertex)&&(identical(other.selection, selection) || other.selection == selection));
}


@override
int get hashCode => Object.hash(runtimeType,vertexStart,const DeepCollectionEquality().hash(_path),mobilityType,touchedVertex,selection);

@override
String toString() {
  return 'SketchMode.creation(vertexStart: $vertexStart, path: $path, mobilityType: $mobilityType, touchedVertex: $touchedVertex, selection: $selection)';
}


}

/// @nodoc
abstract mixin class $SketchCreationCopyWith<$Res> implements $SketchModeCopyWith<$Res> {
  factory $SketchCreationCopyWith(SketchCreation value, $Res Function(SketchCreation) _then) = _$SketchCreationCopyWithImpl;
@override @useResult
$Res call({
 VertexId vertexStart, List<LatLng> path, MobilityType mobilityType, VertexId? touchedVertex, MapObject? selection
});




}
/// @nodoc
class _$SketchCreationCopyWithImpl<$Res>
    implements $SketchCreationCopyWith<$Res> {
  _$SketchCreationCopyWithImpl(this._self, this._then);

  final SketchCreation _self;
  final $Res Function(SketchCreation) _then;

/// Create a copy of SketchMode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vertexStart = null,Object? path = null,Object? mobilityType = null,Object? touchedVertex = freezed,Object? selection = freezed,}) {
  return _then(SketchCreation(
vertexStart: null == vertexStart ? _self.vertexStart : vertexStart // ignore: cast_nullable_to_non_nullable
as VertexId,path: null == path ? _self._path : path // ignore: cast_nullable_to_non_nullable
as List<LatLng>,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,touchedVertex: freezed == touchedVertex ? _self.touchedVertex : touchedVertex // ignore: cast_nullable_to_non_nullable
as VertexId?,selection: freezed == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as MapObject?,
  ));
}


}

/// @nodoc


class SketchEdition extends SketchMode {
  const SketchEdition({required this.segmentId, required final  List<LatLng> path, this.touchedVertex, this.selection}): _path = path,super._();
  

 final  SegmentId segmentId;
 final  List<LatLng> _path;
@override List<LatLng> get path {
  if (_path is EqualUnmodifiableListView) return _path;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_path);
}

@override final  VertexId? touchedVertex;
@override final  MapObject? selection;

/// Create a copy of SketchMode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SketchEditionCopyWith<SketchEdition> get copyWith => _$SketchEditionCopyWithImpl<SketchEdition>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SketchEdition&&(identical(other.segmentId, segmentId) || other.segmentId == segmentId)&&const DeepCollectionEquality().equals(other._path, _path)&&(identical(other.touchedVertex, touchedVertex) || other.touchedVertex == touchedVertex)&&(identical(other.selection, selection) || other.selection == selection));
}


@override
int get hashCode => Object.hash(runtimeType,segmentId,const DeepCollectionEquality().hash(_path),touchedVertex,selection);

@override
String toString() {
  return 'SketchMode.edition(segmentId: $segmentId, path: $path, touchedVertex: $touchedVertex, selection: $selection)';
}


}

/// @nodoc
abstract mixin class $SketchEditionCopyWith<$Res> implements $SketchModeCopyWith<$Res> {
  factory $SketchEditionCopyWith(SketchEdition value, $Res Function(SketchEdition) _then) = _$SketchEditionCopyWithImpl;
@override @useResult
$Res call({
 SegmentId segmentId, List<LatLng> path, VertexId? touchedVertex, MapObject? selection
});




}
/// @nodoc
class _$SketchEditionCopyWithImpl<$Res>
    implements $SketchEditionCopyWith<$Res> {
  _$SketchEditionCopyWithImpl(this._self, this._then);

  final SketchEdition _self;
  final $Res Function(SketchEdition) _then;

/// Create a copy of SketchMode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? segmentId = null,Object? path = null,Object? touchedVertex = freezed,Object? selection = freezed,}) {
  return _then(SketchEdition(
segmentId: null == segmentId ? _self.segmentId : segmentId // ignore: cast_nullable_to_non_nullable
as SegmentId,path: null == path ? _self._path : path // ignore: cast_nullable_to_non_nullable
as List<LatLng>,touchedVertex: freezed == touchedVertex ? _self.touchedVertex : touchedVertex // ignore: cast_nullable_to_non_nullable
as VertexId?,selection: freezed == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as MapObject?,
  ));
}


}

// dart format on
