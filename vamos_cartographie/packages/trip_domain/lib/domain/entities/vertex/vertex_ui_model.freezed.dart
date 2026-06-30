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

 VertexRef get id; LatLng get position; PoiCategory? get poiCategory;
/// Create a copy of VertexUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VertexUiModelCopyWith<VertexUiModel> get copyWith => _$VertexUiModelCopyWithImpl<VertexUiModel>(this as VertexUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VertexUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.position, position) || other.position == position)&&(identical(other.poiCategory, poiCategory) || other.poiCategory == poiCategory));
}


@override
int get hashCode => Object.hash(runtimeType,id,position,poiCategory);

@override
String toString() {
  return 'VertexUiModel(id: $id, position: $position, poiCategory: $poiCategory)';
}


}

/// @nodoc
abstract mixin class $VertexUiModelCopyWith<$Res>  {
  factory $VertexUiModelCopyWith(VertexUiModel value, $Res Function(VertexUiModel) _then) = _$VertexUiModelCopyWithImpl;
@useResult
$Res call({
 VertexRef id, LatLng position, PoiCategory? poiCategory
});




}
/// @nodoc
class _$VertexUiModelCopyWithImpl<$Res>
    implements $VertexUiModelCopyWith<$Res> {
  _$VertexUiModelCopyWithImpl(this._self, this._then);

  final VertexUiModel _self;
  final $Res Function(VertexUiModel) _then;

/// Create a copy of VertexUiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? position = null,Object? poiCategory = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as VertexRef,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,poiCategory: freezed == poiCategory ? _self.poiCategory : poiCategory // ignore: cast_nullable_to_non_nullable
as PoiCategory?,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VertexRef id,  LatLng position,  PoiCategory? poiCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VertexUiModel() when $default != null:
return $default(_that.id,_that.position,_that.poiCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VertexRef id,  LatLng position,  PoiCategory? poiCategory)  $default,) {final _that = this;
switch (_that) {
case _VertexUiModel():
return $default(_that.id,_that.position,_that.poiCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VertexRef id,  LatLng position,  PoiCategory? poiCategory)?  $default,) {final _that = this;
switch (_that) {
case _VertexUiModel() when $default != null:
return $default(_that.id,_that.position,_that.poiCategory);case _:
  return null;

}
}

}

/// @nodoc


class _VertexUiModel implements VertexUiModel {
  const _VertexUiModel({required this.id, required this.position, required this.poiCategory});
  

@override final  VertexRef id;
@override final  LatLng position;
@override final  PoiCategory? poiCategory;

/// Create a copy of VertexUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VertexUiModelCopyWith<_VertexUiModel> get copyWith => __$VertexUiModelCopyWithImpl<_VertexUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VertexUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.position, position) || other.position == position)&&(identical(other.poiCategory, poiCategory) || other.poiCategory == poiCategory));
}


@override
int get hashCode => Object.hash(runtimeType,id,position,poiCategory);

@override
String toString() {
  return 'VertexUiModel(id: $id, position: $position, poiCategory: $poiCategory)';
}


}

/// @nodoc
abstract mixin class _$VertexUiModelCopyWith<$Res> implements $VertexUiModelCopyWith<$Res> {
  factory _$VertexUiModelCopyWith(_VertexUiModel value, $Res Function(_VertexUiModel) _then) = __$VertexUiModelCopyWithImpl;
@override @useResult
$Res call({
 VertexRef id, LatLng position, PoiCategory? poiCategory
});




}
/// @nodoc
class __$VertexUiModelCopyWithImpl<$Res>
    implements _$VertexUiModelCopyWith<$Res> {
  __$VertexUiModelCopyWithImpl(this._self, this._then);

  final _VertexUiModel _self;
  final $Res Function(_VertexUiModel) _then;

/// Create a copy of VertexUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? position = null,Object? poiCategory = freezed,}) {
  return _then(_VertexUiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as VertexRef,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,poiCategory: freezed == poiCategory ? _self.poiCategory : poiCategory // ignore: cast_nullable_to_non_nullable
as PoiCategory?,
  ));
}


}

// dart format on
