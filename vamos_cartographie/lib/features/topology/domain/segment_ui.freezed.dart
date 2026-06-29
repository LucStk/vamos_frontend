// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'segment_ui.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SegmentUi {

 SegmentRef get id; Geometry get geometry; bool get isOptimistic; MobilityTypeDisplay get mobilityType;
/// Create a copy of SegmentUi
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentUiCopyWith<SegmentUi> get copyWith => _$SegmentUiCopyWithImpl<SegmentUi>(this as SegmentUi, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentUi&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.geometry, geometry)&&(identical(other.isOptimistic, isOptimistic) || other.isOptimistic == isOptimistic)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(geometry),isOptimistic,mobilityType);

@override
String toString() {
  return 'SegmentUi(id: $id, geometry: $geometry, isOptimistic: $isOptimistic, mobilityType: $mobilityType)';
}


}

/// @nodoc
abstract mixin class $SegmentUiCopyWith<$Res>  {
  factory $SegmentUiCopyWith(SegmentUi value, $Res Function(SegmentUi) _then) = _$SegmentUiCopyWithImpl;
@useResult
$Res call({
 SegmentRef id, Geometry geometry, bool isOptimistic, MobilityTypeDisplay mobilityType
});




}
/// @nodoc
class _$SegmentUiCopyWithImpl<$Res>
    implements $SegmentUiCopyWith<$Res> {
  _$SegmentUiCopyWithImpl(this._self, this._then);

  final SegmentUi _self;
  final $Res Function(SegmentUi) _then;

/// Create a copy of SegmentUi
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? geometry = null,Object? isOptimistic = null,Object? mobilityType = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SegmentRef,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as Geometry,isOptimistic: null == isOptimistic ? _self.isOptimistic : isOptimistic // ignore: cast_nullable_to_non_nullable
as bool,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityTypeDisplay,
  ));
}

}


/// Adds pattern-matching-related methods to [SegmentUi].
extension SegmentUiPatterns on SegmentUi {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SegmentUi value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SegmentUi() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SegmentUi value)  $default,){
final _that = this;
switch (_that) {
case _SegmentUi():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SegmentUi value)?  $default,){
final _that = this;
switch (_that) {
case _SegmentUi() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SegmentRef id,  Geometry geometry,  bool isOptimistic,  MobilityTypeDisplay mobilityType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SegmentUi() when $default != null:
return $default(_that.id,_that.geometry,_that.isOptimistic,_that.mobilityType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SegmentRef id,  Geometry geometry,  bool isOptimistic,  MobilityTypeDisplay mobilityType)  $default,) {final _that = this;
switch (_that) {
case _SegmentUi():
return $default(_that.id,_that.geometry,_that.isOptimistic,_that.mobilityType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SegmentRef id,  Geometry geometry,  bool isOptimistic,  MobilityTypeDisplay mobilityType)?  $default,) {final _that = this;
switch (_that) {
case _SegmentUi() when $default != null:
return $default(_that.id,_that.geometry,_that.isOptimistic,_that.mobilityType);case _:
  return null;

}
}

}

/// @nodoc


class _SegmentUi extends SegmentUi {
  const _SegmentUi({required this.id, required final  Geometry geometry, required this.isOptimistic, required this.mobilityType}): _geometry = geometry,super._();
  

@override final  SegmentRef id;
 final  Geometry _geometry;
@override Geometry get geometry {
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometry);
}

@override final  bool isOptimistic;
@override final  MobilityTypeDisplay mobilityType;

/// Create a copy of SegmentUi
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SegmentUiCopyWith<_SegmentUi> get copyWith => __$SegmentUiCopyWithImpl<_SegmentUi>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SegmentUi&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._geometry, _geometry)&&(identical(other.isOptimistic, isOptimistic) || other.isOptimistic == isOptimistic)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_geometry),isOptimistic,mobilityType);

@override
String toString() {
  return 'SegmentUi(id: $id, geometry: $geometry, isOptimistic: $isOptimistic, mobilityType: $mobilityType)';
}


}

/// @nodoc
abstract mixin class _$SegmentUiCopyWith<$Res> implements $SegmentUiCopyWith<$Res> {
  factory _$SegmentUiCopyWith(_SegmentUi value, $Res Function(_SegmentUi) _then) = __$SegmentUiCopyWithImpl;
@override @useResult
$Res call({
 SegmentRef id, Geometry geometry, bool isOptimistic, MobilityTypeDisplay mobilityType
});




}
/// @nodoc
class __$SegmentUiCopyWithImpl<$Res>
    implements _$SegmentUiCopyWith<$Res> {
  __$SegmentUiCopyWithImpl(this._self, this._then);

  final _SegmentUi _self;
  final $Res Function(_SegmentUi) _then;

/// Create a copy of SegmentUi
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? geometry = null,Object? isOptimistic = null,Object? mobilityType = null,}) {
  return _then(_SegmentUi(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SegmentRef,geometry: null == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as Geometry,isOptimistic: null == isOptimistic ? _self.isOptimistic : isOptimistic // ignore: cast_nullable_to_non_nullable
as bool,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityTypeDisplay,
  ));
}


}

// dart format on
