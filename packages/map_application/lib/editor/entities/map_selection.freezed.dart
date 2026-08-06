// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NoSelection value)?  none,TResult Function( VertexSelection value)?  vertex,TResult Function( SegmentSelection value)?  segment,TResult Function( CursorSelection value)?  cursor,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NoSelection() when none != null:
return none(_that);case VertexSelection() when vertex != null:
return vertex(_that);case SegmentSelection() when segment != null:
return segment(_that);case CursorSelection() when cursor != null:
return cursor(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NoSelection value)  none,required TResult Function( VertexSelection value)  vertex,required TResult Function( SegmentSelection value)  segment,required TResult Function( CursorSelection value)  cursor,}){
final _that = this;
switch (_that) {
case NoSelection():
return none(_that);case VertexSelection():
return vertex(_that);case SegmentSelection():
return segment(_that);case CursorSelection():
return cursor(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NoSelection value)?  none,TResult? Function( VertexSelection value)?  vertex,TResult? Function( SegmentSelection value)?  segment,TResult? Function( CursorSelection value)?  cursor,}){
final _that = this;
switch (_that) {
case NoSelection() when none != null:
return none(_that);case VertexSelection() when vertex != null:
return vertex(_that);case SegmentSelection() when segment != null:
return segment(_that);case CursorSelection() when cursor != null:
return cursor(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function( VertexFields vertex)?  vertex,TResult Function( SegmentId segmentId)?  segment,TResult Function( LatLng latLng)?  cursor,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NoSelection() when none != null:
return none();case VertexSelection() when vertex != null:
return vertex(_that.vertex);case SegmentSelection() when segment != null:
return segment(_that.segmentId);case CursorSelection() when cursor != null:
return cursor(_that.latLng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function( VertexFields vertex)  vertex,required TResult Function( SegmentId segmentId)  segment,required TResult Function( LatLng latLng)  cursor,}) {final _that = this;
switch (_that) {
case NoSelection():
return none();case VertexSelection():
return vertex(_that.vertex);case SegmentSelection():
return segment(_that.segmentId);case CursorSelection():
return cursor(_that.latLng);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function( VertexFields vertex)?  vertex,TResult? Function( SegmentId segmentId)?  segment,TResult? Function( LatLng latLng)?  cursor,}) {final _that = this;
switch (_that) {
case NoSelection() when none != null:
return none();case VertexSelection() when vertex != null:
return vertex(_that.vertex);case SegmentSelection() when segment != null:
return segment(_that.segmentId);case CursorSelection() when cursor != null:
return cursor(_that.latLng);case _:
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
  const VertexSelection({required this.vertex});
  

 final  VertexFields vertex;

/// Create a copy of MapSelection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VertexSelectionCopyWith<VertexSelection> get copyWith => _$VertexSelectionCopyWithImpl<VertexSelection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VertexSelection&&(identical(other.vertex, vertex) || other.vertex == vertex));
}


@override
int get hashCode => Object.hash(runtimeType,vertex);

@override
String toString() {
  return 'MapSelection.vertex(vertex: $vertex)';
}


}

/// @nodoc
abstract mixin class $VertexSelectionCopyWith<$Res> implements $MapSelectionCopyWith<$Res> {
  factory $VertexSelectionCopyWith(VertexSelection value, $Res Function(VertexSelection) _then) = _$VertexSelectionCopyWithImpl;
@useResult
$Res call({
 VertexFields vertex
});




}
/// @nodoc
class _$VertexSelectionCopyWithImpl<$Res>
    implements $VertexSelectionCopyWith<$Res> {
  _$VertexSelectionCopyWithImpl(this._self, this._then);

  final VertexSelection _self;
  final $Res Function(VertexSelection) _then;

/// Create a copy of MapSelection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vertex = null,}) {
  return _then(VertexSelection(
vertex: null == vertex ? _self.vertex : vertex // ignore: cast_nullable_to_non_nullable
as VertexFields,
  ));
}


}

/// @nodoc


class SegmentSelection implements MapSelection {
  const SegmentSelection({required this.segmentId});
  

 final  SegmentId segmentId;

/// Create a copy of MapSelection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentSelectionCopyWith<SegmentSelection> get copyWith => _$SegmentSelectionCopyWithImpl<SegmentSelection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentSelection&&(identical(other.segmentId, segmentId) || other.segmentId == segmentId));
}


@override
int get hashCode => Object.hash(runtimeType,segmentId);

@override
String toString() {
  return 'MapSelection.segment(segmentId: $segmentId)';
}


}

/// @nodoc
abstract mixin class $SegmentSelectionCopyWith<$Res> implements $MapSelectionCopyWith<$Res> {
  factory $SegmentSelectionCopyWith(SegmentSelection value, $Res Function(SegmentSelection) _then) = _$SegmentSelectionCopyWithImpl;
@useResult
$Res call({
 SegmentId segmentId
});




}
/// @nodoc
class _$SegmentSelectionCopyWithImpl<$Res>
    implements $SegmentSelectionCopyWith<$Res> {
  _$SegmentSelectionCopyWithImpl(this._self, this._then);

  final SegmentSelection _self;
  final $Res Function(SegmentSelection) _then;

/// Create a copy of MapSelection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? segmentId = null,}) {
  return _then(SegmentSelection(
segmentId: null == segmentId ? _self.segmentId : segmentId // ignore: cast_nullable_to_non_nullable
as SegmentId,
  ));
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

// dart format on
