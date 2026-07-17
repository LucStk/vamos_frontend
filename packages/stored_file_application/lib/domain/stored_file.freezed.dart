// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stored_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoredFile {

 Id<StoredFile> get id; String get filename; String get url; String get status;
/// Create a copy of StoredFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoredFileCopyWith<StoredFile> get copyWith => _$StoredFileCopyWithImpl<StoredFile>(this as StoredFile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoredFile&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.url, url) || other.url == url)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,filename,url,status);

@override
String toString() {
  return 'StoredFile(id: $id, filename: $filename, url: $url, status: $status)';
}


}

/// @nodoc
abstract mixin class $StoredFileCopyWith<$Res>  {
  factory $StoredFileCopyWith(StoredFile value, $Res Function(StoredFile) _then) = _$StoredFileCopyWithImpl;
@useResult
$Res call({
 Id<StoredFile> id, String filename, String url, String status
});




}
/// @nodoc
class _$StoredFileCopyWithImpl<$Res>
    implements $StoredFileCopyWith<$Res> {
  _$StoredFileCopyWithImpl(this._self, this._then);

  final StoredFile _self;
  final $Res Function(StoredFile) _then;

/// Create a copy of StoredFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? filename = null,Object? url = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<StoredFile>,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StoredFile].
extension StoredFilePatterns on StoredFile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoredFile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoredFile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoredFile value)  $default,){
final _that = this;
switch (_that) {
case _StoredFile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoredFile value)?  $default,){
final _that = this;
switch (_that) {
case _StoredFile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Id<StoredFile> id,  String filename,  String url,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoredFile() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Id<StoredFile> id,  String filename,  String url,  String status)  $default,) {final _that = this;
switch (_that) {
case _StoredFile():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Id<StoredFile> id,  String filename,  String url,  String status)?  $default,) {final _that = this;
switch (_that) {
case _StoredFile() when $default != null:
return $default(_that.id,_that.filename,_that.url,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _StoredFile extends StoredFile {
  const _StoredFile({required this.id, required this.filename, required this.url, required this.status}): super._();
  

@override final  Id<StoredFile> id;
@override final  String filename;
@override final  String url;
@override final  String status;

/// Create a copy of StoredFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoredFileCopyWith<_StoredFile> get copyWith => __$StoredFileCopyWithImpl<_StoredFile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoredFile&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.url, url) || other.url == url)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,filename,url,status);

@override
String toString() {
  return 'StoredFile(id: $id, filename: $filename, url: $url, status: $status)';
}


}

/// @nodoc
abstract mixin class _$StoredFileCopyWith<$Res> implements $StoredFileCopyWith<$Res> {
  factory _$StoredFileCopyWith(_StoredFile value, $Res Function(_StoredFile) _then) = __$StoredFileCopyWithImpl;
@override @useResult
$Res call({
 Id<StoredFile> id, String filename, String url, String status
});




}
/// @nodoc
class __$StoredFileCopyWithImpl<$Res>
    implements _$StoredFileCopyWith<$Res> {
  __$StoredFileCopyWithImpl(this._self, this._then);

  final _StoredFile _self;
  final $Res Function(_StoredFile) _then;

/// Create a copy of StoredFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? filename = null,Object? url = null,Object? status = null,}) {
  return _then(_StoredFile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<StoredFile>,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$StoredFilePatch {

 Id<StoredFile> get id; File get file; bool get recomputing; UploadStatus? get status; int? get sent; int? get total; String? get error;
/// Create a copy of StoredFilePatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoredFilePatchCopyWith<StoredFilePatch> get copyWith => _$StoredFilePatchCopyWithImpl<StoredFilePatch>(this as StoredFilePatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoredFilePatch&&(identical(other.id, id) || other.id == id)&&(identical(other.file, file) || other.file == file)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&(identical(other.status, status) || other.status == status)&&(identical(other.sent, sent) || other.sent == sent)&&(identical(other.total, total) || other.total == total)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,file,recomputing,status,sent,total,error);

@override
String toString() {
  return 'StoredFilePatch(id: $id, file: $file, recomputing: $recomputing, status: $status, sent: $sent, total: $total, error: $error)';
}


}

/// @nodoc
abstract mixin class $StoredFilePatchCopyWith<$Res>  {
  factory $StoredFilePatchCopyWith(StoredFilePatch value, $Res Function(StoredFilePatch) _then) = _$StoredFilePatchCopyWithImpl;
@useResult
$Res call({
 Id<StoredFile> id, File file, bool recomputing, UploadStatus? status, int? sent, int? total, String? error
});




}
/// @nodoc
class _$StoredFilePatchCopyWithImpl<$Res>
    implements $StoredFilePatchCopyWith<$Res> {
  _$StoredFilePatchCopyWithImpl(this._self, this._then);

  final StoredFilePatch _self;
  final $Res Function(StoredFilePatch) _then;

/// Create a copy of StoredFilePatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? file = null,Object? recomputing = null,Object? status = freezed,Object? sent = freezed,Object? total = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<StoredFile>,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UploadStatus?,sent: freezed == sent ? _self.sent : sent // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StoredFilePatch].
extension StoredFilePatchPatterns on StoredFilePatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StoredFilePatch value)?  internal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoredFilePatch() when internal != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StoredFilePatch value)  internal,}){
final _that = this;
switch (_that) {
case _StoredFilePatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StoredFilePatch value)?  internal,}){
final _that = this;
switch (_that) {
case _StoredFilePatch() when internal != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Id<StoredFile> id,  File file,  bool recomputing,  UploadStatus? status,  int? sent,  int? total,  String? error)?  internal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoredFilePatch() when internal != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Id<StoredFile> id,  File file,  bool recomputing,  UploadStatus? status,  int? sent,  int? total,  String? error)  internal,}) {final _that = this;
switch (_that) {
case _StoredFilePatch():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Id<StoredFile> id,  File file,  bool recomputing,  UploadStatus? status,  int? sent,  int? total,  String? error)?  internal,}) {final _that = this;
switch (_that) {
case _StoredFilePatch() when internal != null:
return internal(_that.id,_that.file,_that.recomputing,_that.status,_that.sent,_that.total,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _StoredFilePatch extends StoredFilePatch implements Patch<StoredFile> {
  const _StoredFilePatch({required this.id, required this.file, required this.recomputing, this.status = UploadStatus.idle, this.sent = 0, this.total = 0, this.error}): super._();
  

@override final  Id<StoredFile> id;
@override final  File file;
@override final  bool recomputing;
@override@JsonKey() final  UploadStatus? status;
@override@JsonKey() final  int? sent;
@override@JsonKey() final  int? total;
@override final  String? error;

/// Create a copy of StoredFilePatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoredFilePatchCopyWith<_StoredFilePatch> get copyWith => __$StoredFilePatchCopyWithImpl<_StoredFilePatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoredFilePatch&&(identical(other.id, id) || other.id == id)&&(identical(other.file, file) || other.file == file)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&(identical(other.status, status) || other.status == status)&&(identical(other.sent, sent) || other.sent == sent)&&(identical(other.total, total) || other.total == total)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,file,recomputing,status,sent,total,error);

@override
String toString() {
  return 'StoredFilePatch.internal(id: $id, file: $file, recomputing: $recomputing, status: $status, sent: $sent, total: $total, error: $error)';
}


}

/// @nodoc
abstract mixin class _$StoredFilePatchCopyWith<$Res> implements $StoredFilePatchCopyWith<$Res> {
  factory _$StoredFilePatchCopyWith(_StoredFilePatch value, $Res Function(_StoredFilePatch) _then) = __$StoredFilePatchCopyWithImpl;
@override @useResult
$Res call({
 Id<StoredFile> id, File file, bool recomputing, UploadStatus? status, int? sent, int? total, String? error
});




}
/// @nodoc
class __$StoredFilePatchCopyWithImpl<$Res>
    implements _$StoredFilePatchCopyWith<$Res> {
  __$StoredFilePatchCopyWithImpl(this._self, this._then);

  final _StoredFilePatch _self;
  final $Res Function(_StoredFilePatch) _then;

/// Create a copy of StoredFilePatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? file = null,Object? recomputing = null,Object? status = freezed,Object? sent = freezed,Object? total = freezed,Object? error = freezed,}) {
  return _then(_StoredFilePatch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<StoredFile>,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UploadStatus?,sent: freezed == sent ? _self.sent : sent // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
