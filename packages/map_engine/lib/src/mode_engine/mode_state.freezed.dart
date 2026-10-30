// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mode_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModeState {

 Mode get mode; Overlay? get overlay; Slots get slots; bool get overlayVisible;
/// Create a copy of ModeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModeStateCopyWith<ModeState> get copyWith => _$ModeStateCopyWithImpl<ModeState>(this as ModeState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ModeState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModeState&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.overlay, _this.overlay) || other.overlay == _this.overlay)&&(identical(other.slots, _this.slots) || other.slots == _this.slots)&&(identical(other.overlayVisible, _this.overlayVisible) || other.overlayVisible == _this.overlayVisible));
}


@override
int get hashCode {
  final _this = this as ModeState;
  return Object.hash(runtimeType,_this.mode,_this.overlay,_this.slots,_this.overlayVisible);
}

@override
String toString() {
  final _this = this as ModeState;
  return 'ModeState(mode: ${_this.mode}, overlay: ${_this.overlay}, slots: ${_this.slots}, overlayVisible: ${_this.overlayVisible})';
}


}

/// @nodoc
abstract mixin class $ModeStateCopyWith<$Res>  {
  factory $ModeStateCopyWith(ModeState value, $Res Function(ModeState) _then) = _$ModeStateCopyWithImpl;
@useResult
$Res call({
 Mode mode, Overlay? overlay, Slots slots, bool overlayVisible
});




}
/// @nodoc
class _$ModeStateCopyWithImpl<$Res>
    implements $ModeStateCopyWith<$Res> {
  _$ModeStateCopyWithImpl(this._self, this._then);

  final ModeState _self;
  final $Res Function(ModeState) _then;

/// Create a copy of ModeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? overlay = freezed,Object? slots = null,Object? overlayVisible = null,}) {
  return _then(ModeState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as Mode,overlay: freezed == overlay ? _self.overlay : overlay // ignore: cast_nullable_to_non_nullable
as Overlay?,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as Slots,overlayVisible: null == overlayVisible ? _self.overlayVisible : overlayVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ModeState].
extension ModeStatePatterns on ModeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModeState value)  $default,){
final _that = this;
switch (_that) {
case _ModeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModeState value)?  $default,){
final _that = this;
switch (_that) {
case _ModeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Mode mode,  Overlay? overlay,  Slots slots,  bool overlayVisible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModeState() when $default != null:
return $default(_that.mode,_that.overlay,_that.slots,_that.overlayVisible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Mode mode,  Overlay? overlay,  Slots slots,  bool overlayVisible)  $default,) {final _that = this;
switch (_that) {
case _ModeState():
return $default(_that.mode,_that.overlay,_that.slots,_that.overlayVisible);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Mode mode,  Overlay? overlay,  Slots slots,  bool overlayVisible)?  $default,) {final _that = this;
switch (_that) {
case _ModeState() when $default != null:
return $default(_that.mode,_that.overlay,_that.slots,_that.overlayVisible);case _:
  return null;

}
}

}

/// @nodoc


class _ModeState extends ModeState {
  const _ModeState({required this.mode, this.overlay, this.slots = Slots.empty, this.overlayVisible = true}): super._();
  

@override final  Mode mode;
@override final  Overlay? overlay;
@override@JsonKey() final  Slots slots;
@override@JsonKey() final  bool overlayVisible;

/// Create a copy of ModeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModeStateCopyWith<_ModeState> get copyWith => __$ModeStateCopyWithImpl<_ModeState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModeState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.overlay, overlay) || other.overlay == overlay)&&(identical(other.slots, slots) || other.slots == slots)&&(identical(other.overlayVisible, overlayVisible) || other.overlayVisible == overlayVisible));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,overlay,slots,overlayVisible);
}

@override
String toString() {
    return 'ModeState(mode: $mode, overlay: $overlay, slots: $slots, overlayVisible: $overlayVisible)';
}


}

/// @nodoc
abstract mixin class _$ModeStateCopyWith<$Res> implements $ModeStateCopyWith<$Res> {
  factory _$ModeStateCopyWith(_ModeState value, $Res Function(_ModeState) _then) = __$ModeStateCopyWithImpl;
@override @useResult
$Res call({
 Mode mode, Overlay? overlay, Slots slots, bool overlayVisible
});




}
/// @nodoc
class __$ModeStateCopyWithImpl<$Res>
    implements _$ModeStateCopyWith<$Res> {
  __$ModeStateCopyWithImpl(this._self, this._then);

  final _ModeState _self;
  final $Res Function(_ModeState) _then;

/// Create a copy of ModeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? overlay = freezed,Object? slots = null,Object? overlayVisible = null,}) {
  return _then(_ModeState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as Mode,overlay: freezed == overlay ? _self.overlay : overlay // ignore: cast_nullable_to_non_nullable
as Overlay?,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as Slots,overlayVisible: null == overlayVisible ? _self.overlayVisible : overlayVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
