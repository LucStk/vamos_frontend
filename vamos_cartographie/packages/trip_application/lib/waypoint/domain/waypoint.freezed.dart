// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waypoint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Waypoint {

 Id<Waypoint> get id; VertexId get vertexId; String get title; PoiCategory get poiCategory; String get description;
/// Create a copy of Waypoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaypointCopyWith<Waypoint> get copyWith => _$WaypointCopyWithImpl<Waypoint>(this as Waypoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Waypoint&&(identical(other.id, id) || other.id == id)&&(identical(other.vertexId, vertexId) || other.vertexId == vertexId)&&(identical(other.title, title) || other.title == title)&&(identical(other.poiCategory, poiCategory) || other.poiCategory == poiCategory)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,vertexId,title,poiCategory,description);

@override
String toString() {
  return 'Waypoint(id: $id, vertexId: $vertexId, title: $title, poiCategory: $poiCategory, description: $description)';
}


}

/// @nodoc
abstract mixin class $WaypointCopyWith<$Res>  {
  factory $WaypointCopyWith(Waypoint value, $Res Function(Waypoint) _then) = _$WaypointCopyWithImpl;
@useResult
$Res call({
 Id<Waypoint> id, VertexId vertexId, String title, PoiCategory poiCategory, String description
});




}
/// @nodoc
class _$WaypointCopyWithImpl<$Res>
    implements $WaypointCopyWith<$Res> {
  _$WaypointCopyWithImpl(this._self, this._then);

  final Waypoint _self;
  final $Res Function(Waypoint) _then;

/// Create a copy of Waypoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vertexId = null,Object? title = null,Object? poiCategory = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<Waypoint>,vertexId: null == vertexId ? _self.vertexId : vertexId // ignore: cast_nullable_to_non_nullable
as VertexId,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,poiCategory: null == poiCategory ? _self.poiCategory : poiCategory // ignore: cast_nullable_to_non_nullable
as PoiCategory,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Waypoint].
extension WaypointPatterns on Waypoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Waypoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Waypoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Waypoint value)  $default,){
final _that = this;
switch (_that) {
case _Waypoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Waypoint value)?  $default,){
final _that = this;
switch (_that) {
case _Waypoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Id<Waypoint> id,  VertexId vertexId,  String title,  PoiCategory poiCategory,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Waypoint() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Id<Waypoint> id,  VertexId vertexId,  String title,  PoiCategory poiCategory,  String description)  $default,) {final _that = this;
switch (_that) {
case _Waypoint():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Id<Waypoint> id,  VertexId vertexId,  String title,  PoiCategory poiCategory,  String description)?  $default,) {final _that = this;
switch (_that) {
case _Waypoint() when $default != null:
return $default(_that.id,_that.vertexId,_that.title,_that.poiCategory,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _Waypoint extends Waypoint {
  const _Waypoint({required this.id, required this.vertexId, this.title = '', this.poiCategory = PoiCategory.waypoint, this.description = ''}): super._();
  

@override final  Id<Waypoint> id;
@override final  VertexId vertexId;
@override@JsonKey() final  String title;
@override@JsonKey() final  PoiCategory poiCategory;
@override@JsonKey() final  String description;

/// Create a copy of Waypoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaypointCopyWith<_Waypoint> get copyWith => __$WaypointCopyWithImpl<_Waypoint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Waypoint&&(identical(other.id, id) || other.id == id)&&(identical(other.vertexId, vertexId) || other.vertexId == vertexId)&&(identical(other.title, title) || other.title == title)&&(identical(other.poiCategory, poiCategory) || other.poiCategory == poiCategory)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,vertexId,title,poiCategory,description);

@override
String toString() {
  return 'Waypoint(id: $id, vertexId: $vertexId, title: $title, poiCategory: $poiCategory, description: $description)';
}


}

/// @nodoc
abstract mixin class _$WaypointCopyWith<$Res> implements $WaypointCopyWith<$Res> {
  factory _$WaypointCopyWith(_Waypoint value, $Res Function(_Waypoint) _then) = __$WaypointCopyWithImpl;
@override @useResult
$Res call({
 Id<Waypoint> id, VertexId vertexId, String title, PoiCategory poiCategory, String description
});




}
/// @nodoc
class __$WaypointCopyWithImpl<$Res>
    implements _$WaypointCopyWith<$Res> {
  __$WaypointCopyWithImpl(this._self, this._then);

  final _Waypoint _self;
  final $Res Function(_Waypoint) _then;

/// Create a copy of Waypoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vertexId = null,Object? title = null,Object? poiCategory = null,Object? description = null,}) {
  return _then(_Waypoint(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<Waypoint>,vertexId: null == vertexId ? _self.vertexId : vertexId // ignore: cast_nullable_to_non_nullable
as VertexId,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,poiCategory: null == poiCategory ? _self.poiCategory : poiCategory // ignore: cast_nullable_to_non_nullable
as PoiCategory,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$WaypointPatch {

 Id<Waypoint> get id; VertexId get vertexId; String get title; PoiCategory get poiCategory; String get description; bool get recomputing; Object? get error;
/// Create a copy of WaypointPatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaypointPatchCopyWith<WaypointPatch> get copyWith => _$WaypointPatchCopyWithImpl<WaypointPatch>(this as WaypointPatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaypointPatch&&(identical(other.id, id) || other.id == id)&&(identical(other.vertexId, vertexId) || other.vertexId == vertexId)&&(identical(other.title, title) || other.title == title)&&(identical(other.poiCategory, poiCategory) || other.poiCategory == poiCategory)&&(identical(other.description, description) || other.description == description)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,id,vertexId,title,poiCategory,description,recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'WaypointPatch(id: $id, vertexId: $vertexId, title: $title, poiCategory: $poiCategory, description: $description, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class $WaypointPatchCopyWith<$Res>  {
  factory $WaypointPatchCopyWith(WaypointPatch value, $Res Function(WaypointPatch) _then) = _$WaypointPatchCopyWithImpl;
@useResult
$Res call({
 Id<Waypoint> id, VertexId vertexId, String title, PoiCategory poiCategory, String description, bool recomputing, Object? error
});




}
/// @nodoc
class _$WaypointPatchCopyWithImpl<$Res>
    implements $WaypointPatchCopyWith<$Res> {
  _$WaypointPatchCopyWithImpl(this._self, this._then);

  final WaypointPatch _self;
  final $Res Function(WaypointPatch) _then;

/// Create a copy of WaypointPatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vertexId = null,Object? title = null,Object? poiCategory = null,Object? description = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<Waypoint>,vertexId: null == vertexId ? _self.vertexId : vertexId // ignore: cast_nullable_to_non_nullable
as VertexId,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,poiCategory: null == poiCategory ? _self.poiCategory : poiCategory // ignore: cast_nullable_to_non_nullable
as PoiCategory,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [WaypointPatch].
extension WaypointPatchPatterns on WaypointPatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _WaypointPatch value)?  internal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaypointPatch() when internal != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _WaypointPatch value)  internal,}){
final _that = this;
switch (_that) {
case _WaypointPatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _WaypointPatch value)?  internal,}){
final _that = this;
switch (_that) {
case _WaypointPatch() when internal != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Id<Waypoint> id,  VertexId vertexId,  String title,  PoiCategory poiCategory,  String description,  bool recomputing,  Object? error)?  internal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaypointPatch() when internal != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Id<Waypoint> id,  VertexId vertexId,  String title,  PoiCategory poiCategory,  String description,  bool recomputing,  Object? error)  internal,}) {final _that = this;
switch (_that) {
case _WaypointPatch():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Id<Waypoint> id,  VertexId vertexId,  String title,  PoiCategory poiCategory,  String description,  bool recomputing,  Object? error)?  internal,}) {final _that = this;
switch (_that) {
case _WaypointPatch() when internal != null:
return internal(_that.id,_that.vertexId,_that.title,_that.poiCategory,_that.description,_that.recomputing,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _WaypointPatch extends WaypointPatch implements Patch<Waypoint> {
  const _WaypointPatch({required this.id, required this.vertexId, required this.title, required this.poiCategory, required this.description, required this.recomputing, this.error}): super._();
  

@override final  Id<Waypoint> id;
@override final  VertexId vertexId;
@override final  String title;
@override final  PoiCategory poiCategory;
@override final  String description;
@override final  bool recomputing;
@override final  Object? error;

/// Create a copy of WaypointPatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaypointPatchCopyWith<_WaypointPatch> get copyWith => __$WaypointPatchCopyWithImpl<_WaypointPatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaypointPatch&&(identical(other.id, id) || other.id == id)&&(identical(other.vertexId, vertexId) || other.vertexId == vertexId)&&(identical(other.title, title) || other.title == title)&&(identical(other.poiCategory, poiCategory) || other.poiCategory == poiCategory)&&(identical(other.description, description) || other.description == description)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,id,vertexId,title,poiCategory,description,recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'WaypointPatch.internal(id: $id, vertexId: $vertexId, title: $title, poiCategory: $poiCategory, description: $description, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class _$WaypointPatchCopyWith<$Res> implements $WaypointPatchCopyWith<$Res> {
  factory _$WaypointPatchCopyWith(_WaypointPatch value, $Res Function(_WaypointPatch) _then) = __$WaypointPatchCopyWithImpl;
@override @useResult
$Res call({
 Id<Waypoint> id, VertexId vertexId, String title, PoiCategory poiCategory, String description, bool recomputing, Object? error
});




}
/// @nodoc
class __$WaypointPatchCopyWithImpl<$Res>
    implements _$WaypointPatchCopyWith<$Res> {
  __$WaypointPatchCopyWithImpl(this._self, this._then);

  final _WaypointPatch _self;
  final $Res Function(_WaypointPatch) _then;

/// Create a copy of WaypointPatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vertexId = null,Object? title = null,Object? poiCategory = null,Object? description = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_WaypointPatch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<Waypoint>,vertexId: null == vertexId ? _self.vertexId : vertexId // ignore: cast_nullable_to_non_nullable
as VertexId,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,poiCategory: null == poiCategory ? _self.poiCategory : poiCategory // ignore: cast_nullable_to_non_nullable
as PoiCategory,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
