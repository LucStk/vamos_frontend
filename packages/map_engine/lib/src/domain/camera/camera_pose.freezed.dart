// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_pose.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CameraPose {

 LatLng get center;/// Niveau de zoom natif flutter_map (pas `zoomScale`).
 double get zoom; double get rotationDeg;
/// Create a copy of CameraPose
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraPoseCopyWith<CameraPose> get copyWith => _$CameraPoseCopyWithImpl<CameraPose>(this as CameraPose, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CameraPose;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraPose&&(identical(other.center, _this.center) || other.center == _this.center)&&(identical(other.zoom, _this.zoom) || other.zoom == _this.zoom)&&(identical(other.rotationDeg, _this.rotationDeg) || other.rotationDeg == _this.rotationDeg));
}


@override
int get hashCode {
  final _this = this as CameraPose;
  return Object.hash(runtimeType,_this.center,_this.zoom,_this.rotationDeg);
}

@override
String toString() {
  final _this = this as CameraPose;
  return 'CameraPose(center: ${_this.center}, zoom: ${_this.zoom}, rotationDeg: ${_this.rotationDeg})';
}


}

/// @nodoc
abstract mixin class $CameraPoseCopyWith<$Res>  {
  factory $CameraPoseCopyWith(CameraPose value, $Res Function(CameraPose) _then) = _$CameraPoseCopyWithImpl;
@useResult
$Res call({
 LatLng center, double zoom, double rotationDeg
});




}
/// @nodoc
class _$CameraPoseCopyWithImpl<$Res>
    implements $CameraPoseCopyWith<$Res> {
  _$CameraPoseCopyWithImpl(this._self, this._then);

  final CameraPose _self;
  final $Res Function(CameraPose) _then;

/// Create a copy of CameraPose
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? center = null,Object? zoom = null,Object? rotationDeg = null,}) {
  return _then(CameraPose(
center: null == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as LatLng,zoom: null == zoom ? _self.zoom : zoom // ignore: cast_nullable_to_non_nullable
as double,rotationDeg: null == rotationDeg ? _self.rotationDeg : rotationDeg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CameraPose].
extension CameraPosePatterns on CameraPose {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CameraPose value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CameraPose() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CameraPose value)  $default,){
final _that = this;
switch (_that) {
case _CameraPose():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CameraPose value)?  $default,){
final _that = this;
switch (_that) {
case _CameraPose() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LatLng center,  double zoom,  double rotationDeg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CameraPose() when $default != null:
return $default(_that.center,_that.zoom,_that.rotationDeg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LatLng center,  double zoom,  double rotationDeg)  $default,) {final _that = this;
switch (_that) {
case _CameraPose():
return $default(_that.center,_that.zoom,_that.rotationDeg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LatLng center,  double zoom,  double rotationDeg)?  $default,) {final _that = this;
switch (_that) {
case _CameraPose() when $default != null:
return $default(_that.center,_that.zoom,_that.rotationDeg);case _:
  return null;

}
}

}

/// @nodoc


class _CameraPose implements CameraPose {
  const _CameraPose({required this.center, required this.zoom, required this.rotationDeg});
  

@override final  LatLng center;
/// Niveau de zoom natif flutter_map (pas `zoomScale`).
@override final  double zoom;
@override final  double rotationDeg;

/// Create a copy of CameraPose
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CameraPoseCopyWith<_CameraPose> get copyWith => __$CameraPoseCopyWithImpl<_CameraPose>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CameraPose&&(identical(other.center, center) || other.center == center)&&(identical(other.zoom, zoom) || other.zoom == zoom)&&(identical(other.rotationDeg, rotationDeg) || other.rotationDeg == rotationDeg));
}


@override
int get hashCode {
    return Object.hash(runtimeType,center,zoom,rotationDeg);
}

@override
String toString() {
    return 'CameraPose(center: $center, zoom: $zoom, rotationDeg: $rotationDeg)';
}


}

/// @nodoc
abstract mixin class _$CameraPoseCopyWith<$Res> implements $CameraPoseCopyWith<$Res> {
  factory _$CameraPoseCopyWith(_CameraPose value, $Res Function(_CameraPose) _then) = __$CameraPoseCopyWithImpl;
@override @useResult
$Res call({
 LatLng center, double zoom, double rotationDeg
});




}
/// @nodoc
class __$CameraPoseCopyWithImpl<$Res>
    implements _$CameraPoseCopyWith<$Res> {
  __$CameraPoseCopyWithImpl(this._self, this._then);

  final _CameraPose _self;
  final $Res Function(_CameraPose) _then;

/// Create a copy of CameraPose
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? center = null,Object? zoom = null,Object? rotationDeg = null,}) {
  return _then(_CameraPose(
center: null == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as LatLng,zoom: null == zoom ? _self.zoom : zoom // ignore: cast_nullable_to_non_nullable
as double,rotationDeg: null == rotationDeg ? _self.rotationDeg : rotationDeg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
