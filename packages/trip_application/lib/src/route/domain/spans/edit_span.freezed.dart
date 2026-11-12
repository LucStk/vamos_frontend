// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_span.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditSpan {

 SpanId get id; int get startIndex; EditId get editId; GeometrySource get geometrySource; double? get lengthM;
/// Create a copy of EditSpan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditSpanCopyWith<EditSpan> get copyWith => _$EditSpanCopyWithImpl<EditSpan>(this as EditSpan, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EditSpan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditSpan&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startIndex, _this.startIndex) || other.startIndex == _this.startIndex)&&(identical(other.editId, _this.editId) || other.editId == _this.editId)&&(identical(other.geometrySource, _this.geometrySource) || other.geometrySource == _this.geometrySource)&&(identical(other.lengthM, _this.lengthM) || other.lengthM == _this.lengthM));
}


@override
int get hashCode {
  final _this = this as EditSpan;
  return Object.hash(runtimeType,_this.id,_this.startIndex,_this.editId,_this.geometrySource,_this.lengthM);
}

@override
String toString() {
  final _this = this as EditSpan;
  return 'EditSpan(id: ${_this.id}, startIndex: ${_this.startIndex}, editId: ${_this.editId}, geometrySource: ${_this.geometrySource}, lengthM: ${_this.lengthM})';
}


}

/// @nodoc
abstract mixin class $EditSpanCopyWith<$Res>  {
  factory $EditSpanCopyWith(EditSpan value, $Res Function(EditSpan) _then) = _$EditSpanCopyWithImpl;
@useResult
$Res call({
 SpanId id, int startIndex, EditId editId, GeometrySource geometrySource, double? lengthM
});




}
/// @nodoc
class _$EditSpanCopyWithImpl<$Res>
    implements $EditSpanCopyWith<$Res> {
  _$EditSpanCopyWithImpl(this._self, this._then);

  final EditSpan _self;
  final $Res Function(EditSpan) _then;

/// Create a copy of EditSpan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startIndex = null,Object? editId = null,Object? geometrySource = null,Object? lengthM = freezed,}) {
  return _then(EditSpan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SpanId,startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,editId: null == editId ? _self.editId : editId // ignore: cast_nullable_to_non_nullable
as EditId,geometrySource: null == geometrySource ? _self.geometrySource : geometrySource // ignore: cast_nullable_to_non_nullable
as GeometrySource,lengthM: freezed == lengthM ? _self.lengthM : lengthM // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [EditSpan].
extension EditSpanPatterns on EditSpan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditSpan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditSpan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditSpan value)  $default,){
final _that = this;
switch (_that) {
case _EditSpan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditSpan value)?  $default,){
final _that = this;
switch (_that) {
case _EditSpan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SpanId id,  int startIndex,  EditId editId,  GeometrySource geometrySource,  double? lengthM)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditSpan() when $default != null:
return $default(_that.id,_that.startIndex,_that.editId,_that.geometrySource,_that.lengthM);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SpanId id,  int startIndex,  EditId editId,  GeometrySource geometrySource,  double? lengthM)  $default,) {final _that = this;
switch (_that) {
case _EditSpan():
return $default(_that.id,_that.startIndex,_that.editId,_that.geometrySource,_that.lengthM);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SpanId id,  int startIndex,  EditId editId,  GeometrySource geometrySource,  double? lengthM)?  $default,) {final _that = this;
switch (_that) {
case _EditSpan() when $default != null:
return $default(_that.id,_that.startIndex,_that.editId,_that.geometrySource,_that.lengthM);case _:
  return null;

}
}

}

/// @nodoc


class _EditSpan implements EditSpan {
  const _EditSpan({required this.id, required this.startIndex, required this.editId, required this.geometrySource, this.lengthM});
  

@override final  SpanId id;
@override final  int startIndex;
@override final  EditId editId;
@override final  GeometrySource geometrySource;
@override final  double? lengthM;

/// Create a copy of EditSpan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditSpanCopyWith<_EditSpan> get copyWith => __$EditSpanCopyWithImpl<_EditSpan>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditSpan&&(identical(other.id, id) || other.id == id)&&(identical(other.startIndex, startIndex) || other.startIndex == startIndex)&&(identical(other.editId, editId) || other.editId == editId)&&(identical(other.geometrySource, geometrySource) || other.geometrySource == geometrySource)&&(identical(other.lengthM, lengthM) || other.lengthM == lengthM));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,startIndex,editId,geometrySource,lengthM);
}

@override
String toString() {
    return 'EditSpan(id: $id, startIndex: $startIndex, editId: $editId, geometrySource: $geometrySource, lengthM: $lengthM)';
}


}

/// @nodoc
abstract mixin class _$EditSpanCopyWith<$Res> implements $EditSpanCopyWith<$Res> {
  factory _$EditSpanCopyWith(_EditSpan value, $Res Function(_EditSpan) _then) = __$EditSpanCopyWithImpl;
@override @useResult
$Res call({
 SpanId id, int startIndex, EditId editId, GeometrySource geometrySource, double? lengthM
});




}
/// @nodoc
class __$EditSpanCopyWithImpl<$Res>
    implements _$EditSpanCopyWith<$Res> {
  __$EditSpanCopyWithImpl(this._self, this._then);

  final _EditSpan _self;
  final $Res Function(_EditSpan) _then;

/// Create a copy of EditSpan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startIndex = null,Object? editId = null,Object? geometrySource = null,Object? lengthM = freezed,}) {
  return _then(_EditSpan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SpanId,startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,editId: null == editId ? _self.editId : editId // ignore: cast_nullable_to_non_nullable
as EditId,geometrySource: null == geometrySource ? _self.geometrySource : geometrySource // ignore: cast_nullable_to_non_nullable
as GeometrySource,lengthM: freezed == lengthM ? _self.lengthM : lengthM // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
