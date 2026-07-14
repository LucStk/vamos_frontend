// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MediaImage {

 Id<MediaImage> get fileKey; ImageLocation get location;
/// Create a copy of MediaImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaImageCopyWith<MediaImage> get copyWith => _$MediaImageCopyWithImpl<MediaImage>(this as MediaImage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaImage&&(identical(other.fileKey, fileKey) || other.fileKey == fileKey)&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode => Object.hash(runtimeType,fileKey,location);

@override
String toString() {
  return 'MediaImage(fileKey: $fileKey, location: $location)';
}


}

/// @nodoc
abstract mixin class $MediaImageCopyWith<$Res>  {
  factory $MediaImageCopyWith(MediaImage value, $Res Function(MediaImage) _then) = _$MediaImageCopyWithImpl;
@useResult
$Res call({
 Id<MediaImage> fileKey, ImageLocation location
});




}
/// @nodoc
class _$MediaImageCopyWithImpl<$Res>
    implements $MediaImageCopyWith<$Res> {
  _$MediaImageCopyWithImpl(this._self, this._then);

  final MediaImage _self;
  final $Res Function(MediaImage) _then;

/// Create a copy of MediaImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileKey = null,Object? location = null,}) {
  return _then(_self.copyWith(
fileKey: null == fileKey ? _self.fileKey : fileKey // ignore: cast_nullable_to_non_nullable
as Id<MediaImage>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ImageLocation,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaImage].
extension MediaImagePatterns on MediaImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaImage value)  $default,){
final _that = this;
switch (_that) {
case _MediaImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaImage value)?  $default,){
final _that = this;
switch (_that) {
case _MediaImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Id<MediaImage> fileKey,  ImageLocation location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaImage() when $default != null:
return $default(_that.fileKey,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Id<MediaImage> fileKey,  ImageLocation location)  $default,) {final _that = this;
switch (_that) {
case _MediaImage():
return $default(_that.fileKey,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Id<MediaImage> fileKey,  ImageLocation location)?  $default,) {final _that = this;
switch (_that) {
case _MediaImage() when $default != null:
return $default(_that.fileKey,_that.location);case _:
  return null;

}
}

}

/// @nodoc


class _MediaImage extends MediaImage {
  const _MediaImage({required this.fileKey, required this.location}): super._();
  

@override final  Id<MediaImage> fileKey;
@override final  ImageLocation location;

/// Create a copy of MediaImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaImageCopyWith<_MediaImage> get copyWith => __$MediaImageCopyWithImpl<_MediaImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaImage&&(identical(other.fileKey, fileKey) || other.fileKey == fileKey)&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode => Object.hash(runtimeType,fileKey,location);

@override
String toString() {
  return 'MediaImage(fileKey: $fileKey, location: $location)';
}


}

/// @nodoc
abstract mixin class _$MediaImageCopyWith<$Res> implements $MediaImageCopyWith<$Res> {
  factory _$MediaImageCopyWith(_MediaImage value, $Res Function(_MediaImage) _then) = __$MediaImageCopyWithImpl;
@override @useResult
$Res call({
 Id<MediaImage> fileKey, ImageLocation location
});




}
/// @nodoc
class __$MediaImageCopyWithImpl<$Res>
    implements _$MediaImageCopyWith<$Res> {
  __$MediaImageCopyWithImpl(this._self, this._then);

  final _MediaImage _self;
  final $Res Function(_MediaImage) _then;

/// Create a copy of MediaImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileKey = null,Object? location = null,}) {
  return _then(_MediaImage(
fileKey: null == fileKey ? _self.fileKey : fileKey // ignore: cast_nullable_to_non_nullable
as Id<MediaImage>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ImageLocation,
  ));
}


}

/// @nodoc
mixin _$MediaImagePatch {

 Id<MediaImage> get fileKey; ImageLocation get location; bool get recomputing; UploadStatus? get status; int? get sent; int? get total; String? get error; FileKey? get resolvedFileKey;
/// Create a copy of MediaImagePatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaImagePatchCopyWith<MediaImagePatch> get copyWith => _$MediaImagePatchCopyWithImpl<MediaImagePatch>(this as MediaImagePatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaImagePatch&&(identical(other.fileKey, fileKey) || other.fileKey == fileKey)&&(identical(other.location, location) || other.location == location)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&(identical(other.status, status) || other.status == status)&&(identical(other.sent, sent) || other.sent == sent)&&(identical(other.total, total) || other.total == total)&&(identical(other.error, error) || other.error == error)&&(identical(other.resolvedFileKey, resolvedFileKey) || other.resolvedFileKey == resolvedFileKey));
}


@override
int get hashCode => Object.hash(runtimeType,fileKey,location,recomputing,status,sent,total,error,resolvedFileKey);

@override
String toString() {
  return 'MediaImagePatch(fileKey: $fileKey, location: $location, recomputing: $recomputing, status: $status, sent: $sent, total: $total, error: $error, resolvedFileKey: $resolvedFileKey)';
}


}

/// @nodoc
abstract mixin class $MediaImagePatchCopyWith<$Res>  {
  factory $MediaImagePatchCopyWith(MediaImagePatch value, $Res Function(MediaImagePatch) _then) = _$MediaImagePatchCopyWithImpl;
@useResult
$Res call({
 Id<MediaImage> fileKey, ImageLocation location, bool recomputing, UploadStatus? status, int? sent, int? total, String? error, FileKey? resolvedFileKey
});




}
/// @nodoc
class _$MediaImagePatchCopyWithImpl<$Res>
    implements $MediaImagePatchCopyWith<$Res> {
  _$MediaImagePatchCopyWithImpl(this._self, this._then);

  final MediaImagePatch _self;
  final $Res Function(MediaImagePatch) _then;

/// Create a copy of MediaImagePatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileKey = null,Object? location = null,Object? recomputing = null,Object? status = freezed,Object? sent = freezed,Object? total = freezed,Object? error = freezed,Object? resolvedFileKey = freezed,}) {
  return _then(_self.copyWith(
fileKey: null == fileKey ? _self.fileKey : fileKey // ignore: cast_nullable_to_non_nullable
as Id<MediaImage>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ImageLocation,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UploadStatus?,sent: freezed == sent ? _self.sent : sent // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,resolvedFileKey: freezed == resolvedFileKey ? _self.resolvedFileKey : resolvedFileKey // ignore: cast_nullable_to_non_nullable
as FileKey?,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaImagePatch].
extension MediaImagePatchPatterns on MediaImagePatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _MediaImagePatch value)?  internal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaImagePatch() when internal != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _MediaImagePatch value)  internal,}){
final _that = this;
switch (_that) {
case _MediaImagePatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _MediaImagePatch value)?  internal,}){
final _that = this;
switch (_that) {
case _MediaImagePatch() when internal != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Id<MediaImage> fileKey,  ImageLocation location,  bool recomputing,  UploadStatus? status,  int? sent,  int? total,  String? error,  FileKey? resolvedFileKey)?  internal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaImagePatch() when internal != null:
return internal(_that.fileKey,_that.location,_that.recomputing,_that.status,_that.sent,_that.total,_that.error,_that.resolvedFileKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Id<MediaImage> fileKey,  ImageLocation location,  bool recomputing,  UploadStatus? status,  int? sent,  int? total,  String? error,  FileKey? resolvedFileKey)  internal,}) {final _that = this;
switch (_that) {
case _MediaImagePatch():
return internal(_that.fileKey,_that.location,_that.recomputing,_that.status,_that.sent,_that.total,_that.error,_that.resolvedFileKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Id<MediaImage> fileKey,  ImageLocation location,  bool recomputing,  UploadStatus? status,  int? sent,  int? total,  String? error,  FileKey? resolvedFileKey)?  internal,}) {final _that = this;
switch (_that) {
case _MediaImagePatch() when internal != null:
return internal(_that.fileKey,_that.location,_that.recomputing,_that.status,_that.sent,_that.total,_that.error,_that.resolvedFileKey);case _:
  return null;

}
}

}

/// @nodoc


class _MediaImagePatch extends MediaImagePatch implements Patch<MediaImage> {
  const _MediaImagePatch({required this.fileKey, required this.location, required this.recomputing, this.status = UploadStatus.idle, this.sent = 0, this.total = 0, this.error, this.resolvedFileKey}): super._();
  

@override final  Id<MediaImage> fileKey;
@override final  ImageLocation location;
@override final  bool recomputing;
@override@JsonKey() final  UploadStatus? status;
@override@JsonKey() final  int? sent;
@override@JsonKey() final  int? total;
@override final  String? error;
@override final  FileKey? resolvedFileKey;

/// Create a copy of MediaImagePatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaImagePatchCopyWith<_MediaImagePatch> get copyWith => __$MediaImagePatchCopyWithImpl<_MediaImagePatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaImagePatch&&(identical(other.fileKey, fileKey) || other.fileKey == fileKey)&&(identical(other.location, location) || other.location == location)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&(identical(other.status, status) || other.status == status)&&(identical(other.sent, sent) || other.sent == sent)&&(identical(other.total, total) || other.total == total)&&(identical(other.error, error) || other.error == error)&&(identical(other.resolvedFileKey, resolvedFileKey) || other.resolvedFileKey == resolvedFileKey));
}


@override
int get hashCode => Object.hash(runtimeType,fileKey,location,recomputing,status,sent,total,error,resolvedFileKey);

@override
String toString() {
  return 'MediaImagePatch.internal(fileKey: $fileKey, location: $location, recomputing: $recomputing, status: $status, sent: $sent, total: $total, error: $error, resolvedFileKey: $resolvedFileKey)';
}


}

/// @nodoc
abstract mixin class _$MediaImagePatchCopyWith<$Res> implements $MediaImagePatchCopyWith<$Res> {
  factory _$MediaImagePatchCopyWith(_MediaImagePatch value, $Res Function(_MediaImagePatch) _then) = __$MediaImagePatchCopyWithImpl;
@override @useResult
$Res call({
 Id<MediaImage> fileKey, ImageLocation location, bool recomputing, UploadStatus? status, int? sent, int? total, String? error, FileKey? resolvedFileKey
});




}
/// @nodoc
class __$MediaImagePatchCopyWithImpl<$Res>
    implements _$MediaImagePatchCopyWith<$Res> {
  __$MediaImagePatchCopyWithImpl(this._self, this._then);

  final _MediaImagePatch _self;
  final $Res Function(_MediaImagePatch) _then;

/// Create a copy of MediaImagePatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileKey = null,Object? location = null,Object? recomputing = null,Object? status = freezed,Object? sent = freezed,Object? total = freezed,Object? error = freezed,Object? resolvedFileKey = freezed,}) {
  return _then(_MediaImagePatch(
fileKey: null == fileKey ? _self.fileKey : fileKey // ignore: cast_nullable_to_non_nullable
as Id<MediaImage>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ImageLocation,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UploadStatus?,sent: freezed == sent ? _self.sent : sent // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,resolvedFileKey: freezed == resolvedFileKey ? _self.resolvedFileKey : resolvedFileKey // ignore: cast_nullable_to_non_nullable
as FileKey?,
  ));
}


}

// dart format on
