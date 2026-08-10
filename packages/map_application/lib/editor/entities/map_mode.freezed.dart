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
mixin _$RouteCorrection {

 LatLng get grabPoint;// point sur le tracé où le grab a commencé
 List<LatLng> get path;// tracé en cours de la correction
 bool get armed; VertexId? get rejoinedVertex;
/// Create a copy of RouteCorrection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteCorrectionCopyWith<RouteCorrection> get copyWith => _$RouteCorrectionCopyWithImpl<RouteCorrection>(this as RouteCorrection, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteCorrection&&(identical(other.grabPoint, grabPoint) || other.grabPoint == grabPoint)&&const DeepCollectionEquality().equals(other.path, path)&&(identical(other.armed, armed) || other.armed == armed)&&(identical(other.rejoinedVertex, rejoinedVertex) || other.rejoinedVertex == rejoinedVertex));
}


@override
int get hashCode => Object.hash(runtimeType,grabPoint,const DeepCollectionEquality().hash(path),armed,rejoinedVertex);

@override
String toString() {
  return 'RouteCorrection(grabPoint: $grabPoint, path: $path, armed: $armed, rejoinedVertex: $rejoinedVertex)';
}


}

/// @nodoc
abstract mixin class $RouteCorrectionCopyWith<$Res>  {
  factory $RouteCorrectionCopyWith(RouteCorrection value, $Res Function(RouteCorrection) _then) = _$RouteCorrectionCopyWithImpl;
@useResult
$Res call({
 LatLng grabPoint, List<LatLng> path, bool armed, VertexId? rejoinedVertex
});




}
/// @nodoc
class _$RouteCorrectionCopyWithImpl<$Res>
    implements $RouteCorrectionCopyWith<$Res> {
  _$RouteCorrectionCopyWithImpl(this._self, this._then);

  final RouteCorrection _self;
  final $Res Function(RouteCorrection) _then;

/// Create a copy of RouteCorrection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? grabPoint = null,Object? path = null,Object? armed = null,Object? rejoinedVertex = freezed,}) {
  return _then(_self.copyWith(
grabPoint: null == grabPoint ? _self.grabPoint : grabPoint // ignore: cast_nullable_to_non_nullable
as LatLng,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as List<LatLng>,armed: null == armed ? _self.armed : armed // ignore: cast_nullable_to_non_nullable
as bool,rejoinedVertex: freezed == rejoinedVertex ? _self.rejoinedVertex : rejoinedVertex // ignore: cast_nullable_to_non_nullable
as VertexId?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteCorrection].
extension RouteCorrectionPatterns on RouteCorrection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteCorrection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteCorrection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteCorrection value)  $default,){
final _that = this;
switch (_that) {
case _RouteCorrection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteCorrection value)?  $default,){
final _that = this;
switch (_that) {
case _RouteCorrection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LatLng grabPoint,  List<LatLng> path,  bool armed,  VertexId? rejoinedVertex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteCorrection() when $default != null:
return $default(_that.grabPoint,_that.path,_that.armed,_that.rejoinedVertex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LatLng grabPoint,  List<LatLng> path,  bool armed,  VertexId? rejoinedVertex)  $default,) {final _that = this;
switch (_that) {
case _RouteCorrection():
return $default(_that.grabPoint,_that.path,_that.armed,_that.rejoinedVertex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LatLng grabPoint,  List<LatLng> path,  bool armed,  VertexId? rejoinedVertex)?  $default,) {final _that = this;
switch (_that) {
case _RouteCorrection() when $default != null:
return $default(_that.grabPoint,_that.path,_that.armed,_that.rejoinedVertex);case _:
  return null;

}
}

}

/// @nodoc


class _RouteCorrection implements RouteCorrection {
  const _RouteCorrection({required this.grabPoint, required final  List<LatLng> path, this.armed = false, this.rejoinedVertex}): _path = path;


@override final  LatLng grabPoint;
// point sur le tracé où le grab a commencé
 final  List<LatLng> _path;
// point sur le tracé où le grab a commencé
@override List<LatLng> get path {
  if (_path is EqualUnmodifiableListView) return _path;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_path);
}

// tracé en cours de la correction
@override@JsonKey() final  bool armed;
@override final  VertexId? rejoinedVertex;

/// Create a copy of RouteCorrection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteCorrectionCopyWith<_RouteCorrection> get copyWith => __$RouteCorrectionCopyWithImpl<_RouteCorrection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteCorrection&&(identical(other.grabPoint, grabPoint) || other.grabPoint == grabPoint)&&const DeepCollectionEquality().equals(other._path, _path)&&(identical(other.armed, armed) || other.armed == armed)&&(identical(other.rejoinedVertex, rejoinedVertex) || other.rejoinedVertex == rejoinedVertex));
}


@override
int get hashCode => Object.hash(runtimeType,grabPoint,const DeepCollectionEquality().hash(_path),armed,rejoinedVertex);

@override
String toString() {
  return 'RouteCorrection(grabPoint: $grabPoint, path: $path, armed: $armed, rejoinedVertex: $rejoinedVertex)';
}


}

/// @nodoc
abstract mixin class _$RouteCorrectionCopyWith<$Res> implements $RouteCorrectionCopyWith<$Res> {
  factory _$RouteCorrectionCopyWith(_RouteCorrection value, $Res Function(_RouteCorrection) _then) = __$RouteCorrectionCopyWithImpl;
@override @useResult
$Res call({
 LatLng grabPoint, List<LatLng> path, bool armed, VertexId? rejoinedVertex
});




}
/// @nodoc
class __$RouteCorrectionCopyWithImpl<$Res>
    implements _$RouteCorrectionCopyWith<$Res> {
  __$RouteCorrectionCopyWithImpl(this._self, this._then);

  final _RouteCorrection _self;
  final $Res Function(_RouteCorrection) _then;

/// Create a copy of RouteCorrection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? grabPoint = null,Object? path = null,Object? armed = null,Object? rejoinedVertex = freezed,}) {
  return _then(_RouteCorrection(
grabPoint: null == grabPoint ? _self.grabPoint : grabPoint // ignore: cast_nullable_to_non_nullable
as LatLng,path: null == path ? _self._path : path // ignore: cast_nullable_to_non_nullable
as List<LatLng>,armed: null == armed ? _self.armed : armed // ignore: cast_nullable_to_non_nullable
as bool,rejoinedVertex: freezed == rejoinedVertex ? _self.rejoinedVertex : rejoinedVertex // ignore: cast_nullable_to_non_nullable
as VertexId?,
  ));
}


}

/// @nodoc
mixin _$SketchMode {

 List<LatLng> get itineraire; MobilityType get mobilityType; VertexId? get touchedVertex; RouteCorrection? get correction;
/// Create a copy of SketchMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SketchModeCopyWith<SketchMode> get copyWith => _$SketchModeCopyWithImpl<SketchMode>(this as SketchMode, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SketchMode&&const DeepCollectionEquality().equals(other.itineraire, itineraire)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType)&&(identical(other.touchedVertex, touchedVertex) || other.touchedVertex == touchedVertex)&&(identical(other.correction, correction) || other.correction == correction));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(itineraire),mobilityType,touchedVertex,correction);

@override
String toString() {
  return 'SketchMode(itineraire: $itineraire, mobilityType: $mobilityType, touchedVertex: $touchedVertex, correction: $correction)';
}


}

/// @nodoc
abstract mixin class $SketchModeCopyWith<$Res>  {
  factory $SketchModeCopyWith(SketchMode value, $Res Function(SketchMode) _then) = _$SketchModeCopyWithImpl;
@useResult
$Res call({
 List<LatLng> itineraire, MobilityType mobilityType, Id<VertexFields>? touchedVertex, RouteCorrection? correction
});


$RouteCorrectionCopyWith<$Res>? get correction;

}
/// @nodoc
class _$SketchModeCopyWithImpl<$Res>
    implements $SketchModeCopyWith<$Res> {
  _$SketchModeCopyWithImpl(this._self, this._then);

  final SketchMode _self;
  final $Res Function(SketchMode) _then;

/// Create a copy of SketchMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itineraire = null,Object? mobilityType = null,Object? touchedVertex = freezed,Object? correction = freezed,}) {
  return _then(_self.copyWith(
itineraire: null == itineraire ? _self.itineraire : itineraire // ignore: cast_nullable_to_non_nullable
as List<LatLng>,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,touchedVertex: freezed == touchedVertex ? _self.touchedVertex : touchedVertex // ignore: cast_nullable_to_non_nullable
as Id<VertexFields>?,correction: freezed == correction ? _self.correction : correction // ignore: cast_nullable_to_non_nullable
as RouteCorrection?,
  ));
}
/// Create a copy of SketchMode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteCorrectionCopyWith<$Res>? get correction {
    if (_self.correction == null) {
    return null;
  }

  return $RouteCorrectionCopyWith<$Res>(_self.correction!, (value) {
    return _then(_self.copyWith(correction: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( VertexId vertexStart,  List<LatLng> itineraire,  MobilityType mobilityType,  VertexId? touchedVertex,  RouteCorrection? correction)?  creation,TResult Function( SegmentId segmentId,  List<LatLng> itineraire,  MobilityType mobilityType,  VertexId? touchedVertex,  RouteCorrection? correction)?  edition,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SketchCreation() when creation != null:
return creation(_that.vertexStart,_that.itineraire,_that.mobilityType,_that.touchedVertex,_that.correction);case SketchEdition() when edition != null:
return edition(_that.segmentId,_that.itineraire,_that.mobilityType,_that.touchedVertex,_that.correction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( VertexId vertexStart,  List<LatLng> itineraire,  MobilityType mobilityType,  VertexId? touchedVertex,  RouteCorrection? correction)  creation,required TResult Function( SegmentId segmentId,  List<LatLng> itineraire,  MobilityType mobilityType,  VertexId? touchedVertex,  RouteCorrection? correction)  edition,}) {final _that = this;
switch (_that) {
case SketchCreation():
return creation(_that.vertexStart,_that.itineraire,_that.mobilityType,_that.touchedVertex,_that.correction);case SketchEdition():
return edition(_that.segmentId,_that.itineraire,_that.mobilityType,_that.touchedVertex,_that.correction);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( VertexId vertexStart,  List<LatLng> itineraire,  MobilityType mobilityType,  VertexId? touchedVertex,  RouteCorrection? correction)?  creation,TResult? Function( SegmentId segmentId,  List<LatLng> itineraire,  MobilityType mobilityType,  VertexId? touchedVertex,  RouteCorrection? correction)?  edition,}) {final _that = this;
switch (_that) {
case SketchCreation() when creation != null:
return creation(_that.vertexStart,_that.itineraire,_that.mobilityType,_that.touchedVertex,_that.correction);case SketchEdition() when edition != null:
return edition(_that.segmentId,_that.itineraire,_that.mobilityType,_that.touchedVertex,_that.correction);case _:
  return null;

}
}

}

/// @nodoc


class SketchCreation extends SketchMode {
  const SketchCreation({required this.vertexStart, required final  List<LatLng> itineraire, required this.mobilityType, this.touchedVertex, this.correction}): _itineraire = itineraire,super._();


 final  VertexId vertexStart;
 final  List<LatLng> _itineraire;
@override List<LatLng> get itineraire {
  if (_itineraire is EqualUnmodifiableListView) return _itineraire;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itineraire);
}

@override final  MobilityType mobilityType;
@override final  VertexId? touchedVertex;
@override final  RouteCorrection? correction;

/// Create a copy of SketchMode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SketchCreationCopyWith<SketchCreation> get copyWith => _$SketchCreationCopyWithImpl<SketchCreation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SketchCreation&&(identical(other.vertexStart, vertexStart) || other.vertexStart == vertexStart)&&const DeepCollectionEquality().equals(other._itineraire, _itineraire)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType)&&(identical(other.touchedVertex, touchedVertex) || other.touchedVertex == touchedVertex)&&(identical(other.correction, correction) || other.correction == correction));
}


@override
int get hashCode => Object.hash(runtimeType,vertexStart,const DeepCollectionEquality().hash(_itineraire),mobilityType,touchedVertex,correction);

@override
String toString() {
  return 'SketchMode.creation(vertexStart: $vertexStart, itineraire: $itineraire, mobilityType: $mobilityType, touchedVertex: $touchedVertex, correction: $correction)';
}


}

/// @nodoc
abstract mixin class $SketchCreationCopyWith<$Res> implements $SketchModeCopyWith<$Res> {
  factory $SketchCreationCopyWith(SketchCreation value, $Res Function(SketchCreation) _then) = _$SketchCreationCopyWithImpl;
@override @useResult
$Res call({
 VertexId vertexStart, List<LatLng> itineraire, MobilityType mobilityType, VertexId? touchedVertex, RouteCorrection? correction
});


@override $RouteCorrectionCopyWith<$Res>? get correction;

}
/// @nodoc
class _$SketchCreationCopyWithImpl<$Res>
    implements $SketchCreationCopyWith<$Res> {
  _$SketchCreationCopyWithImpl(this._self, this._then);

  final SketchCreation _self;
  final $Res Function(SketchCreation) _then;

/// Create a copy of SketchMode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vertexStart = null,Object? itineraire = null,Object? mobilityType = null,Object? touchedVertex = freezed,Object? correction = freezed,}) {
  return _then(SketchCreation(
vertexStart: null == vertexStart ? _self.vertexStart : vertexStart // ignore: cast_nullable_to_non_nullable
as VertexId,itineraire: null == itineraire ? _self._itineraire : itineraire // ignore: cast_nullable_to_non_nullable
as List<LatLng>,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,touchedVertex: freezed == touchedVertex ? _self.touchedVertex : touchedVertex // ignore: cast_nullable_to_non_nullable
as VertexId?,correction: freezed == correction ? _self.correction : correction // ignore: cast_nullable_to_non_nullable
as RouteCorrection?,
  ));
}

/// Create a copy of SketchMode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteCorrectionCopyWith<$Res>? get correction {
    if (_self.correction == null) {
    return null;
  }

  return $RouteCorrectionCopyWith<$Res>(_self.correction!, (value) {
    return _then(_self.copyWith(correction: value));
  });
}
}

/// @nodoc


class SketchEdition extends SketchMode {
  const SketchEdition({required this.segmentId, required final  List<LatLng> itineraire, required this.mobilityType, this.touchedVertex, this.correction}): _itineraire = itineraire,super._();


 final  SegmentId segmentId;
 final  List<LatLng> _itineraire;
@override List<LatLng> get itineraire {
  if (_itineraire is EqualUnmodifiableListView) return _itineraire;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itineraire);
}

@override final  MobilityType mobilityType;
@override final  VertexId? touchedVertex;
@override final  RouteCorrection? correction;

/// Create a copy of SketchMode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SketchEditionCopyWith<SketchEdition> get copyWith => _$SketchEditionCopyWithImpl<SketchEdition>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SketchEdition&&(identical(other.segmentId, segmentId) || other.segmentId == segmentId)&&const DeepCollectionEquality().equals(other._itineraire, _itineraire)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType)&&(identical(other.touchedVertex, touchedVertex) || other.touchedVertex == touchedVertex)&&(identical(other.correction, correction) || other.correction == correction));
}


@override
int get hashCode => Object.hash(runtimeType,segmentId,const DeepCollectionEquality().hash(_itineraire),mobilityType,touchedVertex,correction);

@override
String toString() {
  return 'SketchMode.edition(segmentId: $segmentId, itineraire: $itineraire, mobilityType: $mobilityType, touchedVertex: $touchedVertex, correction: $correction)';
}


}

/// @nodoc
abstract mixin class $SketchEditionCopyWith<$Res> implements $SketchModeCopyWith<$Res> {
  factory $SketchEditionCopyWith(SketchEdition value, $Res Function(SketchEdition) _then) = _$SketchEditionCopyWithImpl;
@override @useResult
$Res call({
 SegmentId segmentId, List<LatLng> itineraire, MobilityType mobilityType, VertexId? touchedVertex, RouteCorrection? correction
});


@override $RouteCorrectionCopyWith<$Res>? get correction;

}
/// @nodoc
class _$SketchEditionCopyWithImpl<$Res>
    implements $SketchEditionCopyWith<$Res> {
  _$SketchEditionCopyWithImpl(this._self, this._then);

  final SketchEdition _self;
  final $Res Function(SketchEdition) _then;

/// Create a copy of SketchMode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? segmentId = null,Object? itineraire = null,Object? mobilityType = null,Object? touchedVertex = freezed,Object? correction = freezed,}) {
  return _then(SketchEdition(
segmentId: null == segmentId ? _self.segmentId : segmentId // ignore: cast_nullable_to_non_nullable
as SegmentId,itineraire: null == itineraire ? _self._itineraire : itineraire // ignore: cast_nullable_to_non_nullable
as List<LatLng>,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,touchedVertex: freezed == touchedVertex ? _self.touchedVertex : touchedVertex // ignore: cast_nullable_to_non_nullable
as VertexId?,correction: freezed == correction ? _self.correction : correction // ignore: cast_nullable_to_non_nullable
as RouteCorrection?,
  ));
}

/// Create a copy of SketchMode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteCorrectionCopyWith<$Res>? get correction {
    if (_self.correction == null) {
    return null;
  }

  return $RouteCorrectionCopyWith<$Res>(_self.correction!, (value) {
    return _then(_self.copyWith(correction: value));
  });
}
}

// dart format on
