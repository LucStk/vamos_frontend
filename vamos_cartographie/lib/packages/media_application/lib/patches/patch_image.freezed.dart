// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patch_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PatchImageMedia {

 FileKey get fileKey; File get file;
/// Create a copy of PatchImageMedia
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchImageMediaCopyWith<PatchImageMedia> get copyWith => _$PatchImageMediaCopyWithImpl<PatchImageMedia>(this as PatchImageMedia, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchImageMedia&&(identical(other.fileKey, fileKey) || other.fileKey == fileKey)&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,fileKey,file);

@override
String toString() {
  return 'PatchImageMedia(fileKey: $fileKey, file: $file)';
}


}

/// @nodoc
abstract mixin class $PatchImageMediaCopyWith<$Res>  {
  factory $PatchImageMediaCopyWith(PatchImageMedia value, $Res Function(PatchImageMedia) _then) = _$PatchImageMediaCopyWithImpl;
@useResult
$Res call({
 FileKey fileKey, File file
});




}
/// @nodoc
class _$PatchImageMediaCopyWithImpl<$Res>
    implements $PatchImageMediaCopyWith<$Res> {
  _$PatchImageMediaCopyWithImpl(this._self, this._then);

  final PatchImageMedia _self;
  final $Res Function(PatchImageMedia) _then;

/// Create a copy of PatchImageMedia
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileKey = null,Object? file = null,}) {
  return _then(_self.copyWith(
fileKey: null == fileKey ? _self.fileKey : fileKey // ignore: cast_nullable_to_non_nullable
as FileKey,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchImageMedia].
extension PatchImageMediaPatterns on PatchImageMedia {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchImageMedia value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchImageMedia() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchImageMedia value)  $default,){
final _that = this;
switch (_that) {
case _PatchImageMedia():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchImageMedia value)?  $default,){
final _that = this;
switch (_that) {
case _PatchImageMedia() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FileKey fileKey,  File file)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchImageMedia() when $default != null:
return $default(_that.fileKey,_that.file);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FileKey fileKey,  File file)  $default,) {final _that = this;
switch (_that) {
case _PatchImageMedia():
return $default(_that.fileKey,_that.file);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FileKey fileKey,  File file)?  $default,) {final _that = this;
switch (_that) {
case _PatchImageMedia() when $default != null:
return $default(_that.fileKey,_that.file);case _:
  return null;

}
}

}

/// @nodoc


class _PatchImageMedia implements PatchImageMedia {
  const _PatchImageMedia({required this.fileKey, required this.file});
  

@override final  FileKey fileKey;
@override final  File file;

/// Create a copy of PatchImageMedia
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchImageMediaCopyWith<_PatchImageMedia> get copyWith => __$PatchImageMediaCopyWithImpl<_PatchImageMedia>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchImageMedia&&(identical(other.fileKey, fileKey) || other.fileKey == fileKey)&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,fileKey,file);

@override
String toString() {
  return 'PatchImageMedia(fileKey: $fileKey, file: $file)';
}


}

/// @nodoc
abstract mixin class _$PatchImageMediaCopyWith<$Res> implements $PatchImageMediaCopyWith<$Res> {
  factory _$PatchImageMediaCopyWith(_PatchImageMedia value, $Res Function(_PatchImageMedia) _then) = __$PatchImageMediaCopyWithImpl;
@override @useResult
$Res call({
 FileKey fileKey, File file
});




}
/// @nodoc
class __$PatchImageMediaCopyWithImpl<$Res>
    implements _$PatchImageMediaCopyWith<$Res> {
  __$PatchImageMediaCopyWithImpl(this._self, this._then);

  final _PatchImageMedia _self;
  final $Res Function(_PatchImageMedia) _then;

/// Create a copy of PatchImageMedia
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileKey = null,Object? file = null,}) {
  return _then(_PatchImageMedia(
fileKey: null == fileKey ? _self.fileKey : fileKey // ignore: cast_nullable_to_non_nullable
as FileKey,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

// dart format on
