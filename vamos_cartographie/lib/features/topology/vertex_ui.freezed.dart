// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vertex_ui.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VertexUi {

 VertexUiId get id; LatLng get position; bool get isOptimistic; PoiCategory? get poiCategory;
/// Create a copy of VertexUi
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VertexUiCopyWith<VertexUi> get copyWith => _$VertexUiCopyWithImpl<VertexUi>(this as VertexUi, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VertexUi&&(identical(other.id, id) || other.id == id)&&(identical(other.position, position) || other.position == position)&&(identical(other.isOptimistic, isOptimistic) || other.isOptimistic == isOptimistic)&&(identical(other.poiCategory, poiCategory) || other.poiCategory == poiCategory));
}


@override
int get hashCode => Object.hash(runtimeType,id,position,isOptimistic,poiCategory);

@override
String toString() {
  return 'VertexUi(id: $id, position: $position, isOptimistic: $isOptimistic, poiCategory: $poiCategory)';
}


}

/// @nodoc
abstract mixin class $VertexUiCopyWith<$Res>  {
  factory $VertexUiCopyWith(VertexUi value, $Res Function(VertexUi) _then) = _$VertexUiCopyWithImpl;
@useResult
$Res call({
 VertexUiId id, LatLng position, bool isOptimistic, PoiCategory? poiCategory
});




}
/// @nodoc
class _$VertexUiCopyWithImpl<$Res>
    implements $VertexUiCopyWith<$Res> {
  _$VertexUiCopyWithImpl(this._self, this._then);

  final VertexUi _self;
  final $Res Function(VertexUi) _then;

/// Create a copy of VertexUi
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? position = null,Object? isOptimistic = null,Object? poiCategory = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as VertexUiId,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,isOptimistic: null == isOptimistic ? _self.isOptimistic : isOptimistic // ignore: cast_nullable_to_non_nullable
as bool,poiCategory: freezed == poiCategory ? _self.poiCategory : poiCategory // ignore: cast_nullable_to_non_nullable
as PoiCategory?,
  ));
}

}


/// Adds pattern-matching-related methods to [VertexUi].
extension VertexUiPatterns on VertexUi {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VertexUi value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VertexUi() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VertexUi value)  $default,){
final _that = this;
switch (_that) {
case _VertexUi():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VertexUi value)?  $default,){
final _that = this;
switch (_that) {
case _VertexUi() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VertexUiId id,  LatLng position,  bool isOptimistic,  PoiCategory? poiCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VertexUi() when $default != null:
return $default(_that.id,_that.position,_that.isOptimistic,_that.poiCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VertexUiId id,  LatLng position,  bool isOptimistic,  PoiCategory? poiCategory)  $default,) {final _that = this;
switch (_that) {
case _VertexUi():
return $default(_that.id,_that.position,_that.isOptimistic,_that.poiCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VertexUiId id,  LatLng position,  bool isOptimistic,  PoiCategory? poiCategory)?  $default,) {final _that = this;
switch (_that) {
case _VertexUi() when $default != null:
return $default(_that.id,_that.position,_that.isOptimistic,_that.poiCategory);case _:
  return null;

}
}

}

/// @nodoc


class _VertexUi implements VertexUi {
  const _VertexUi({required this.id, required this.position, required this.isOptimistic, required this.poiCategory});
  

@override final  VertexUiId id;
@override final  LatLng position;
@override final  bool isOptimistic;
@override final  PoiCategory? poiCategory;

/// Create a copy of VertexUi
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VertexUiCopyWith<_VertexUi> get copyWith => __$VertexUiCopyWithImpl<_VertexUi>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VertexUi&&(identical(other.id, id) || other.id == id)&&(identical(other.position, position) || other.position == position)&&(identical(other.isOptimistic, isOptimistic) || other.isOptimistic == isOptimistic)&&(identical(other.poiCategory, poiCategory) || other.poiCategory == poiCategory));
}


@override
int get hashCode => Object.hash(runtimeType,id,position,isOptimistic,poiCategory);

@override
String toString() {
  return 'VertexUi(id: $id, position: $position, isOptimistic: $isOptimistic, poiCategory: $poiCategory)';
}


}

/// @nodoc
abstract mixin class _$VertexUiCopyWith<$Res> implements $VertexUiCopyWith<$Res> {
  factory _$VertexUiCopyWith(_VertexUi value, $Res Function(_VertexUi) _then) = __$VertexUiCopyWithImpl;
@override @useResult
$Res call({
 VertexUiId id, LatLng position, bool isOptimistic, PoiCategory? poiCategory
});




}
/// @nodoc
class __$VertexUiCopyWithImpl<$Res>
    implements _$VertexUiCopyWith<$Res> {
  __$VertexUiCopyWithImpl(this._self, this._then);

  final _VertexUi _self;
  final $Res Function(_VertexUi) _then;

/// Create a copy of VertexUi
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? position = null,Object? isOptimistic = null,Object? poiCategory = freezed,}) {
  return _then(_VertexUi(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as VertexUiId,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,isOptimistic: null == isOptimistic ? _self.isOptimistic : isOptimistic // ignore: cast_nullable_to_non_nullable
as bool,poiCategory: freezed == poiCategory ? _self.poiCategory : poiCategory // ignore: cast_nullable_to_non_nullable
as PoiCategory?,
  ));
}


}

// dart format on
