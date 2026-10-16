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
mixin _$ModeState<M extends Mode<M>> {

 M get mode; Overlay<M>? get overlay; Slots get slots; bool get overlayVisible;
/// Create a copy of ModeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModeStateCopyWith<M, ModeState<M>> get copyWith => _$ModeStateCopyWithImpl<M, ModeState<M>>(this as ModeState<M>, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ModeState<M>;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModeState<M>&&const DeepCollectionEquality().equals(other.mode, _this.mode)&&(identical(other.overlay, _this.overlay) || other.overlay == _this.overlay)&&(identical(other.slots, _this.slots) || other.slots == _this.slots)&&(identical(other.overlayVisible, _this.overlayVisible) || other.overlayVisible == _this.overlayVisible));
}


@override
int get hashCode {
  final _this = this as ModeState<M>;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.mode),_this.overlay,_this.slots,_this.overlayVisible);
}

@override
String toString() {
  final _this = this as ModeState<M>;
  return 'ModeState<$M>(mode: ${_this.mode}, overlay: ${_this.overlay}, slots: ${_this.slots}, overlayVisible: ${_this.overlayVisible})';
}


}

/// @nodoc
abstract mixin class $ModeStateCopyWith<M extends Mode<M>,$Res>  {
  factory $ModeStateCopyWith(ModeState<M> value, $Res Function(ModeState<M>) _then) = _$ModeStateCopyWithImpl;
@useResult
$Res call({
 M mode, Overlay<M>? overlay, Slots slots, bool overlayVisible
});




}
/// @nodoc
class _$ModeStateCopyWithImpl<M extends Mode<M>,$Res>
    implements $ModeStateCopyWith<M, $Res> {
  _$ModeStateCopyWithImpl(this._self, this._then);

  final ModeState<M> _self;
  final $Res Function(ModeState<M>) _then;

/// Create a copy of ModeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? overlay = freezed,Object? slots = null,Object? overlayVisible = null,}) {
  return _then(ModeState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as M,overlay: freezed == overlay ? _self.overlay : overlay // ignore: cast_nullable_to_non_nullable
as Overlay<M>?,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as Slots,overlayVisible: null == overlayVisible ? _self.overlayVisible : overlayVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ModeState].
extension ModeStatePatterns<M extends Mode<M>> on ModeState<M> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModeState<M> value)?  $default,{required TResult orElse(),}){
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModeState<M> value)  $default,){
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModeState<M> value)?  $default,){
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( M mode,  Overlay<M>? overlay,  Slots slots,  bool overlayVisible)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( M mode,  Overlay<M>? overlay,  Slots slots,  bool overlayVisible)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( M mode,  Overlay<M>? overlay,  Slots slots,  bool overlayVisible)?  $default,) {final _that = this;
switch (_that) {
case _ModeState() when $default != null:
return $default(_that.mode,_that.overlay,_that.slots,_that.overlayVisible);case _:
  return null;

}
}

}

/// @nodoc


class _ModeState<M extends Mode<M>> extends ModeState<M> {
  const _ModeState({required this.mode, this.overlay, this.slots = Slots.empty, this.overlayVisible = true}): super._();
  

@override final  M mode;
@override final  Overlay<M>? overlay;
@override@JsonKey() final  Slots slots;
@override@JsonKey() final  bool overlayVisible;

/// Create a copy of ModeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModeStateCopyWith<M, _ModeState<M>> get copyWith => __$ModeStateCopyWithImpl<M, _ModeState<M>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModeState<M>&&const DeepCollectionEquality().equals(other.mode, mode)&&(identical(other.overlay, overlay) || other.overlay == overlay)&&(identical(other.slots, slots) || other.slots == slots)&&(identical(other.overlayVisible, overlayVisible) || other.overlayVisible == overlayVisible));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(mode),overlay,slots,overlayVisible);
}

@override
String toString() {
    return 'ModeState<$M>(mode: $mode, overlay: $overlay, slots: $slots, overlayVisible: $overlayVisible)';
}


}

/// @nodoc
abstract mixin class _$ModeStateCopyWith<M extends Mode<M>,$Res> implements $ModeStateCopyWith<M, $Res> {
  factory _$ModeStateCopyWith(_ModeState<M> value, $Res Function(_ModeState<M>) _then) = __$ModeStateCopyWithImpl;
@override @useResult
$Res call({
 M mode, Overlay<M>? overlay, Slots slots, bool overlayVisible
});




}
/// @nodoc
class __$ModeStateCopyWithImpl<M extends Mode<M>,$Res>
    implements _$ModeStateCopyWith<M, $Res> {
  __$ModeStateCopyWithImpl(this._self, this._then);

  final _ModeState<M> _self;
  final $Res Function(_ModeState<M>) _then;

/// Create a copy of ModeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? overlay = freezed,Object? slots = null,Object? overlayVisible = null,}) {
  return _then(_ModeState<M>(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as M,overlay: freezed == overlay ? _self.overlay : overlay // ignore: cast_nullable_to_non_nullable
as Overlay<M>?,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as Slots,overlayVisible: null == overlayVisible ? _self.overlayVisible : overlayVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
