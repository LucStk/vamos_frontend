// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'segment_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SegmentUiModel {

 Geometry get geometry; Geometry get mobilityMarker; bool get isOptimistic;
/// Create a copy of SegmentUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentUiModelCopyWith<SegmentUiModel> get copyWith => _$SegmentUiModelCopyWithImpl<SegmentUiModel>(this as SegmentUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentUiModel&&const DeepCollectionEquality().equals(other.geometry, geometry)&&const DeepCollectionEquality().equals(other.mobilityMarker, mobilityMarker)&&(identical(other.isOptimistic, isOptimistic) || other.isOptimistic == isOptimistic));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(geometry),const DeepCollectionEquality().hash(mobilityMarker),isOptimistic);

@override
String toString() {
  return 'SegmentUiModel(geometry: $geometry, mobilityMarker: $mobilityMarker, isOptimistic: $isOptimistic)';
}


}

/// @nodoc
abstract mixin class $SegmentUiModelCopyWith<$Res>  {
  factory $SegmentUiModelCopyWith(SegmentUiModel value, $Res Function(SegmentUiModel) _then) = _$SegmentUiModelCopyWithImpl;
@useResult
$Res call({
 Geometry geometry, Geometry mobilityMarker, bool isOptimistic
});




}
/// @nodoc
class _$SegmentUiModelCopyWithImpl<$Res>
    implements $SegmentUiModelCopyWith<$Res> {
  _$SegmentUiModelCopyWithImpl(this._self, this._then);

  final SegmentUiModel _self;
  final $Res Function(SegmentUiModel) _then;

/// Create a copy of SegmentUiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? geometry = null,Object? mobilityMarker = null,Object? isOptimistic = null,}) {
  return _then(_self.copyWith(
geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as Geometry,mobilityMarker: null == mobilityMarker ? _self.mobilityMarker : mobilityMarker // ignore: cast_nullable_to_non_nullable
as Geometry,isOptimistic: null == isOptimistic ? _self.isOptimistic : isOptimistic // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SegmentUiModel].
extension SegmentUiModelPatterns on SegmentUiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SegmentUiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SegmentUiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SegmentUiModel value)  $default,){
final _that = this;
switch (_that) {
case _SegmentUiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SegmentUiModel value)?  $default,){
final _that = this;
switch (_that) {
case _SegmentUiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Geometry geometry,  Geometry mobilityMarker,  bool isOptimistic)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SegmentUiModel() when $default != null:
return $default(_that.geometry,_that.mobilityMarker,_that.isOptimistic);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Geometry geometry,  Geometry mobilityMarker,  bool isOptimistic)  $default,) {final _that = this;
switch (_that) {
case _SegmentUiModel():
return $default(_that.geometry,_that.mobilityMarker,_that.isOptimistic);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Geometry geometry,  Geometry mobilityMarker,  bool isOptimistic)?  $default,) {final _that = this;
switch (_that) {
case _SegmentUiModel() when $default != null:
return $default(_that.geometry,_that.mobilityMarker,_that.isOptimistic);case _:
  return null;

}
}

}

/// @nodoc


class _SegmentUiModel implements SegmentUiModel {
  const _SegmentUiModel({required final  Geometry geometry, required final  Geometry mobilityMarker, required this.isOptimistic}): _geometry = geometry,_mobilityMarker = mobilityMarker;
  

 final  Geometry _geometry;
@override Geometry get geometry {
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometry);
}

 final  Geometry _mobilityMarker;
@override Geometry get mobilityMarker {
  if (_mobilityMarker is EqualUnmodifiableListView) return _mobilityMarker;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mobilityMarker);
}

@override final  bool isOptimistic;

/// Create a copy of SegmentUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SegmentUiModelCopyWith<_SegmentUiModel> get copyWith => __$SegmentUiModelCopyWithImpl<_SegmentUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SegmentUiModel&&const DeepCollectionEquality().equals(other._geometry, _geometry)&&const DeepCollectionEquality().equals(other._mobilityMarker, _mobilityMarker)&&(identical(other.isOptimistic, isOptimistic) || other.isOptimistic == isOptimistic));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_geometry),const DeepCollectionEquality().hash(_mobilityMarker),isOptimistic);

@override
String toString() {
  return 'SegmentUiModel(geometry: $geometry, mobilityMarker: $mobilityMarker, isOptimistic: $isOptimistic)';
}


}

/// @nodoc
abstract mixin class _$SegmentUiModelCopyWith<$Res> implements $SegmentUiModelCopyWith<$Res> {
  factory _$SegmentUiModelCopyWith(_SegmentUiModel value, $Res Function(_SegmentUiModel) _then) = __$SegmentUiModelCopyWithImpl;
@override @useResult
$Res call({
 Geometry geometry, Geometry mobilityMarker, bool isOptimistic
});




}
/// @nodoc
class __$SegmentUiModelCopyWithImpl<$Res>
    implements _$SegmentUiModelCopyWith<$Res> {
  __$SegmentUiModelCopyWithImpl(this._self, this._then);

  final _SegmentUiModel _self;
  final $Res Function(_SegmentUiModel) _then;

/// Create a copy of SegmentUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? geometry = null,Object? mobilityMarker = null,Object? isOptimistic = null,}) {
  return _then(_SegmentUiModel(
geometry: null == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as Geometry,mobilityMarker: null == mobilityMarker ? _self._mobilityMarker : mobilityMarker // ignore: cast_nullable_to_non_nullable
as Geometry,isOptimistic: null == isOptimistic ? _self.isOptimistic : isOptimistic // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
