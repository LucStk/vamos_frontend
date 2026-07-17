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
mixin _$SegmentRemoteModel {

 SegmentId get id; VertexId get startVertexId; VertexId get endVertexId; Geometry get geometry; MobilityType get mobilityType;
/// Create a copy of SegmentRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentRemoteModelCopyWith<SegmentRemoteModel> get copyWith => _$SegmentRemoteModelCopyWithImpl<SegmentRemoteModel>(this as SegmentRemoteModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.startVertexId, startVertexId) || other.startVertexId == startVertexId)&&(identical(other.endVertexId, endVertexId) || other.endVertexId == endVertexId)&&const DeepCollectionEquality().equals(other.geometry, geometry)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType));
}


@override
int get hashCode => Object.hash(runtimeType,id,startVertexId,endVertexId,const DeepCollectionEquality().hash(geometry),mobilityType);

@override
String toString() {
  return 'SegmentRemoteModel(id: $id, startVertexId: $startVertexId, endVertexId: $endVertexId, geometry: $geometry, mobilityType: $mobilityType)';
}


}

/// @nodoc
abstract mixin class $SegmentRemoteModelCopyWith<$Res>  {
  factory $SegmentRemoteModelCopyWith(SegmentRemoteModel value, $Res Function(SegmentRemoteModel) _then) = _$SegmentRemoteModelCopyWithImpl;
@useResult
$Res call({
 SegmentId id, VertexId startVertexId, VertexId endVertexId, Geometry geometry, MobilityType mobilityType
});




}
/// @nodoc
class _$SegmentRemoteModelCopyWithImpl<$Res>
    implements $SegmentRemoteModelCopyWith<$Res> {
  _$SegmentRemoteModelCopyWithImpl(this._self, this._then);

  final SegmentRemoteModel _self;
  final $Res Function(SegmentRemoteModel) _then;

/// Create a copy of SegmentRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startVertexId = null,Object? endVertexId = null,Object? geometry = null,Object? mobilityType = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SegmentId,startVertexId: null == startVertexId ? _self.startVertexId : startVertexId // ignore: cast_nullable_to_non_nullable
as VertexId,endVertexId: null == endVertexId ? _self.endVertexId : endVertexId // ignore: cast_nullable_to_non_nullable
as VertexId,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as Geometry,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,
  ));
}

}


/// Adds pattern-matching-related methods to [SegmentRemoteModel].
extension SegmentRemoteModelPatterns on SegmentRemoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SegmentRemoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SegmentRemoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SegmentRemoteModel value)  $default,){
final _that = this;
switch (_that) {
case _SegmentRemoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SegmentRemoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _SegmentRemoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SegmentId id,  VertexId startVertexId,  VertexId endVertexId,  Geometry geometry,  MobilityType mobilityType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SegmentRemoteModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SegmentId id,  VertexId startVertexId,  VertexId endVertexId,  Geometry geometry,  MobilityType mobilityType)  $default,) {final _that = this;
switch (_that) {
case _SegmentRemoteModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SegmentId id,  VertexId startVertexId,  VertexId endVertexId,  Geometry geometry,  MobilityType mobilityType)?  $default,) {final _that = this;
switch (_that) {
case _SegmentRemoteModel() when $default != null:
return $default(_that.id,_that.startVertexId,_that.endVertexId,_that.geometry,_that.mobilityType);case _:
  return null;

}
}

}

/// @nodoc


class _SegmentRemoteModel extends SegmentRemoteModel {
  const _SegmentRemoteModel({required this.id, required this.startVertexId, required this.endVertexId, required final  Geometry geometry, this.mobilityType = MobilityType.bike}): _geometry = geometry,super._();
  

@override final  SegmentId id;
@override final  VertexId startVertexId;
@override final  VertexId endVertexId;
 final  Geometry _geometry;
@override Geometry get geometry {
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometry);
}

@override@JsonKey() final  MobilityType mobilityType;

/// Create a copy of SegmentRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SegmentRemoteModelCopyWith<_SegmentRemoteModel> get copyWith => __$SegmentRemoteModelCopyWithImpl<_SegmentRemoteModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SegmentRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.startVertexId, startVertexId) || other.startVertexId == startVertexId)&&(identical(other.endVertexId, endVertexId) || other.endVertexId == endVertexId)&&const DeepCollectionEquality().equals(other._geometry, _geometry)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType));
}


@override
int get hashCode => Object.hash(runtimeType,id,startVertexId,endVertexId,const DeepCollectionEquality().hash(_geometry),mobilityType);

@override
String toString() {
  return 'SegmentRemoteModel(id: $id, startVertexId: $startVertexId, endVertexId: $endVertexId, geometry: $geometry, mobilityType: $mobilityType)';
}


}

/// @nodoc
abstract mixin class _$SegmentRemoteModelCopyWith<$Res> implements $SegmentRemoteModelCopyWith<$Res> {
  factory _$SegmentRemoteModelCopyWith(_SegmentRemoteModel value, $Res Function(_SegmentRemoteModel) _then) = __$SegmentRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 SegmentId id, VertexId startVertexId, VertexId endVertexId, Geometry geometry, MobilityType mobilityType
});




}
/// @nodoc
class __$SegmentRemoteModelCopyWithImpl<$Res>
    implements _$SegmentRemoteModelCopyWith<$Res> {
  __$SegmentRemoteModelCopyWithImpl(this._self, this._then);

  final _SegmentRemoteModel _self;
  final $Res Function(_SegmentRemoteModel) _then;

/// Create a copy of SegmentRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startVertexId = null,Object? endVertexId = null,Object? geometry = null,Object? mobilityType = null,}) {
  return _then(_SegmentRemoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SegmentId,startVertexId: null == startVertexId ? _self.startVertexId : startVertexId // ignore: cast_nullable_to_non_nullable
as VertexId,endVertexId: null == endVertexId ? _self.endVertexId : endVertexId // ignore: cast_nullable_to_non_nullable
as VertexId,geometry: null == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as Geometry,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,
  ));
}


}

/// @nodoc
mixin _$SegmentPatchModel {

 SegmentId get id; VertexId get startVertexId; VertexId get endVertexId; Geometry get geometry; MobilityType get mobilityType; bool get recomputing; Object? get error;
/// Create a copy of SegmentPatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentPatchModelCopyWith<SegmentPatchModel> get copyWith => _$SegmentPatchModelCopyWithImpl<SegmentPatchModel>(this as SegmentPatchModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentPatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.startVertexId, startVertexId) || other.startVertexId == startVertexId)&&(identical(other.endVertexId, endVertexId) || other.endVertexId == endVertexId)&&const DeepCollectionEquality().equals(other.geometry, geometry)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,id,startVertexId,endVertexId,const DeepCollectionEquality().hash(geometry),mobilityType,recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'SegmentPatchModel(id: $id, startVertexId: $startVertexId, endVertexId: $endVertexId, geometry: $geometry, mobilityType: $mobilityType, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class $SegmentPatchModelCopyWith<$Res>  {
  factory $SegmentPatchModelCopyWith(SegmentPatchModel value, $Res Function(SegmentPatchModel) _then) = _$SegmentPatchModelCopyWithImpl;
@useResult
$Res call({
 SegmentId id, VertexId startVertexId, VertexId endVertexId, Geometry geometry, MobilityType mobilityType, bool recomputing, Object? error
});




}
/// @nodoc
class _$SegmentPatchModelCopyWithImpl<$Res>
    implements $SegmentPatchModelCopyWith<$Res> {
  _$SegmentPatchModelCopyWithImpl(this._self, this._then);

  final SegmentPatchModel _self;
  final $Res Function(SegmentPatchModel) _then;

/// Create a copy of SegmentPatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startVertexId = null,Object? endVertexId = null,Object? geometry = null,Object? mobilityType = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SegmentId,startVertexId: null == startVertexId ? _self.startVertexId : startVertexId // ignore: cast_nullable_to_non_nullable
as VertexId,endVertexId: null == endVertexId ? _self.endVertexId : endVertexId // ignore: cast_nullable_to_non_nullable
as VertexId,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as Geometry,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [SegmentPatchModel].
extension SegmentPatchModelPatterns on SegmentPatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SegmentPatchModel value)?  internal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SegmentPatchModel() when internal != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SegmentPatchModel value)  internal,}){
final _that = this;
switch (_that) {
case _SegmentPatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SegmentPatchModel value)?  internal,}){
final _that = this;
switch (_that) {
case _SegmentPatchModel() when internal != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SegmentId id,  VertexId startVertexId,  VertexId endVertexId,  Geometry geometry,  MobilityType mobilityType,  bool recomputing,  Object? error)?  internal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SegmentPatchModel() when internal != null:
return internal(_that.id,_that.startVertexId,_that.endVertexId,_that.geometry,_that.mobilityType,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SegmentId id,  VertexId startVertexId,  VertexId endVertexId,  Geometry geometry,  MobilityType mobilityType,  bool recomputing,  Object? error)  internal,}) {final _that = this;
switch (_that) {
case _SegmentPatchModel():
return internal(_that.id,_that.startVertexId,_that.endVertexId,_that.geometry,_that.mobilityType,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SegmentId id,  VertexId startVertexId,  VertexId endVertexId,  Geometry geometry,  MobilityType mobilityType,  bool recomputing,  Object? error)?  internal,}) {final _that = this;
switch (_that) {
case _SegmentPatchModel() when internal != null:
return internal(_that.id,_that.startVertexId,_that.endVertexId,_that.geometry,_that.mobilityType,_that.recomputing,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SegmentPatchModel extends SegmentPatchModel implements Patch<SegmentRemoteModel> {
  const _SegmentPatchModel({required this.id, required this.startVertexId, required this.endVertexId, required final  Geometry geometry, this.mobilityType = MobilityType.bike, this.recomputing = false, this.error}): _geometry = geometry,super._();
  

@override final  SegmentId id;
@override final  VertexId startVertexId;
@override final  VertexId endVertexId;
 final  Geometry _geometry;
@override Geometry get geometry {
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometry);
}

@override@JsonKey() final  MobilityType mobilityType;
@override@JsonKey() final  bool recomputing;
@override final  Object? error;

/// Create a copy of SegmentPatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SegmentPatchModelCopyWith<_SegmentPatchModel> get copyWith => __$SegmentPatchModelCopyWithImpl<_SegmentPatchModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SegmentPatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.startVertexId, startVertexId) || other.startVertexId == startVertexId)&&(identical(other.endVertexId, endVertexId) || other.endVertexId == endVertexId)&&const DeepCollectionEquality().equals(other._geometry, _geometry)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,id,startVertexId,endVertexId,const DeepCollectionEquality().hash(_geometry),mobilityType,recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'SegmentPatchModel.internal(id: $id, startVertexId: $startVertexId, endVertexId: $endVertexId, geometry: $geometry, mobilityType: $mobilityType, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SegmentPatchModelCopyWith<$Res> implements $SegmentPatchModelCopyWith<$Res> {
  factory _$SegmentPatchModelCopyWith(_SegmentPatchModel value, $Res Function(_SegmentPatchModel) _then) = __$SegmentPatchModelCopyWithImpl;
@override @useResult
$Res call({
 SegmentId id, VertexId startVertexId, VertexId endVertexId, Geometry geometry, MobilityType mobilityType, bool recomputing, Object? error
});




}
/// @nodoc
class __$SegmentPatchModelCopyWithImpl<$Res>
    implements _$SegmentPatchModelCopyWith<$Res> {
  __$SegmentPatchModelCopyWithImpl(this._self, this._then);

  final _SegmentPatchModel _self;
  final $Res Function(_SegmentPatchModel) _then;

/// Create a copy of SegmentPatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startVertexId = null,Object? endVertexId = null,Object? geometry = null,Object? mobilityType = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_SegmentPatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SegmentId,startVertexId: null == startVertexId ? _self.startVertexId : startVertexId // ignore: cast_nullable_to_non_nullable
as VertexId,endVertexId: null == endVertexId ? _self.endVertexId : endVertexId // ignore: cast_nullable_to_non_nullable
as VertexId,geometry: null == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as Geometry,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
