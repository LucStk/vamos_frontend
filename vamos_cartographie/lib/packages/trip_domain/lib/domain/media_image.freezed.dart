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

// dart format on
