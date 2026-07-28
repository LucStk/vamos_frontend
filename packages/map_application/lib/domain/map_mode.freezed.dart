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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Idle value)?  idle,TResult Function( Sketch value)?  sketchMode,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case Sketch() when sketchMode != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Idle value)  idle,required TResult Function( Sketch value)  sketchMode,}){
final _that = this;
switch (_that) {
case Idle():
return idle(_that);case Sketch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Idle value)?  idle,TResult? Function( Sketch value)?  sketchMode,}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case Sketch() when sketchMode != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( VertexId vertexStart,  List<LatLng> itineraire,  MobilityType mobilityType,  VertexId? touchedVertex)?  sketchMode,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case Sketch() when sketchMode != null:
return sketchMode(_that.vertexStart,_that.itineraire,_that.mobilityType,_that.touchedVertex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( VertexId vertexStart,  List<LatLng> itineraire,  MobilityType mobilityType,  VertexId? touchedVertex)  sketchMode,}) {final _that = this;
switch (_that) {
case Idle():
return idle();case Sketch():
return sketchMode(_that.vertexStart,_that.itineraire,_that.mobilityType,_that.touchedVertex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( VertexId vertexStart,  List<LatLng> itineraire,  MobilityType mobilityType,  VertexId? touchedVertex)?  sketchMode,}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case Sketch() when sketchMode != null:
return sketchMode(_that.vertexStart,_that.itineraire,_that.mobilityType,_that.touchedVertex);case _:
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


class Sketch implements MapMode {
  const Sketch({required this.vertexStart, required final  List<LatLng> itineraire, required this.mobilityType, this.touchedVertex}): _itineraire = itineraire;
  

 final  VertexId vertexStart;
 final  List<LatLng> _itineraire;
 List<LatLng> get itineraire {
  if (_itineraire is EqualUnmodifiableListView) return _itineraire;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itineraire);
}

 final  MobilityType mobilityType;
 final  VertexId? touchedVertex;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SketchCopyWith<Sketch> get copyWith => _$SketchCopyWithImpl<Sketch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sketch&&(identical(other.vertexStart, vertexStart) || other.vertexStart == vertexStart)&&const DeepCollectionEquality().equals(other._itineraire, _itineraire)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType)&&(identical(other.touchedVertex, touchedVertex) || other.touchedVertex == touchedVertex));
}


@override
int get hashCode => Object.hash(runtimeType,vertexStart,const DeepCollectionEquality().hash(_itineraire),mobilityType,touchedVertex);

@override
String toString() {
  return 'MapMode.sketchMode(vertexStart: $vertexStart, itineraire: $itineraire, mobilityType: $mobilityType, touchedVertex: $touchedVertex)';
}


}

/// @nodoc
abstract mixin class $SketchCopyWith<$Res> implements $MapModeCopyWith<$Res> {
  factory $SketchCopyWith(Sketch value, $Res Function(Sketch) _then) = _$SketchCopyWithImpl;
@useResult
$Res call({
 VertexId vertexStart, List<LatLng> itineraire, MobilityType mobilityType, VertexId? touchedVertex
});




}
/// @nodoc
class _$SketchCopyWithImpl<$Res>
    implements $SketchCopyWith<$Res> {
  _$SketchCopyWithImpl(this._self, this._then);

  final Sketch _self;
  final $Res Function(Sketch) _then;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vertexStart = null,Object? itineraire = null,Object? mobilityType = null,Object? touchedVertex = freezed,}) {
  return _then(Sketch(
vertexStart: null == vertexStart ? _self.vertexStart : vertexStart // ignore: cast_nullable_to_non_nullable
as VertexId,itineraire: null == itineraire ? _self._itineraire : itineraire // ignore: cast_nullable_to_non_nullable
as List<LatLng>,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,touchedVertex: freezed == touchedVertex ? _self.touchedVertex : touchedVertex // ignore: cast_nullable_to_non_nullable
as VertexId?,
  ));
}


}

// dart format on
