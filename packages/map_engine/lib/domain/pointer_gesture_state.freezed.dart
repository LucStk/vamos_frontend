// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pointer_gesture_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PointerGestureState {

 GestureState get gesture; PendingTap? get pendingTap;
/// Create a copy of PointerGestureState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PointerGestureStateCopyWith<PointerGestureState> get copyWith => _$PointerGestureStateCopyWithImpl<PointerGestureState>(this as PointerGestureState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PointerGestureState&&(identical(other.gesture, gesture) || other.gesture == gesture)&&(identical(other.pendingTap, pendingTap) || other.pendingTap == pendingTap));
}


@override
int get hashCode => Object.hash(runtimeType,gesture,pendingTap);

@override
String toString() {
  return 'PointerGestureState(gesture: $gesture, pendingTap: $pendingTap)';
}


}

/// @nodoc
abstract mixin class $PointerGestureStateCopyWith<$Res>  {
  factory $PointerGestureStateCopyWith(PointerGestureState value, $Res Function(PointerGestureState) _then) = _$PointerGestureStateCopyWithImpl;
@useResult
$Res call({
 GestureState gesture, PendingTap? pendingTap
});




}
/// @nodoc
class _$PointerGestureStateCopyWithImpl<$Res>
    implements $PointerGestureStateCopyWith<$Res> {
  _$PointerGestureStateCopyWithImpl(this._self, this._then);

  final PointerGestureState _self;
  final $Res Function(PointerGestureState) _then;

/// Create a copy of PointerGestureState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gesture = null,Object? pendingTap = freezed,}) {
  return _then(_self.copyWith(
gesture: null == gesture ? _self.gesture : gesture // ignore: cast_nullable_to_non_nullable
as GestureState,pendingTap: freezed == pendingTap ? _self.pendingTap : pendingTap // ignore: cast_nullable_to_non_nullable
as PendingTap?,
  ));
}

}


/// Adds pattern-matching-related methods to [PointerGestureState].
extension PointerGestureStatePatterns on PointerGestureState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PointerGestureState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PointerGestureState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PointerGestureState value)  $default,){
final _that = this;
switch (_that) {
case _PointerGestureState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PointerGestureState value)?  $default,){
final _that = this;
switch (_that) {
case _PointerGestureState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GestureState gesture,  PendingTap? pendingTap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PointerGestureState() when $default != null:
return $default(_that.gesture,_that.pendingTap);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GestureState gesture,  PendingTap? pendingTap)  $default,) {final _that = this;
switch (_that) {
case _PointerGestureState():
return $default(_that.gesture,_that.pendingTap);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GestureState gesture,  PendingTap? pendingTap)?  $default,) {final _that = this;
switch (_that) {
case _PointerGestureState() when $default != null:
return $default(_that.gesture,_that.pendingTap);case _:
  return null;

}
}

}

/// @nodoc


class _PointerGestureState implements PointerGestureState {
  const _PointerGestureState({required this.gesture, this.pendingTap});
  

@override final  GestureState gesture;
@override final  PendingTap? pendingTap;

/// Create a copy of PointerGestureState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PointerGestureStateCopyWith<_PointerGestureState> get copyWith => __$PointerGestureStateCopyWithImpl<_PointerGestureState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PointerGestureState&&(identical(other.gesture, gesture) || other.gesture == gesture)&&(identical(other.pendingTap, pendingTap) || other.pendingTap == pendingTap));
}


@override
int get hashCode => Object.hash(runtimeType,gesture,pendingTap);

@override
String toString() {
  return 'PointerGestureState(gesture: $gesture, pendingTap: $pendingTap)';
}


}

/// @nodoc
abstract mixin class _$PointerGestureStateCopyWith<$Res> implements $PointerGestureStateCopyWith<$Res> {
  factory _$PointerGestureStateCopyWith(_PointerGestureState value, $Res Function(_PointerGestureState) _then) = __$PointerGestureStateCopyWithImpl;
@override @useResult
$Res call({
 GestureState gesture, PendingTap? pendingTap
});




}
/// @nodoc
class __$PointerGestureStateCopyWithImpl<$Res>
    implements _$PointerGestureStateCopyWith<$Res> {
  __$PointerGestureStateCopyWithImpl(this._self, this._then);

  final _PointerGestureState _self;
  final $Res Function(_PointerGestureState) _then;

/// Create a copy of PointerGestureState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gesture = null,Object? pendingTap = freezed,}) {
  return _then(_PointerGestureState(
gesture: null == gesture ? _self.gesture : gesture // ignore: cast_nullable_to_non_nullable
as GestureState,pendingTap: freezed == pendingTap ? _self.pendingTap : pendingTap // ignore: cast_nullable_to_non_nullable
as PendingTap?,
  ));
}


}

// dart format on
