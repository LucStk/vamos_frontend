// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waypoint_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WaypointRemoteModel {

 WaypointId get id; VertexId get vertexId; String get title; PoiCategory get poiCategory; String get description;
/// Create a copy of WaypointRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaypointRemoteModelCopyWith<WaypointRemoteModel> get copyWith => _$WaypointRemoteModelCopyWithImpl<WaypointRemoteModel>(this as WaypointRemoteModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaypointRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.vertexId, vertexId) || other.vertexId == vertexId)&&(identical(other.title, title) || other.title == title)&&(identical(other.poiCategory, poiCategory) || other.poiCategory == poiCategory)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,vertexId,title,poiCategory,description);

@override
String toString() {
  return 'WaypointRemoteModel(id: $id, vertexId: $vertexId, title: $title, poiCategory: $poiCategory, description: $description)';
}


}

/// @nodoc
abstract mixin class $WaypointRemoteModelCopyWith<$Res>  {
  factory $WaypointRemoteModelCopyWith(WaypointRemoteModel value, $Res Function(WaypointRemoteModel) _then) = _$WaypointRemoteModelCopyWithImpl;
@useResult
$Res call({
 WaypointId id, VertexId vertexId, String title, PoiCategory poiCategory, String description
});




}
/// @nodoc
class _$WaypointRemoteModelCopyWithImpl<$Res>
    implements $WaypointRemoteModelCopyWith<$Res> {
  _$WaypointRemoteModelCopyWithImpl(this._self, this._then);

  final WaypointRemoteModel _self;
  final $Res Function(WaypointRemoteModel) _then;

/// Create a copy of WaypointRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vertexId = null,Object? title = null,Object? poiCategory = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as WaypointId,vertexId: null == vertexId ? _self.vertexId : vertexId // ignore: cast_nullable_to_non_nullable
as VertexId,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,poiCategory: null == poiCategory ? _self.poiCategory : poiCategory // ignore: cast_nullable_to_non_nullable
as PoiCategory,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WaypointRemoteModel].
extension WaypointRemoteModelPatterns on WaypointRemoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaypointRemoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaypointRemoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaypointRemoteModel value)  $default,){
final _that = this;
switch (_that) {
case _WaypointRemoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaypointRemoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _WaypointRemoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WaypointId id,  VertexId vertexId,  String title,  PoiCategory poiCategory,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaypointRemoteModel() when $default != null:
return $default(_that.id,_that.vertexId,_that.title,_that.poiCategory,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WaypointId id,  VertexId vertexId,  String title,  PoiCategory poiCategory,  String description)  $default,) {final _that = this;
switch (_that) {
case _WaypointRemoteModel():
return $default(_that.id,_that.vertexId,_that.title,_that.poiCategory,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WaypointId id,  VertexId vertexId,  String title,  PoiCategory poiCategory,  String description)?  $default,) {final _that = this;
switch (_that) {
case _WaypointRemoteModel() when $default != null:
return $default(_that.id,_that.vertexId,_that.title,_that.poiCategory,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _WaypointRemoteModel extends WaypointRemoteModel {
  const _WaypointRemoteModel({required this.id, required this.vertexId, this.title = '', this.poiCategory = PoiCategory.waypoint, this.description = ''}): super._();
  

@override final  WaypointId id;
@override final  VertexId vertexId;
@override@JsonKey() final  String title;
@override@JsonKey() final  PoiCategory poiCategory;
@override@JsonKey() final  String description;

/// Create a copy of WaypointRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaypointRemoteModelCopyWith<_WaypointRemoteModel> get copyWith => __$WaypointRemoteModelCopyWithImpl<_WaypointRemoteModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaypointRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.vertexId, vertexId) || other.vertexId == vertexId)&&(identical(other.title, title) || other.title == title)&&(identical(other.poiCategory, poiCategory) || other.poiCategory == poiCategory)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,vertexId,title,poiCategory,description);

@override
String toString() {
  return 'WaypointRemoteModel(id: $id, vertexId: $vertexId, title: $title, poiCategory: $poiCategory, description: $description)';
}


}

/// @nodoc
abstract mixin class _$WaypointRemoteModelCopyWith<$Res> implements $WaypointRemoteModelCopyWith<$Res> {
  factory _$WaypointRemoteModelCopyWith(_WaypointRemoteModel value, $Res Function(_WaypointRemoteModel) _then) = __$WaypointRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 WaypointId id, VertexId vertexId, String title, PoiCategory poiCategory, String description
});




}
/// @nodoc
class __$WaypointRemoteModelCopyWithImpl<$Res>
    implements _$WaypointRemoteModelCopyWith<$Res> {
  __$WaypointRemoteModelCopyWithImpl(this._self, this._then);

  final _WaypointRemoteModel _self;
  final $Res Function(_WaypointRemoteModel) _then;

/// Create a copy of WaypointRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vertexId = null,Object? title = null,Object? poiCategory = null,Object? description = null,}) {
  return _then(_WaypointRemoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as WaypointId,vertexId: null == vertexId ? _self.vertexId : vertexId // ignore: cast_nullable_to_non_nullable
as VertexId,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,poiCategory: null == poiCategory ? _self.poiCategory : poiCategory // ignore: cast_nullable_to_non_nullable
as PoiCategory,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$WaypointPatchModel {

 WaypointId get id; VertexId get vertexId; String get title; PoiCategory get poiCategory; String get description; bool get recomputing; Object? get error;
/// Create a copy of WaypointPatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaypointPatchModelCopyWith<WaypointPatchModel> get copyWith => _$WaypointPatchModelCopyWithImpl<WaypointPatchModel>(this as WaypointPatchModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaypointPatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.vertexId, vertexId) || other.vertexId == vertexId)&&(identical(other.title, title) || other.title == title)&&(identical(other.poiCategory, poiCategory) || other.poiCategory == poiCategory)&&(identical(other.description, description) || other.description == description)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,id,vertexId,title,poiCategory,description,recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'WaypointPatchModel(id: $id, vertexId: $vertexId, title: $title, poiCategory: $poiCategory, description: $description, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class $WaypointPatchModelCopyWith<$Res>  {
  factory $WaypointPatchModelCopyWith(WaypointPatchModel value, $Res Function(WaypointPatchModel) _then) = _$WaypointPatchModelCopyWithImpl;
@useResult
$Res call({
 WaypointId id, VertexId vertexId, String title, PoiCategory poiCategory, String description, bool recomputing, Object? error
});




}
/// @nodoc
class _$WaypointPatchModelCopyWithImpl<$Res>
    implements $WaypointPatchModelCopyWith<$Res> {
  _$WaypointPatchModelCopyWithImpl(this._self, this._then);

  final WaypointPatchModel _self;
  final $Res Function(WaypointPatchModel) _then;

/// Create a copy of WaypointPatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vertexId = null,Object? title = null,Object? poiCategory = null,Object? description = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as WaypointId,vertexId: null == vertexId ? _self.vertexId : vertexId // ignore: cast_nullable_to_non_nullable
as VertexId,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,poiCategory: null == poiCategory ? _self.poiCategory : poiCategory // ignore: cast_nullable_to_non_nullable
as PoiCategory,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [WaypointPatchModel].
extension WaypointPatchModelPatterns on WaypointPatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _WaypointPatchModel value)?  internal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaypointPatchModel() when internal != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _WaypointPatchModel value)  internal,}){
final _that = this;
switch (_that) {
case _WaypointPatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _WaypointPatchModel value)?  internal,}){
final _that = this;
switch (_that) {
case _WaypointPatchModel() when internal != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( WaypointId id,  VertexId vertexId,  String title,  PoiCategory poiCategory,  String description,  bool recomputing,  Object? error)?  internal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaypointPatchModel() when internal != null:
return internal(_that.id,_that.vertexId,_that.title,_that.poiCategory,_that.description,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( WaypointId id,  VertexId vertexId,  String title,  PoiCategory poiCategory,  String description,  bool recomputing,  Object? error)  internal,}) {final _that = this;
switch (_that) {
case _WaypointPatchModel():
return internal(_that.id,_that.vertexId,_that.title,_that.poiCategory,_that.description,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( WaypointId id,  VertexId vertexId,  String title,  PoiCategory poiCategory,  String description,  bool recomputing,  Object? error)?  internal,}) {final _that = this;
switch (_that) {
case _WaypointPatchModel() when internal != null:
return internal(_that.id,_that.vertexId,_that.title,_that.poiCategory,_that.description,_that.recomputing,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _WaypointPatchModel extends WaypointPatchModel implements Patch<WaypointRemoteModel> {
  const _WaypointPatchModel({required this.id, required this.vertexId, required this.title, required this.poiCategory, required this.description, required this.recomputing, this.error}): super._();
  

@override final  WaypointId id;
@override final  VertexId vertexId;
@override final  String title;
@override final  PoiCategory poiCategory;
@override final  String description;
@override final  bool recomputing;
@override final  Object? error;

/// Create a copy of WaypointPatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaypointPatchModelCopyWith<_WaypointPatchModel> get copyWith => __$WaypointPatchModelCopyWithImpl<_WaypointPatchModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaypointPatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.vertexId, vertexId) || other.vertexId == vertexId)&&(identical(other.title, title) || other.title == title)&&(identical(other.poiCategory, poiCategory) || other.poiCategory == poiCategory)&&(identical(other.description, description) || other.description == description)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,id,vertexId,title,poiCategory,description,recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'WaypointPatchModel.internal(id: $id, vertexId: $vertexId, title: $title, poiCategory: $poiCategory, description: $description, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class _$WaypointPatchModelCopyWith<$Res> implements $WaypointPatchModelCopyWith<$Res> {
  factory _$WaypointPatchModelCopyWith(_WaypointPatchModel value, $Res Function(_WaypointPatchModel) _then) = __$WaypointPatchModelCopyWithImpl;
@override @useResult
$Res call({
 WaypointId id, VertexId vertexId, String title, PoiCategory poiCategory, String description, bool recomputing, Object? error
});




}
/// @nodoc
class __$WaypointPatchModelCopyWithImpl<$Res>
    implements _$WaypointPatchModelCopyWith<$Res> {
  __$WaypointPatchModelCopyWithImpl(this._self, this._then);

  final _WaypointPatchModel _self;
  final $Res Function(_WaypointPatchModel) _then;

/// Create a copy of WaypointPatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vertexId = null,Object? title = null,Object? poiCategory = null,Object? description = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_WaypointPatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as WaypointId,vertexId: null == vertexId ? _self.vertexId : vertexId // ignore: cast_nullable_to_non_nullable
as VertexId,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,poiCategory: null == poiCategory ? _self.poiCategory : poiCategory // ignore: cast_nullable_to_non_nullable
as PoiCategory,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
