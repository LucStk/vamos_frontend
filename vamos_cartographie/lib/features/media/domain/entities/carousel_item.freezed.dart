// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carousel_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MediaImage {

 String get fileKey; String get url;
/// Create a copy of MediaImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaImageCopyWith<MediaImage> get copyWith => _$MediaImageCopyWithImpl<MediaImage>(this as MediaImage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaImage&&(identical(other.fileKey, fileKey) || other.fileKey == fileKey)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,fileKey,url);

@override
String toString() {
  return 'MediaImage(fileKey: $fileKey, url: $url)';
}


}

/// @nodoc
abstract mixin class $MediaImageCopyWith<$Res>  {
  factory $MediaImageCopyWith(MediaImage value, $Res Function(MediaImage) _then) = _$MediaImageCopyWithImpl;
@useResult
$Res call({
 String fileKey, String url
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
@pragma('vm:prefer-inline') @override $Res call({Object? fileKey = null,Object? url = null,}) {
  return _then(_self.copyWith(
fileKey: null == fileKey ? _self.fileKey : fileKey // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fileKey,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaImage() when $default != null:
return $default(_that.fileKey,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fileKey,  String url)  $default,) {final _that = this;
switch (_that) {
case _MediaImage():
return $default(_that.fileKey,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fileKey,  String url)?  $default,) {final _that = this;
switch (_that) {
case _MediaImage() when $default != null:
return $default(_that.fileKey,_that.url);case _:
  return null;

}
}

}

/// @nodoc


class _MediaImage implements MediaImage {
  const _MediaImage({required this.fileKey, required this.url});
  

@override final  String fileKey;
@override final  String url;

/// Create a copy of MediaImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaImageCopyWith<_MediaImage> get copyWith => __$MediaImageCopyWithImpl<_MediaImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaImage&&(identical(other.fileKey, fileKey) || other.fileKey == fileKey)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,fileKey,url);

@override
String toString() {
  return 'MediaImage(fileKey: $fileKey, url: $url)';
}


}

/// @nodoc
abstract mixin class _$MediaImageCopyWith<$Res> implements $MediaImageCopyWith<$Res> {
  factory _$MediaImageCopyWith(_MediaImage value, $Res Function(_MediaImage) _then) = __$MediaImageCopyWithImpl;
@override @useResult
$Res call({
 String fileKey, String url
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
@override @pragma('vm:prefer-inline') $Res call({Object? fileKey = null,Object? url = null,}) {
  return _then(_MediaImage(
fileKey: null == fileKey ? _self.fileKey : fileKey // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$CarouselItem {

 UploadStatus get uploadStatus; double get progress; String? get error;
/// Create a copy of CarouselItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarouselItemCopyWith<CarouselItem> get copyWith => _$CarouselItemCopyWithImpl<CarouselItem>(this as CarouselItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarouselItem&&(identical(other.uploadStatus, uploadStatus) || other.uploadStatus == uploadStatus)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,uploadStatus,progress,error);

@override
String toString() {
  return 'CarouselItem(uploadStatus: $uploadStatus, progress: $progress, error: $error)';
}


}

/// @nodoc
abstract mixin class $CarouselItemCopyWith<$Res>  {
  factory $CarouselItemCopyWith(CarouselItem value, $Res Function(CarouselItem) _then) = _$CarouselItemCopyWithImpl;
@useResult
$Res call({
 UploadStatus uploadStatus, double progress, String? error
});




}
/// @nodoc
class _$CarouselItemCopyWithImpl<$Res>
    implements $CarouselItemCopyWith<$Res> {
  _$CarouselItemCopyWithImpl(this._self, this._then);

  final CarouselItem _self;
  final $Res Function(CarouselItem) _then;

/// Create a copy of CarouselItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uploadStatus = null,Object? progress = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
uploadStatus: null == uploadStatus ? _self.uploadStatus : uploadStatus // ignore: cast_nullable_to_non_nullable
as UploadStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CarouselItem].
extension CarouselItemPatterns on CarouselItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CarouselItemLocal value)?  local,TResult Function( _CarouselItemRemote value)?  remote,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarouselItemLocal() when local != null:
return local(_that);case _CarouselItemRemote() when remote != null:
return remote(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CarouselItemLocal value)  local,required TResult Function( _CarouselItemRemote value)  remote,}){
final _that = this;
switch (_that) {
case _CarouselItemLocal():
return local(_that);case _CarouselItemRemote():
return remote(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CarouselItemLocal value)?  local,TResult? Function( _CarouselItemRemote value)?  remote,}){
final _that = this;
switch (_that) {
case _CarouselItemLocal() when local != null:
return local(_that);case _CarouselItemRemote() when remote != null:
return remote(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String fileKey,  UploadStatus uploadStatus,  double progress,  String? error)?  local,TResult Function( MediaImage image,  UploadStatus uploadStatus,  double progress,  String? error)?  remote,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarouselItemLocal() when local != null:
return local(_that.fileKey,_that.uploadStatus,_that.progress,_that.error);case _CarouselItemRemote() when remote != null:
return remote(_that.image,_that.uploadStatus,_that.progress,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String fileKey,  UploadStatus uploadStatus,  double progress,  String? error)  local,required TResult Function( MediaImage image,  UploadStatus uploadStatus,  double progress,  String? error)  remote,}) {final _that = this;
switch (_that) {
case _CarouselItemLocal():
return local(_that.fileKey,_that.uploadStatus,_that.progress,_that.error);case _CarouselItemRemote():
return remote(_that.image,_that.uploadStatus,_that.progress,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String fileKey,  UploadStatus uploadStatus,  double progress,  String? error)?  local,TResult? Function( MediaImage image,  UploadStatus uploadStatus,  double progress,  String? error)?  remote,}) {final _that = this;
switch (_that) {
case _CarouselItemLocal() when local != null:
return local(_that.fileKey,_that.uploadStatus,_that.progress,_that.error);case _CarouselItemRemote() when remote != null:
return remote(_that.image,_that.uploadStatus,_that.progress,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CarouselItemLocal extends CarouselItem {
  const _CarouselItemLocal({required this.fileKey, this.uploadStatus = UploadStatus.idle, this.progress = 0.0, this.error = null}): super._();
  

 final  String fileKey;
@override@JsonKey() final  UploadStatus uploadStatus;
@override@JsonKey() final  double progress;
@override@JsonKey() final  String? error;

/// Create a copy of CarouselItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarouselItemLocalCopyWith<_CarouselItemLocal> get copyWith => __$CarouselItemLocalCopyWithImpl<_CarouselItemLocal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarouselItemLocal&&(identical(other.fileKey, fileKey) || other.fileKey == fileKey)&&(identical(other.uploadStatus, uploadStatus) || other.uploadStatus == uploadStatus)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,fileKey,uploadStatus,progress,error);

@override
String toString() {
  return 'CarouselItem.local(fileKey: $fileKey, uploadStatus: $uploadStatus, progress: $progress, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CarouselItemLocalCopyWith<$Res> implements $CarouselItemCopyWith<$Res> {
  factory _$CarouselItemLocalCopyWith(_CarouselItemLocal value, $Res Function(_CarouselItemLocal) _then) = __$CarouselItemLocalCopyWithImpl;
@override @useResult
$Res call({
 String fileKey, UploadStatus uploadStatus, double progress, String? error
});




}
/// @nodoc
class __$CarouselItemLocalCopyWithImpl<$Res>
    implements _$CarouselItemLocalCopyWith<$Res> {
  __$CarouselItemLocalCopyWithImpl(this._self, this._then);

  final _CarouselItemLocal _self;
  final $Res Function(_CarouselItemLocal) _then;

/// Create a copy of CarouselItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileKey = null,Object? uploadStatus = null,Object? progress = null,Object? error = freezed,}) {
  return _then(_CarouselItemLocal(
fileKey: null == fileKey ? _self.fileKey : fileKey // ignore: cast_nullable_to_non_nullable
as String,uploadStatus: null == uploadStatus ? _self.uploadStatus : uploadStatus // ignore: cast_nullable_to_non_nullable
as UploadStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _CarouselItemRemote extends CarouselItem {
  const _CarouselItemRemote({required this.image, this.uploadStatus = UploadStatus.success, this.progress = 1.0, this.error = null}): super._();
  

 final  MediaImage image;
@override@JsonKey() final  UploadStatus uploadStatus;
@override@JsonKey() final  double progress;
@override@JsonKey() final  String? error;

/// Create a copy of CarouselItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarouselItemRemoteCopyWith<_CarouselItemRemote> get copyWith => __$CarouselItemRemoteCopyWithImpl<_CarouselItemRemote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarouselItemRemote&&(identical(other.image, image) || other.image == image)&&(identical(other.uploadStatus, uploadStatus) || other.uploadStatus == uploadStatus)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,image,uploadStatus,progress,error);

@override
String toString() {
  return 'CarouselItem.remote(image: $image, uploadStatus: $uploadStatus, progress: $progress, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CarouselItemRemoteCopyWith<$Res> implements $CarouselItemCopyWith<$Res> {
  factory _$CarouselItemRemoteCopyWith(_CarouselItemRemote value, $Res Function(_CarouselItemRemote) _then) = __$CarouselItemRemoteCopyWithImpl;
@override @useResult
$Res call({
 MediaImage image, UploadStatus uploadStatus, double progress, String? error
});


$MediaImageCopyWith<$Res> get image;

}
/// @nodoc
class __$CarouselItemRemoteCopyWithImpl<$Res>
    implements _$CarouselItemRemoteCopyWith<$Res> {
  __$CarouselItemRemoteCopyWithImpl(this._self, this._then);

  final _CarouselItemRemote _self;
  final $Res Function(_CarouselItemRemote) _then;

/// Create a copy of CarouselItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? image = null,Object? uploadStatus = null,Object? progress = null,Object? error = freezed,}) {
  return _then(_CarouselItemRemote(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as MediaImage,uploadStatus: null == uploadStatus ? _self.uploadStatus : uploadStatus // ignore: cast_nullable_to_non_nullable
as UploadStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CarouselItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaImageCopyWith<$Res> get image {
  
  return $MediaImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}

// dart format on
