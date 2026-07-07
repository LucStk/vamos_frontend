// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vertex_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VertexUiModel {

 VertexRef get ref; LatLng get position;
/// Create a copy of VertexUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VertexUiModelCopyWith<VertexUiModel> get copyWith => _$VertexUiModelCopyWithImpl<VertexUiModel>(this as VertexUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VertexUiModel&&(identical(other.ref, ref) || other.ref == ref)&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,ref,position);

@override
String toString() {
  return 'VertexUiModel(ref: $ref, position: $position)';
}


}

/// @nodoc
abstract mixin class $VertexUiModelCopyWith<$Res>  {
  factory $VertexUiModelCopyWith(VertexUiModel value, $Res Function(VertexUiModel) _then) = _$VertexUiModelCopyWithImpl;
@useResult
$Res call({
 VertexRef ref, LatLng position
});


$VertexRefCopyWith<$Res> get ref;

}
/// @nodoc
class _$VertexUiModelCopyWithImpl<$Res>
    implements $VertexUiModelCopyWith<$Res> {
  _$VertexUiModelCopyWithImpl(this._self, this._then);

  final VertexUiModel _self;
  final $Res Function(VertexUiModel) _then;

/// Create a copy of VertexUiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ref = null,Object? position = null,}) {
  return _then(_self.copyWith(
ref: null == ref ? _self.ref : ref // ignore: cast_nullable_to_non_nullable
as VertexRef,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}
/// Create a copy of VertexUiModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VertexRefCopyWith<$Res> get ref {
  
  return $VertexRefCopyWith<$Res>(_self.ref, (value) {
    return _then(_self.copyWith(ref: value));
  });
}
}


/// Adds pattern-matching-related methods to [VertexUiModel].
extension VertexUiModelPatterns on VertexUiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VertexUiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VertexUiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VertexUiModel value)  $default,){
final _that = this;
switch (_that) {
case _VertexUiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VertexUiModel value)?  $default,){
final _that = this;
switch (_that) {
case _VertexUiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VertexRef ref,  LatLng position)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VertexUiModel() when $default != null:
return $default(_that.ref,_that.position);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VertexRef ref,  LatLng position)  $default,) {final _that = this;
switch (_that) {
case _VertexUiModel():
return $default(_that.ref,_that.position);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VertexRef ref,  LatLng position)?  $default,) {final _that = this;
switch (_that) {
case _VertexUiModel() when $default != null:
return $default(_that.ref,_that.position);case _:
  return null;

}
}

}

/// @nodoc


class _VertexUiModel implements VertexUiModel {
  const _VertexUiModel({required this.ref, required this.position});
  

@override final  VertexRef ref;
@override final  LatLng position;

/// Create a copy of VertexUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VertexUiModelCopyWith<_VertexUiModel> get copyWith => __$VertexUiModelCopyWithImpl<_VertexUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VertexUiModel&&(identical(other.ref, ref) || other.ref == ref)&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,ref,position);

@override
String toString() {
  return 'VertexUiModel(ref: $ref, position: $position)';
}


}

/// @nodoc
abstract mixin class _$VertexUiModelCopyWith<$Res> implements $VertexUiModelCopyWith<$Res> {
  factory _$VertexUiModelCopyWith(_VertexUiModel value, $Res Function(_VertexUiModel) _then) = __$VertexUiModelCopyWithImpl;
@override @useResult
$Res call({
 VertexRef ref, LatLng position
});


@override $VertexRefCopyWith<$Res> get ref;

}
/// @nodoc
class __$VertexUiModelCopyWithImpl<$Res>
    implements _$VertexUiModelCopyWith<$Res> {
  __$VertexUiModelCopyWithImpl(this._self, this._then);

  final _VertexUiModel _self;
  final $Res Function(_VertexUiModel) _then;

/// Create a copy of VertexUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ref = null,Object? position = null,}) {
  return _then(_VertexUiModel(
ref: null == ref ? _self.ref : ref // ignore: cast_nullable_to_non_nullable
as VertexRef,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}

/// Create a copy of VertexUiModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VertexRefCopyWith<$Res> get ref {
  
  return $VertexRefCopyWith<$Res>(_self.ref, (value) {
    return _then(_self.copyWith(ref: value));
  });
}
}

// dart format on
