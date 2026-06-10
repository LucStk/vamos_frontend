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

 int get id; int get vertexId; String get title; WaypointType get type; String get description; List<MediaImage> get images;
/// Create a copy of Waypoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaypointCopyWith<Waypoint> get copyWith => _$WaypointCopyWithImpl<Waypoint>(this as Waypoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Waypoint&&(identical(other.id, id) || other.id == id)&&(identical(other.vertexId, vertexId) || other.vertexId == vertexId)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, images));
}


@override
int get hashCode => Object.hash(runtimeType,id,vertexId,title,type,description,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'Waypoint(id: $id, vertexId: $vertexId, title: $title, type: $type, description: $description, images: $images)';
}


}

/// @nodoc
abstract mixin class $WaypointCopyWith<$Res>  {
  factory $WaypointCopyWith(Waypoint value, $Res Function(Waypoint) _then) = _$WaypointCopyWithImpl;
@useResult
$Res call({
 int id, int vertexId, String title, WaypointType type, String description, List<MediaImage> images
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vertexId = null,Object? title = null,Object? type = null,Object? description = null,Object? images = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,vertexId: null == vertexId ? _self.vertexId : vertexId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WaypointType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<MediaImage>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int vertexId,  String title,  WaypointType type,  String description,  List<MediaImage> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Waypoint() when $default != null:
return $default(_that.id,_that.vertexId,_that.title,_that.type,_that.description,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int vertexId,  String title,  WaypointType type,  String description,  List<MediaImage> images)  $default,) {final _that = this;
switch (_that) {
case _Waypoint():
return $default(_that.id,_that.vertexId,_that.title,_that.type,_that.description,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int vertexId,  String title,  WaypointType type,  String description,  List<MediaImage> images)?  $default,) {final _that = this;
switch (_that) {
case _Waypoint() when $default != null:
return $default(_that.id,_that.vertexId,_that.title,_that.type,_that.description,_that.images);case _:
  return null;

}
}

}

/// @nodoc


class _Waypoint extends Waypoint {
  const _Waypoint({required this.id, required this.vertexId, this.title = '', this.type = WaypointType.waypoint, this.description = '', final  List<MediaImage> images = const []}): _images = images,super._();
  

@override final  int id;
@override final  int vertexId;
@override@JsonKey() final  String title;
@override@JsonKey() final  WaypointType type;
@override@JsonKey() final  String description;
 final  List<MediaImage> _images;
@override@JsonKey() List<MediaImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of Waypoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaypointCopyWith<_Waypoint> get copyWith => __$WaypointCopyWithImpl<_Waypoint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Waypoint&&(identical(other.id, id) || other.id == id)&&(identical(other.vertexId, vertexId) || other.vertexId == vertexId)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._images, _images));
}


@override
int get hashCode => Object.hash(runtimeType,id,vertexId,title,type,description,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'Waypoint(id: $id, vertexId: $vertexId, title: $title, type: $type, description: $description, images: $images)';
}


}

/// @nodoc
abstract mixin class _$WaypointCopyWith<$Res> implements $WaypointCopyWith<$Res> {
  factory _$WaypointCopyWith(_Waypoint value, $Res Function(_Waypoint) _then) = __$WaypointCopyWithImpl;
@override @useResult
$Res call({
 int id, int vertexId, String title, WaypointType type, String description, List<MediaImage> images
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vertexId = null,Object? title = null,Object? type = null,Object? description = null,Object? images = null,}) {
  return _then(_Waypoint(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,vertexId: null == vertexId ? _self.vertexId : vertexId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WaypointType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<MediaImage>,
  ));
}


}

/// @nodoc
mixin _$WaypointDraft {

 int get vertexId; String get title; WaypointType get type; String get description; List<MediaImage> get images;
/// Create a copy of WaypointDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaypointDraftCopyWith<WaypointDraft> get copyWith => _$WaypointDraftCopyWithImpl<WaypointDraft>(this as WaypointDraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaypointDraft&&(identical(other.vertexId, vertexId) || other.vertexId == vertexId)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, images));
}


@override
int get hashCode => Object.hash(runtimeType,vertexId,title,type,description,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'WaypointDraft(vertexId: $vertexId, title: $title, type: $type, description: $description, images: $images)';
}


}

/// @nodoc
abstract mixin class $WaypointDraftCopyWith<$Res>  {
  factory $WaypointDraftCopyWith(WaypointDraft value, $Res Function(WaypointDraft) _then) = _$WaypointDraftCopyWithImpl;
@useResult
$Res call({
 int vertexId, String title, WaypointType type, String description, List<MediaImage> images
});




}
/// @nodoc
class _$WaypointDraftCopyWithImpl<$Res>
    implements $WaypointDraftCopyWith<$Res> {
  _$WaypointDraftCopyWithImpl(this._self, this._then);

  final WaypointDraft _self;
  final $Res Function(WaypointDraft) _then;

/// Create a copy of WaypointDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vertexId = null,Object? title = null,Object? type = null,Object? description = null,Object? images = null,}) {
  return _then(_self.copyWith(
vertexId: null == vertexId ? _self.vertexId : vertexId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WaypointType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<MediaImage>,
  ));
}

}


/// Adds pattern-matching-related methods to [WaypointDraft].
extension WaypointDraftPatterns on WaypointDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaypointDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaypointDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaypointDraft value)  $default,){
final _that = this;
switch (_that) {
case _WaypointDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaypointDraft value)?  $default,){
final _that = this;
switch (_that) {
case _WaypointDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int vertexId,  String title,  WaypointType type,  String description,  List<MediaImage> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaypointDraft() when $default != null:
return $default(_that.vertexId,_that.title,_that.type,_that.description,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int vertexId,  String title,  WaypointType type,  String description,  List<MediaImage> images)  $default,) {final _that = this;
switch (_that) {
case _WaypointDraft():
return $default(_that.vertexId,_that.title,_that.type,_that.description,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int vertexId,  String title,  WaypointType type,  String description,  List<MediaImage> images)?  $default,) {final _that = this;
switch (_that) {
case _WaypointDraft() when $default != null:
return $default(_that.vertexId,_that.title,_that.type,_that.description,_that.images);case _:
  return null;

}
}

}

/// @nodoc


class _WaypointDraft extends WaypointDraft {
  const _WaypointDraft({required this.vertexId, this.title = '', this.type = WaypointType.waypoint, this.description = '', final  List<MediaImage> images = const []}): _images = images,super._();
  

@override final  int vertexId;
@override@JsonKey() final  String title;
@override@JsonKey() final  WaypointType type;
@override@JsonKey() final  String description;
 final  List<MediaImage> _images;
@override@JsonKey() List<MediaImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of WaypointDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaypointDraftCopyWith<_WaypointDraft> get copyWith => __$WaypointDraftCopyWithImpl<_WaypointDraft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaypointDraft&&(identical(other.vertexId, vertexId) || other.vertexId == vertexId)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._images, _images));
}


@override
int get hashCode => Object.hash(runtimeType,vertexId,title,type,description,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'WaypointDraft(vertexId: $vertexId, title: $title, type: $type, description: $description, images: $images)';
}


}

/// @nodoc
abstract mixin class _$WaypointDraftCopyWith<$Res> implements $WaypointDraftCopyWith<$Res> {
  factory _$WaypointDraftCopyWith(_WaypointDraft value, $Res Function(_WaypointDraft) _then) = __$WaypointDraftCopyWithImpl;
@override @useResult
$Res call({
 int vertexId, String title, WaypointType type, String description, List<MediaImage> images
});




}
/// @nodoc
class __$WaypointDraftCopyWithImpl<$Res>
    implements _$WaypointDraftCopyWith<$Res> {
  __$WaypointDraftCopyWithImpl(this._self, this._then);

  final _WaypointDraft _self;
  final $Res Function(_WaypointDraft) _then;

/// Create a copy of WaypointDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vertexId = null,Object? title = null,Object? type = null,Object? description = null,Object? images = null,}) {
  return _then(_WaypointDraft(
vertexId: null == vertexId ? _self.vertexId : vertexId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WaypointType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<MediaImage>,
  ));
}


}

// dart format on
