// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'segment_overlay.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SegmentOverlay {

 List<LatLng> get geometry; bool get recomputing; Object? get error;
/// Create a copy of SegmentOverlay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentOverlayCopyWith<SegmentOverlay> get copyWith => _$SegmentOverlayCopyWithImpl<SegmentOverlay>(this as SegmentOverlay, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentOverlay&&const DeepCollectionEquality().equals(other.geometry, geometry)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(geometry),recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'SegmentOverlay(geometry: $geometry, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class $SegmentOverlayCopyWith<$Res>  {
  factory $SegmentOverlayCopyWith(SegmentOverlay value, $Res Function(SegmentOverlay) _then) = _$SegmentOverlayCopyWithImpl;
@useResult
$Res call({
 List<LatLng> geometry, bool recomputing, Object? error
});




}
/// @nodoc
class _$SegmentOverlayCopyWithImpl<$Res>
    implements $SegmentOverlayCopyWith<$Res> {
  _$SegmentOverlayCopyWithImpl(this._self, this._then);

  final SegmentOverlay _self;
  final $Res Function(SegmentOverlay) _then;

/// Create a copy of SegmentOverlay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? geometry = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [SegmentOverlay].
extension SegmentOverlayPatterns on SegmentOverlay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SegmentOverlay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SegmentOverlay() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SegmentOverlay value)  $default,){
final _that = this;
switch (_that) {
case _SegmentOverlay():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SegmentOverlay value)?  $default,){
final _that = this;
switch (_that) {
case _SegmentOverlay() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LatLng> geometry,  bool recomputing,  Object? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SegmentOverlay() when $default != null:
return $default(_that.geometry,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LatLng> geometry,  bool recomputing,  Object? error)  $default,) {final _that = this;
switch (_that) {
case _SegmentOverlay():
return $default(_that.geometry,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LatLng> geometry,  bool recomputing,  Object? error)?  $default,) {final _that = this;
switch (_that) {
case _SegmentOverlay() when $default != null:
return $default(_that.geometry,_that.recomputing,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SegmentOverlay implements SegmentOverlay {
  const _SegmentOverlay({required final  List<LatLng> geometry, this.recomputing = false, this.error}): _geometry = geometry;
  

 final  List<LatLng> _geometry;
@override List<LatLng> get geometry {
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometry);
}

@override@JsonKey() final  bool recomputing;
@override final  Object? error;

/// Create a copy of SegmentOverlay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SegmentOverlayCopyWith<_SegmentOverlay> get copyWith => __$SegmentOverlayCopyWithImpl<_SegmentOverlay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SegmentOverlay&&const DeepCollectionEquality().equals(other._geometry, _geometry)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_geometry),recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'SegmentOverlay(geometry: $geometry, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SegmentOverlayCopyWith<$Res> implements $SegmentOverlayCopyWith<$Res> {
  factory _$SegmentOverlayCopyWith(_SegmentOverlay value, $Res Function(_SegmentOverlay) _then) = __$SegmentOverlayCopyWithImpl;
@override @useResult
$Res call({
 List<LatLng> geometry, bool recomputing, Object? error
});




}
/// @nodoc
class __$SegmentOverlayCopyWithImpl<$Res>
    implements _$SegmentOverlayCopyWith<$Res> {
  __$SegmentOverlayCopyWithImpl(this._self, this._then);

  final _SegmentOverlay _self;
  final $Res Function(_SegmentOverlay) _then;

/// Create a copy of SegmentOverlay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? geometry = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_SegmentOverlay(
geometry: null == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
