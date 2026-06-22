// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImageUiModel {

 FileKey get fileKey; ImageLocation get imageLocation; UploadStatus get uploadStatus; double get progress; String? get error;
/// Create a copy of ImageUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageUiModelCopyWith<ImageUiModel> get copyWith => _$ImageUiModelCopyWithImpl<ImageUiModel>(this as ImageUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageUiModel&&(identical(other.fileKey, fileKey) || other.fileKey == fileKey)&&(identical(other.imageLocation, imageLocation) || other.imageLocation == imageLocation)&&(identical(other.uploadStatus, uploadStatus) || other.uploadStatus == uploadStatus)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,fileKey,imageLocation,uploadStatus,progress,error);

@override
String toString() {
  return 'ImageUiModel(fileKey: $fileKey, imageLocation: $imageLocation, uploadStatus: $uploadStatus, progress: $progress, error: $error)';
}


}

/// @nodoc
abstract mixin class $ImageUiModelCopyWith<$Res>  {
  factory $ImageUiModelCopyWith(ImageUiModel value, $Res Function(ImageUiModel) _then) = _$ImageUiModelCopyWithImpl;
@useResult
$Res call({
 FileKey fileKey, ImageLocation imageLocation, UploadStatus uploadStatus, double progress, String? error
});




}
/// @nodoc
class _$ImageUiModelCopyWithImpl<$Res>
    implements $ImageUiModelCopyWith<$Res> {
  _$ImageUiModelCopyWithImpl(this._self, this._then);

  final ImageUiModel _self;
  final $Res Function(ImageUiModel) _then;

/// Create a copy of ImageUiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileKey = null,Object? imageLocation = null,Object? uploadStatus = null,Object? progress = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
fileKey: null == fileKey ? _self.fileKey : fileKey // ignore: cast_nullable_to_non_nullable
as FileKey,imageLocation: null == imageLocation ? _self.imageLocation : imageLocation // ignore: cast_nullable_to_non_nullable
as ImageLocation,uploadStatus: null == uploadStatus ? _self.uploadStatus : uploadStatus // ignore: cast_nullable_to_non_nullable
as UploadStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageUiModel].
extension ImageUiModelPatterns on ImageUiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageUiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageUiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageUiModel value)  $default,){
final _that = this;
switch (_that) {
case _ImageUiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageUiModel value)?  $default,){
final _that = this;
switch (_that) {
case _ImageUiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FileKey fileKey,  ImageLocation imageLocation,  UploadStatus uploadStatus,  double progress,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageUiModel() when $default != null:
return $default(_that.fileKey,_that.imageLocation,_that.uploadStatus,_that.progress,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FileKey fileKey,  ImageLocation imageLocation,  UploadStatus uploadStatus,  double progress,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ImageUiModel():
return $default(_that.fileKey,_that.imageLocation,_that.uploadStatus,_that.progress,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FileKey fileKey,  ImageLocation imageLocation,  UploadStatus uploadStatus,  double progress,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ImageUiModel() when $default != null:
return $default(_that.fileKey,_that.imageLocation,_that.uploadStatus,_that.progress,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ImageUiModel implements ImageUiModel {
  const _ImageUiModel({required this.fileKey, required this.imageLocation, this.uploadStatus = UploadStatus.idle, this.progress = 0.0, this.error});
  

@override final  FileKey fileKey;
@override final  ImageLocation imageLocation;
@override@JsonKey() final  UploadStatus uploadStatus;
@override@JsonKey() final  double progress;
@override final  String? error;

/// Create a copy of ImageUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageUiModelCopyWith<_ImageUiModel> get copyWith => __$ImageUiModelCopyWithImpl<_ImageUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageUiModel&&(identical(other.fileKey, fileKey) || other.fileKey == fileKey)&&(identical(other.imageLocation, imageLocation) || other.imageLocation == imageLocation)&&(identical(other.uploadStatus, uploadStatus) || other.uploadStatus == uploadStatus)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,fileKey,imageLocation,uploadStatus,progress,error);

@override
String toString() {
  return 'ImageUiModel(fileKey: $fileKey, imageLocation: $imageLocation, uploadStatus: $uploadStatus, progress: $progress, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ImageUiModelCopyWith<$Res> implements $ImageUiModelCopyWith<$Res> {
  factory _$ImageUiModelCopyWith(_ImageUiModel value, $Res Function(_ImageUiModel) _then) = __$ImageUiModelCopyWithImpl;
@override @useResult
$Res call({
 FileKey fileKey, ImageLocation imageLocation, UploadStatus uploadStatus, double progress, String? error
});




}
/// @nodoc
class __$ImageUiModelCopyWithImpl<$Res>
    implements _$ImageUiModelCopyWith<$Res> {
  __$ImageUiModelCopyWithImpl(this._self, this._then);

  final _ImageUiModel _self;
  final $Res Function(_ImageUiModel) _then;

/// Create a copy of ImageUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileKey = null,Object? imageLocation = null,Object? uploadStatus = null,Object? progress = null,Object? error = freezed,}) {
  return _then(_ImageUiModel(
fileKey: null == fileKey ? _self.fileKey : fileKey // ignore: cast_nullable_to_non_nullable
as FileKey,imageLocation: null == imageLocation ? _self.imageLocation : imageLocation // ignore: cast_nullable_to_non_nullable
as ImageLocation,uploadStatus: null == uploadStatus ? _self.uploadStatus : uploadStatus // ignore: cast_nullable_to_non_nullable
as UploadStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
