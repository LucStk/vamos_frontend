// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_editor_mode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SketchCreation {

 VertexId get vertexStart; List<LatLng> get path; MobilityType get mobilityType; VertexId? get touchedVertex; MapObject? get selection; PopUpPositionType? get popUpPosition;
/// Create a copy of SketchCreation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SketchCreationCopyWith<SketchCreation> get copyWith => _$SketchCreationCopyWithImpl<SketchCreation>(this as SketchCreation, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SketchCreation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SketchCreation&&(identical(other.vertexStart, _this.vertexStart) || other.vertexStart == _this.vertexStart)&&const DeepCollectionEquality().equals(other.path, _this.path)&&(identical(other.mobilityType, _this.mobilityType) || other.mobilityType == _this.mobilityType)&&(identical(other.touchedVertex, _this.touchedVertex) || other.touchedVertex == _this.touchedVertex)&&(identical(other.selection, _this.selection) || other.selection == _this.selection)&&(identical(other.popUpPosition, _this.popUpPosition) || other.popUpPosition == _this.popUpPosition));
}


@override
int get hashCode {
  final _this = this as SketchCreation;
  return Object.hash(runtimeType,_this.vertexStart,const DeepCollectionEquality().hash(_this.path),_this.mobilityType,_this.touchedVertex,_this.selection,_this.popUpPosition);
}

@override
String toString() {
  final _this = this as SketchCreation;
  return 'SketchCreation(vertexStart: ${_this.vertexStart}, path: ${_this.path}, mobilityType: ${_this.mobilityType}, touchedVertex: ${_this.touchedVertex}, selection: ${_this.selection}, popUpPosition: ${_this.popUpPosition})';
}


}

/// @nodoc
abstract mixin class $SketchCreationCopyWith<$Res>  {
  factory $SketchCreationCopyWith(SketchCreation value, $Res Function(SketchCreation) _then) = _$SketchCreationCopyWithImpl;
@useResult
$Res call({
 VertexId vertexStart, List<LatLng> path, MobilityType mobilityType, VertexId? touchedVertex, MapObject? selection, PopUpPositionType? popUpPosition
});




}
/// @nodoc
class _$SketchCreationCopyWithImpl<$Res>
    implements $SketchCreationCopyWith<$Res> {
  _$SketchCreationCopyWithImpl(this._self, this._then);

  final SketchCreation _self;
  final $Res Function(SketchCreation) _then;

/// Create a copy of SketchCreation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vertexStart = null,Object? path = null,Object? mobilityType = null,Object? touchedVertex = freezed,Object? selection = freezed,Object? popUpPosition = freezed,}) {
  return _then(SketchCreation(
vertexStart: null == vertexStart ? _self.vertexStart : vertexStart // ignore: cast_nullable_to_non_nullable
as VertexId,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as List<LatLng>,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,touchedVertex: freezed == touchedVertex ? _self.touchedVertex : touchedVertex // ignore: cast_nullable_to_non_nullable
as VertexId?,selection: freezed == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as MapObject?,popUpPosition: freezed == popUpPosition ? _self.popUpPosition : popUpPosition // ignore: cast_nullable_to_non_nullable
as PopUpPositionType?,
  ));
}

}


/// Adds pattern-matching-related methods to [SketchCreation].
extension SketchCreationPatterns on SketchCreation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SketchCreation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SketchCreation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SketchCreation value)  $default,){
final _that = this;
switch (_that) {
case _SketchCreation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SketchCreation value)?  $default,){
final _that = this;
switch (_that) {
case _SketchCreation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VertexId vertexStart,  List<LatLng> path,  MobilityType mobilityType,  VertexId? touchedVertex,  MapObject? selection,  PopUpPositionType? popUpPosition)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SketchCreation() when $default != null:
return $default(_that.vertexStart,_that.path,_that.mobilityType,_that.touchedVertex,_that.selection,_that.popUpPosition);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VertexId vertexStart,  List<LatLng> path,  MobilityType mobilityType,  VertexId? touchedVertex,  MapObject? selection,  PopUpPositionType? popUpPosition)  $default,) {final _that = this;
switch (_that) {
case _SketchCreation():
return $default(_that.vertexStart,_that.path,_that.mobilityType,_that.touchedVertex,_that.selection,_that.popUpPosition);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VertexId vertexStart,  List<LatLng> path,  MobilityType mobilityType,  VertexId? touchedVertex,  MapObject? selection,  PopUpPositionType? popUpPosition)?  $default,) {final _that = this;
switch (_that) {
case _SketchCreation() when $default != null:
return $default(_that.vertexStart,_that.path,_that.mobilityType,_that.touchedVertex,_that.selection,_that.popUpPosition);case _:
  return null;

}
}

}

/// @nodoc


class _SketchCreation extends SketchCreation {
   _SketchCreation({required this.vertexStart, required  List<LatLng> path, required this.mobilityType, this.touchedVertex, this.selection, this.popUpPosition}): _path = path,super._();
  

@override final  VertexId vertexStart;
 final  List<LatLng> _path;
@override List<LatLng> get path {
  if (_path is EqualUnmodifiableListView) return _path;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_path);
}

@override final  MobilityType mobilityType;
@override final  VertexId? touchedVertex;
@override final  MapObject? selection;
@override final  PopUpPositionType? popUpPosition;

/// Create a copy of SketchCreation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SketchCreationCopyWith<_SketchCreation> get copyWith => __$SketchCreationCopyWithImpl<_SketchCreation>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SketchCreation&&(identical(other.vertexStart, vertexStart) || other.vertexStart == vertexStart)&&const DeepCollectionEquality().equals(other.path, _path)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType)&&(identical(other.touchedVertex, touchedVertex) || other.touchedVertex == touchedVertex)&&(identical(other.selection, selection) || other.selection == selection)&&(identical(other.popUpPosition, popUpPosition) || other.popUpPosition == popUpPosition));
}


@override
int get hashCode {
    return Object.hash(runtimeType,vertexStart,const DeepCollectionEquality().hash(_path),mobilityType,touchedVertex,selection,popUpPosition);
}

@override
String toString() {
    return 'SketchCreation(vertexStart: $vertexStart, path: $path, mobilityType: $mobilityType, touchedVertex: $touchedVertex, selection: $selection, popUpPosition: $popUpPosition)';
}


}

/// @nodoc
abstract mixin class _$SketchCreationCopyWith<$Res> implements $SketchCreationCopyWith<$Res> {
  factory _$SketchCreationCopyWith(_SketchCreation value, $Res Function(_SketchCreation) _then) = __$SketchCreationCopyWithImpl;
@override @useResult
$Res call({
 VertexId vertexStart, List<LatLng> path, MobilityType mobilityType, VertexId? touchedVertex, MapObject? selection, PopUpPositionType? popUpPosition
});




}
/// @nodoc
class __$SketchCreationCopyWithImpl<$Res>
    implements _$SketchCreationCopyWith<$Res> {
  __$SketchCreationCopyWithImpl(this._self, this._then);

  final _SketchCreation _self;
  final $Res Function(_SketchCreation) _then;

/// Create a copy of SketchCreation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vertexStart = null,Object? path = null,Object? mobilityType = null,Object? touchedVertex = freezed,Object? selection = freezed,Object? popUpPosition = freezed,}) {
  return _then(_SketchCreation(
vertexStart: null == vertexStart ? _self.vertexStart : vertexStart // ignore: cast_nullable_to_non_nullable
as VertexId,path: null == path ? _self._path : path // ignore: cast_nullable_to_non_nullable
as List<LatLng>,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,touchedVertex: freezed == touchedVertex ? _self.touchedVertex : touchedVertex // ignore: cast_nullable_to_non_nullable
as VertexId?,selection: freezed == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as MapObject?,popUpPosition: freezed == popUpPosition ? _self.popUpPosition : popUpPosition // ignore: cast_nullable_to_non_nullable
as PopUpPositionType?,
  ));
}


}

/// @nodoc
mixin _$SketchEdition {

 SegmentId get segmentId; List<LatLng> get path; VertexId? get touchedVertex; MapObject? get selection; PopUpPositionType? get popUpPosition;
/// Create a copy of SketchEdition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SketchEditionCopyWith<SketchEdition> get copyWith => _$SketchEditionCopyWithImpl<SketchEdition>(this as SketchEdition, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SketchEdition;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SketchEdition&&(identical(other.segmentId, _this.segmentId) || other.segmentId == _this.segmentId)&&const DeepCollectionEquality().equals(other.path, _this.path)&&(identical(other.touchedVertex, _this.touchedVertex) || other.touchedVertex == _this.touchedVertex)&&(identical(other.selection, _this.selection) || other.selection == _this.selection)&&(identical(other.popUpPosition, _this.popUpPosition) || other.popUpPosition == _this.popUpPosition));
}


@override
int get hashCode {
  final _this = this as SketchEdition;
  return Object.hash(runtimeType,_this.segmentId,const DeepCollectionEquality().hash(_this.path),_this.touchedVertex,_this.selection,_this.popUpPosition);
}

@override
String toString() {
  final _this = this as SketchEdition;
  return 'SketchEdition(segmentId: ${_this.segmentId}, path: ${_this.path}, touchedVertex: ${_this.touchedVertex}, selection: ${_this.selection}, popUpPosition: ${_this.popUpPosition})';
}


}

/// @nodoc
abstract mixin class $SketchEditionCopyWith<$Res>  {
  factory $SketchEditionCopyWith(SketchEdition value, $Res Function(SketchEdition) _then) = _$SketchEditionCopyWithImpl;
@useResult
$Res call({
 SegmentId segmentId, List<LatLng> path, VertexId? touchedVertex, MapObject? selection, PopUpPositionType? popUpPosition
});




}
/// @nodoc
class _$SketchEditionCopyWithImpl<$Res>
    implements $SketchEditionCopyWith<$Res> {
  _$SketchEditionCopyWithImpl(this._self, this._then);

  final SketchEdition _self;
  final $Res Function(SketchEdition) _then;

/// Create a copy of SketchEdition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? segmentId = null,Object? path = null,Object? touchedVertex = freezed,Object? selection = freezed,Object? popUpPosition = freezed,}) {
  return _then(SketchEdition(
segmentId: null == segmentId ? _self.segmentId : segmentId // ignore: cast_nullable_to_non_nullable
as SegmentId,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as List<LatLng>,touchedVertex: freezed == touchedVertex ? _self.touchedVertex : touchedVertex // ignore: cast_nullable_to_non_nullable
as VertexId?,selection: freezed == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as MapObject?,popUpPosition: freezed == popUpPosition ? _self.popUpPosition : popUpPosition // ignore: cast_nullable_to_non_nullable
as PopUpPositionType?,
  ));
}

}


/// Adds pattern-matching-related methods to [SketchEdition].
extension SketchEditionPatterns on SketchEdition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SketchEdition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SketchEdition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SketchEdition value)  $default,){
final _that = this;
switch (_that) {
case _SketchEdition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SketchEdition value)?  $default,){
final _that = this;
switch (_that) {
case _SketchEdition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SegmentId segmentId,  List<LatLng> path,  VertexId? touchedVertex,  MapObject? selection,  PopUpPositionType? popUpPosition)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SketchEdition() when $default != null:
return $default(_that.segmentId,_that.path,_that.touchedVertex,_that.selection,_that.popUpPosition);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SegmentId segmentId,  List<LatLng> path,  VertexId? touchedVertex,  MapObject? selection,  PopUpPositionType? popUpPosition)  $default,) {final _that = this;
switch (_that) {
case _SketchEdition():
return $default(_that.segmentId,_that.path,_that.touchedVertex,_that.selection,_that.popUpPosition);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SegmentId segmentId,  List<LatLng> path,  VertexId? touchedVertex,  MapObject? selection,  PopUpPositionType? popUpPosition)?  $default,) {final _that = this;
switch (_that) {
case _SketchEdition() when $default != null:
return $default(_that.segmentId,_that.path,_that.touchedVertex,_that.selection,_that.popUpPosition);case _:
  return null;

}
}

}

/// @nodoc


class _SketchEdition extends SketchEdition {
   _SketchEdition({required this.segmentId, required  List<LatLng> path, this.touchedVertex, this.selection, this.popUpPosition}): _path = path,super._();
  

@override final  SegmentId segmentId;
 final  List<LatLng> _path;
@override List<LatLng> get path {
  if (_path is EqualUnmodifiableListView) return _path;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_path);
}

@override final  VertexId? touchedVertex;
@override final  MapObject? selection;
@override final  PopUpPositionType? popUpPosition;

/// Create a copy of SketchEdition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SketchEditionCopyWith<_SketchEdition> get copyWith => __$SketchEditionCopyWithImpl<_SketchEdition>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SketchEdition&&(identical(other.segmentId, segmentId) || other.segmentId == segmentId)&&const DeepCollectionEquality().equals(other.path, _path)&&(identical(other.touchedVertex, touchedVertex) || other.touchedVertex == touchedVertex)&&(identical(other.selection, selection) || other.selection == selection)&&(identical(other.popUpPosition, popUpPosition) || other.popUpPosition == popUpPosition));
}


@override
int get hashCode {
    return Object.hash(runtimeType,segmentId,const DeepCollectionEquality().hash(_path),touchedVertex,selection,popUpPosition);
}

@override
String toString() {
    return 'SketchEdition(segmentId: $segmentId, path: $path, touchedVertex: $touchedVertex, selection: $selection, popUpPosition: $popUpPosition)';
}


}

/// @nodoc
abstract mixin class _$SketchEditionCopyWith<$Res> implements $SketchEditionCopyWith<$Res> {
  factory _$SketchEditionCopyWith(_SketchEdition value, $Res Function(_SketchEdition) _then) = __$SketchEditionCopyWithImpl;
@override @useResult
$Res call({
 SegmentId segmentId, List<LatLng> path, VertexId? touchedVertex, MapObject? selection, PopUpPositionType? popUpPosition
});




}
/// @nodoc
class __$SketchEditionCopyWithImpl<$Res>
    implements _$SketchEditionCopyWith<$Res> {
  __$SketchEditionCopyWithImpl(this._self, this._then);

  final _SketchEdition _self;
  final $Res Function(_SketchEdition) _then;

/// Create a copy of SketchEdition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? segmentId = null,Object? path = null,Object? touchedVertex = freezed,Object? selection = freezed,Object? popUpPosition = freezed,}) {
  return _then(_SketchEdition(
segmentId: null == segmentId ? _self.segmentId : segmentId // ignore: cast_nullable_to_non_nullable
as SegmentId,path: null == path ? _self._path : path // ignore: cast_nullable_to_non_nullable
as List<LatLng>,touchedVertex: freezed == touchedVertex ? _self.touchedVertex : touchedVertex // ignore: cast_nullable_to_non_nullable
as VertexId?,selection: freezed == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as MapObject?,popUpPosition: freezed == popUpPosition ? _self.popUpPosition : popUpPosition // ignore: cast_nullable_to_non_nullable
as PopUpPositionType?,
  ));
}


}

/// @nodoc
mixin _$InitTripMode {


/// Create a copy of InitTripMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitTripModeCopyWith<InitTripMode> get copyWith => _$InitTripModeCopyWithImpl<InitTripMode>(this as InitTripMode, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as InitTripMode;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitTripMode&&(identical(other.popUpPosition, _this.popUpPosition) || other.popUpPosition == _this.popUpPosition));
}


@override
int get hashCode {
  final _this = this as InitTripMode;
  return Object.hash(runtimeType,_this.popUpPosition);
}

@override
String toString() {
  final _this = this as InitTripMode;
  return 'InitTripMode(popUpPosition: ${_this.popUpPosition})';
}


}

/// @nodoc
abstract mixin class $InitTripModeCopyWith<$Res>  {
  factory $InitTripModeCopyWith(InitTripMode value, $Res Function(InitTripMode) _then) = _$InitTripModeCopyWithImpl;
@useResult
$Res call({
 PopUpPositionType? popUpPosition
});




}
/// @nodoc
class _$InitTripModeCopyWithImpl<$Res>
    implements $InitTripModeCopyWith<$Res> {
  _$InitTripModeCopyWithImpl(this._self, this._then);

  final InitTripMode _self;
  final $Res Function(InitTripMode) _then;

/// Create a copy of InitTripMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? popUpPosition = freezed,}) {
  return _then(InitTripMode(
freezed == popUpPosition ? _self.popUpPosition : popUpPosition // ignore: cast_nullable_to_non_nullable
as PopUpPositionType?,
  ));
}

}


/// Adds pattern-matching-related methods to [InitTripMode].
extension InitTripModePatterns on InitTripMode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$IdleEditor {


/// Create a copy of IdleEditor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdleEditorCopyWith<IdleEditor> get copyWith => _$IdleEditorCopyWithImpl<IdleEditor>(this as IdleEditor, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as IdleEditor;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdleEditor&&(identical(other.popUpPosition, _this.popUpPosition) || other.popUpPosition == _this.popUpPosition));
}


@override
int get hashCode {
  final _this = this as IdleEditor;
  return Object.hash(runtimeType,_this.popUpPosition);
}

@override
String toString() {
  final _this = this as IdleEditor;
  return 'IdleEditor(popUpPosition: ${_this.popUpPosition})';
}


}

/// @nodoc
abstract mixin class $IdleEditorCopyWith<$Res>  {
  factory $IdleEditorCopyWith(IdleEditor value, $Res Function(IdleEditor) _then) = _$IdleEditorCopyWithImpl;
@useResult
$Res call({
 PopUpPositionType? popUpPosition
});




}
/// @nodoc
class _$IdleEditorCopyWithImpl<$Res>
    implements $IdleEditorCopyWith<$Res> {
  _$IdleEditorCopyWithImpl(this._self, this._then);

  final IdleEditor _self;
  final $Res Function(IdleEditor) _then;

/// Create a copy of IdleEditor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? popUpPosition = freezed,}) {
  return _then(IdleEditor(
popUpPosition: freezed == popUpPosition ? _self.popUpPosition : popUpPosition // ignore: cast_nullable_to_non_nullable
as PopUpPositionType?,
  ));
}

}


/// Adds pattern-matching-related methods to [IdleEditor].
extension IdleEditorPatterns on IdleEditor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$VertexSelectMode {


/// Create a copy of VertexSelectMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VertexSelectModeCopyWith<VertexSelectMode> get copyWith => _$VertexSelectModeCopyWithImpl<VertexSelectMode>(this as VertexSelectMode, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as VertexSelectMode;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VertexSelectMode&&(identical(other.vertex, _this.vertex) || other.vertex == _this.vertex));
}


@override
int get hashCode {
  final _this = this as VertexSelectMode;
  return Object.hash(runtimeType,_this.vertex);
}

@override
String toString() {
  final _this = this as VertexSelectMode;
  return 'VertexSelectMode(vertex: ${_this.vertex})';
}


}

/// @nodoc
abstract mixin class $VertexSelectModeCopyWith<$Res> implements $IdleEditorCopyWith<$Res> {
  factory $VertexSelectModeCopyWith(VertexSelectMode value, $Res Function(VertexSelectMode) _then) = _$VertexSelectModeCopyWithImpl;
@useResult
$Res call({
 MapVertex vertex
});




}
/// @nodoc
class _$VertexSelectModeCopyWithImpl<$Res>
    implements $VertexSelectModeCopyWith<$Res> {
  _$VertexSelectModeCopyWithImpl(this._self, this._then);

  final VertexSelectMode _self;
  final $Res Function(VertexSelectMode) _then;

/// Create a copy of VertexSelectMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vertex = null,}) {
  return _then(VertexSelectMode(
vertex: null == vertex ? _self.vertex : vertex // ignore: cast_nullable_to_non_nullable
as MapVertex,
  ));
}

}


/// Adds pattern-matching-related methods to [VertexSelectMode].
extension VertexSelectModePatterns on VertexSelectMode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$SegmentSelectMode {


/// Create a copy of SegmentSelectMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentSelectModeCopyWith<SegmentSelectMode> get copyWith => _$SegmentSelectModeCopyWithImpl<SegmentSelectMode>(this as SegmentSelectMode, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SegmentSelectMode;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentSelectMode&&(identical(other.segment, _this.segment) || other.segment == _this.segment));
}


@override
int get hashCode {
  final _this = this as SegmentSelectMode;
  return Object.hash(runtimeType,_this.segment);
}

@override
String toString() {
  final _this = this as SegmentSelectMode;
  return 'SegmentSelectMode(segment: ${_this.segment})';
}


}

/// @nodoc
abstract mixin class $SegmentSelectModeCopyWith<$Res> implements $IdleEditorCopyWith<$Res> {
  factory $SegmentSelectModeCopyWith(SegmentSelectMode value, $Res Function(SegmentSelectMode) _then) = _$SegmentSelectModeCopyWithImpl;
@useResult
$Res call({
 MapSegment segment
});




}
/// @nodoc
class _$SegmentSelectModeCopyWithImpl<$Res>
    implements $SegmentSelectModeCopyWith<$Res> {
  _$SegmentSelectModeCopyWithImpl(this._self, this._then);

  final SegmentSelectMode _self;
  final $Res Function(SegmentSelectMode) _then;

/// Create a copy of SegmentSelectMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? segment = null,}) {
  return _then(SegmentSelectMode(
segment: null == segment ? _self.segment : segment // ignore: cast_nullable_to_non_nullable
as MapSegment,
  ));
}

}


/// Adds pattern-matching-related methods to [SegmentSelectMode].
extension SegmentSelectModePatterns on SegmentSelectMode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
