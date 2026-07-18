// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stored_file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoredFileRemoteModel {

 StoredFileId get id; String get filename; String get url; String get status;
/// Create a copy of StoredFileRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoredFileRemoteModelCopyWith<StoredFileRemoteModel> get copyWith => _$StoredFileRemoteModelCopyWithImpl<StoredFileRemoteModel>(this as StoredFileRemoteModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoredFileRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.url, url) || other.url == url)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,filename,url,status);

@override
String toString() {
  return 'StoredFileRemoteModel(id: $id, filename: $filename, url: $url, status: $status)';
}


}

/// @nodoc
abstract mixin class $StoredFileRemoteModelCopyWith<$Res>  {
  factory $StoredFileRemoteModelCopyWith(StoredFileRemoteModel value, $Res Function(StoredFileRemoteModel) _then) = _$StoredFileRemoteModelCopyWithImpl;
@useResult
$Res call({
 StoredFileId id, String filename, String url, String status
});




}
/// @nodoc
class _$StoredFileRemoteModelCopyWithImpl<$Res>
    implements $StoredFileRemoteModelCopyWith<$Res> {
  _$StoredFileRemoteModelCopyWithImpl(this._self, this._then);

  final StoredFileRemoteModel _self;
  final $Res Function(StoredFileRemoteModel) _then;

/// Create a copy of StoredFileRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? filename = null,Object? url = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as StoredFileId,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StoredFileRemoteModel].
extension StoredFileRemoteModelPatterns on StoredFileRemoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoredFileRemoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoredFileRemoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoredFileRemoteModel value)  $default,){
final _that = this;
switch (_that) {
case _StoredFileRemoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoredFileRemoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _StoredFileRemoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoredFileId id,  String filename,  String url,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoredFileRemoteModel() when $default != null:
return $default(_that.id,_that.filename,_that.url,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoredFileId id,  String filename,  String url,  String status)  $default,) {final _that = this;
switch (_that) {
case _StoredFileRemoteModel():
return $default(_that.id,_that.filename,_that.url,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoredFileId id,  String filename,  String url,  String status)?  $default,) {final _that = this;
switch (_that) {
case _StoredFileRemoteModel() when $default != null:
return $default(_that.id,_that.filename,_that.url,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _StoredFileRemoteModel extends StoredFileRemoteModel {
  const _StoredFileRemoteModel({required this.id, required this.filename, required this.url, required this.status}): super._();
  

@override final  StoredFileId id;
@override final  String filename;
@override final  String url;
@override final  String status;

/// Create a copy of StoredFileRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoredFileRemoteModelCopyWith<_StoredFileRemoteModel> get copyWith => __$StoredFileRemoteModelCopyWithImpl<_StoredFileRemoteModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoredFileRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.url, url) || other.url == url)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,filename,url,status);

@override
String toString() {
  return 'StoredFileRemoteModel(id: $id, filename: $filename, url: $url, status: $status)';
}


}

/// @nodoc
abstract mixin class _$StoredFileRemoteModelCopyWith<$Res> implements $StoredFileRemoteModelCopyWith<$Res> {
  factory _$StoredFileRemoteModelCopyWith(_StoredFileRemoteModel value, $Res Function(_StoredFileRemoteModel) _then) = __$StoredFileRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 StoredFileId id, String filename, String url, String status
});




}
/// @nodoc
class __$StoredFileRemoteModelCopyWithImpl<$Res>
    implements _$StoredFileRemoteModelCopyWith<$Res> {
  __$StoredFileRemoteModelCopyWithImpl(this._self, this._then);

  final _StoredFileRemoteModel _self;
  final $Res Function(_StoredFileRemoteModel) _then;

/// Create a copy of StoredFileRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? filename = null,Object? url = null,Object? status = null,}) {
  return _then(_StoredFileRemoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as StoredFileId,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$StoredFilePatchModel {

 StoredFileId get id; File get file; bool get recomputing; UploadStatus get status; int get sent; int get total; String? get error;
/// Create a copy of StoredFilePatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoredFilePatchModelCopyWith<StoredFilePatchModel> get copyWith => _$StoredFilePatchModelCopyWithImpl<StoredFilePatchModel>(this as StoredFilePatchModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoredFilePatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.file, file) || other.file == file)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&(identical(other.status, status) || other.status == status)&&(identical(other.sent, sent) || other.sent == sent)&&(identical(other.total, total) || other.total == total)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,file,recomputing,status,sent,total,error);

@override
String toString() {
  return 'StoredFilePatchModel(id: $id, file: $file, recomputing: $recomputing, status: $status, sent: $sent, total: $total, error: $error)';
}


}

/// @nodoc
abstract mixin class $StoredFilePatchModelCopyWith<$Res>  {
  factory $StoredFilePatchModelCopyWith(StoredFilePatchModel value, $Res Function(StoredFilePatchModel) _then) = _$StoredFilePatchModelCopyWithImpl;
@useResult
$Res call({
 StoredFileId id, File file, bool recomputing, UploadStatus status, int sent, int total, String? error
});




}
/// @nodoc
class _$StoredFilePatchModelCopyWithImpl<$Res>
    implements $StoredFilePatchModelCopyWith<$Res> {
  _$StoredFilePatchModelCopyWithImpl(this._self, this._then);

  final StoredFilePatchModel _self;
  final $Res Function(StoredFilePatchModel) _then;

/// Create a copy of StoredFilePatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? file = null,Object? recomputing = null,Object? status = null,Object? sent = null,Object? total = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as StoredFileId,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UploadStatus,sent: null == sent ? _self.sent : sent // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StoredFilePatchModel].
extension StoredFilePatchModelPatterns on StoredFilePatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StoredFilePatchModel value)?  internal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoredFilePatchModel() when internal != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StoredFilePatchModel value)  internal,}){
final _that = this;
switch (_that) {
case _StoredFilePatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StoredFilePatchModel value)?  internal,}){
final _that = this;
switch (_that) {
case _StoredFilePatchModel() when internal != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( StoredFileId id,  File file,  bool recomputing,  UploadStatus status,  int sent,  int total,  String? error)?  internal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoredFilePatchModel() when internal != null:
return internal(_that.id,_that.file,_that.recomputing,_that.status,_that.sent,_that.total,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( StoredFileId id,  File file,  bool recomputing,  UploadStatus status,  int sent,  int total,  String? error)  internal,}) {final _that = this;
switch (_that) {
case _StoredFilePatchModel():
return internal(_that.id,_that.file,_that.recomputing,_that.status,_that.sent,_that.total,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( StoredFileId id,  File file,  bool recomputing,  UploadStatus status,  int sent,  int total,  String? error)?  internal,}) {final _that = this;
switch (_that) {
case _StoredFilePatchModel() when internal != null:
return internal(_that.id,_that.file,_that.recomputing,_that.status,_that.sent,_that.total,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _StoredFilePatchModel extends StoredFilePatchModel implements Patch<StoredFileRemoteModel> {
  const _StoredFilePatchModel({required this.id, required this.file, required this.recomputing, this.status = UploadStatus.idle, this.sent = 0, this.total = 0, this.error}): super._();
  

@override final  StoredFileId id;
@override final  File file;
@override final  bool recomputing;
@override@JsonKey() final  UploadStatus status;
@override@JsonKey() final  int sent;
@override@JsonKey() final  int total;
@override final  String? error;

/// Create a copy of StoredFilePatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoredFilePatchModelCopyWith<_StoredFilePatchModel> get copyWith => __$StoredFilePatchModelCopyWithImpl<_StoredFilePatchModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoredFilePatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.file, file) || other.file == file)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&(identical(other.status, status) || other.status == status)&&(identical(other.sent, sent) || other.sent == sent)&&(identical(other.total, total) || other.total == total)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,file,recomputing,status,sent,total,error);

@override
String toString() {
  return 'StoredFilePatchModel.internal(id: $id, file: $file, recomputing: $recomputing, status: $status, sent: $sent, total: $total, error: $error)';
}


}

/// @nodoc
abstract mixin class _$StoredFilePatchModelCopyWith<$Res> implements $StoredFilePatchModelCopyWith<$Res> {
  factory _$StoredFilePatchModelCopyWith(_StoredFilePatchModel value, $Res Function(_StoredFilePatchModel) _then) = __$StoredFilePatchModelCopyWithImpl;
@override @useResult
$Res call({
 StoredFileId id, File file, bool recomputing, UploadStatus status, int sent, int total, String? error
});




}
/// @nodoc
class __$StoredFilePatchModelCopyWithImpl<$Res>
    implements _$StoredFilePatchModelCopyWith<$Res> {
  __$StoredFilePatchModelCopyWithImpl(this._self, this._then);

  final _StoredFilePatchModel _self;
  final $Res Function(_StoredFilePatchModel) _then;

/// Create a copy of StoredFilePatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? file = null,Object? recomputing = null,Object? status = null,Object? sent = null,Object? total = null,Object? error = freezed,}) {
  return _then(_StoredFilePatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as StoredFileId,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UploadStatus,sent: null == sent ? _self.sent : sent // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
