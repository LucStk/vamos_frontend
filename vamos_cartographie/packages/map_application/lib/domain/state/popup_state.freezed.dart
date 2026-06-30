// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PopUpState {

 LatLng get latLng;
/// Create a copy of PopUpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PopUpStateCopyWith<PopUpState> get copyWith => _$PopUpStateCopyWithImpl<PopUpState>(this as PopUpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopUpState&&(identical(other.latLng, latLng) || other.latLng == latLng));
}


@override
int get hashCode => Object.hash(runtimeType,latLng);

@override
String toString() {
  return 'PopUpState(latLng: $latLng)';
}


}

/// @nodoc
abstract mixin class $PopUpStateCopyWith<$Res>  {
  factory $PopUpStateCopyWith(PopUpState value, $Res Function(PopUpState) _then) = _$PopUpStateCopyWithImpl;
@useResult
$Res call({
 LatLng latLng
});




}
/// @nodoc
class _$PopUpStateCopyWithImpl<$Res>
    implements $PopUpStateCopyWith<$Res> {
  _$PopUpStateCopyWithImpl(this._self, this._then);

  final PopUpState _self;
  final $Res Function(PopUpState) _then;

/// Create a copy of PopUpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latLng = null,}) {
  return _then(_self.copyWith(
latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}

}


/// Adds pattern-matching-related methods to [PopUpState].
extension PopUpStatePatterns on PopUpState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PopUpState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PopUpState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PopUpState value)  $default,){
final _that = this;
switch (_that) {
case _PopUpState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PopUpState value)?  $default,){
final _that = this;
switch (_that) {
case _PopUpState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LatLng latLng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PopUpState() when $default != null:
return $default(_that.latLng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LatLng latLng)  $default,) {final _that = this;
switch (_that) {
case _PopUpState():
return $default(_that.latLng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LatLng latLng)?  $default,) {final _that = this;
switch (_that) {
case _PopUpState() when $default != null:
return $default(_that.latLng);case _:
  return null;

}
}

}

/// @nodoc


class _PopUpState implements PopUpState {
  const _PopUpState({required this.latLng});
  

@override final  LatLng latLng;

/// Create a copy of PopUpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PopUpStateCopyWith<_PopUpState> get copyWith => __$PopUpStateCopyWithImpl<_PopUpState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PopUpState&&(identical(other.latLng, latLng) || other.latLng == latLng));
}


@override
int get hashCode => Object.hash(runtimeType,latLng);

@override
String toString() {
  return 'PopUpState(latLng: $latLng)';
}


}

/// @nodoc
abstract mixin class _$PopUpStateCopyWith<$Res> implements $PopUpStateCopyWith<$Res> {
  factory _$PopUpStateCopyWith(_PopUpState value, $Res Function(_PopUpState) _then) = __$PopUpStateCopyWithImpl;
@override @useResult
$Res call({
 LatLng latLng
});




}
/// @nodoc
class __$PopUpStateCopyWithImpl<$Res>
    implements _$PopUpStateCopyWith<$Res> {
  __$PopUpStateCopyWithImpl(this._self, this._then);

  final _PopUpState _self;
  final $Res Function(_PopUpState) _then;

/// Create a copy of PopUpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latLng = null,}) {
  return _then(_PopUpState(
latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

// dart format on
