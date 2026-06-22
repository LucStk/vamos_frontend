// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vertex_patch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VertexPatch {

 LatLng get positionOverride; PoiCategory? get type; bool get recomputing; Object? get error;
/// Create a copy of VertexPatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VertexPatchCopyWith<VertexPatch> get copyWith => _$VertexPatchCopyWithImpl<VertexPatch>(this as VertexPatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VertexPatch&&(identical(other.positionOverride, positionOverride) || other.positionOverride == positionOverride)&&(identical(other.type, type) || other.type == type)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,positionOverride,type,recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'VertexPatch(positionOverride: $positionOverride, type: $type, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class $VertexPatchCopyWith<$Res>  {
  factory $VertexPatchCopyWith(VertexPatch value, $Res Function(VertexPatch) _then) = _$VertexPatchCopyWithImpl;
@useResult
$Res call({
 LatLng positionOverride, PoiCategory? type, bool recomputing, Object? error
});




}
/// @nodoc
class _$VertexPatchCopyWithImpl<$Res>
    implements $VertexPatchCopyWith<$Res> {
  _$VertexPatchCopyWithImpl(this._self, this._then);

  final VertexPatch _self;
  final $Res Function(VertexPatch) _then;

/// Create a copy of VertexPatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? positionOverride = null,Object? type = freezed,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
positionOverride: null == positionOverride ? _self.positionOverride : positionOverride // ignore: cast_nullable_to_non_nullable
as LatLng,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PoiCategory?,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [VertexPatch].
extension VertexPatchPatterns on VertexPatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VertexPatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VertexPatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VertexPatch value)  $default,){
final _that = this;
switch (_that) {
case _VertexPatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VertexPatch value)?  $default,){
final _that = this;
switch (_that) {
case _VertexPatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LatLng positionOverride,  PoiCategory? type,  bool recomputing,  Object? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VertexPatch() when $default != null:
return $default(_that.positionOverride,_that.type,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LatLng positionOverride,  PoiCategory? type,  bool recomputing,  Object? error)  $default,) {final _that = this;
switch (_that) {
case _VertexPatch():
return $default(_that.positionOverride,_that.type,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LatLng positionOverride,  PoiCategory? type,  bool recomputing,  Object? error)?  $default,) {final _that = this;
switch (_that) {
case _VertexPatch() when $default != null:
return $default(_that.positionOverride,_that.type,_that.recomputing,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _VertexPatch implements VertexPatch {
  const _VertexPatch({required this.positionOverride, this.type = null, this.recomputing = false, this.error});
  

@override final  LatLng positionOverride;
@override@JsonKey() final  PoiCategory? type;
@override@JsonKey() final  bool recomputing;
@override final  Object? error;

/// Create a copy of VertexPatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VertexPatchCopyWith<_VertexPatch> get copyWith => __$VertexPatchCopyWithImpl<_VertexPatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VertexPatch&&(identical(other.positionOverride, positionOverride) || other.positionOverride == positionOverride)&&(identical(other.type, type) || other.type == type)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,positionOverride,type,recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'VertexPatch(positionOverride: $positionOverride, type: $type, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class _$VertexPatchCopyWith<$Res> implements $VertexPatchCopyWith<$Res> {
  factory _$VertexPatchCopyWith(_VertexPatch value, $Res Function(_VertexPatch) _then) = __$VertexPatchCopyWithImpl;
@override @useResult
$Res call({
 LatLng positionOverride, PoiCategory? type, bool recomputing, Object? error
});




}
/// @nodoc
class __$VertexPatchCopyWithImpl<$Res>
    implements _$VertexPatchCopyWith<$Res> {
  __$VertexPatchCopyWithImpl(this._self, this._then);

  final _VertexPatch _self;
  final $Res Function(_VertexPatch) _then;

/// Create a copy of VertexPatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? positionOverride = null,Object? type = freezed,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_VertexPatch(
positionOverride: null == positionOverride ? _self.positionOverride : positionOverride // ignore: cast_nullable_to_non_nullable
as LatLng,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PoiCategory?,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
