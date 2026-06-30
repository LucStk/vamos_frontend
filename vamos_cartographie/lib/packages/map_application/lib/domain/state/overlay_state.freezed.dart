// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overlay_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapOverlayState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapOverlayState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapOverlayState()';
}


}

/// @nodoc
class $MapOverlayStateCopyWith<$Res>  {
$MapOverlayStateCopyWith(MapOverlayState _, $Res Function(MapOverlayState) __);
}


/// Adds pattern-matching-related methods to [MapOverlayState].
extension MapOverlayStatePatterns on MapOverlayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OverlayHidden value)?  hidden,TResult Function( OverlayPopup value)?  popup,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OverlayHidden() when hidden != null:
return hidden(_that);case OverlayPopup() when popup != null:
return popup(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OverlayHidden value)  hidden,required TResult Function( OverlayPopup value)  popup,}){
final _that = this;
switch (_that) {
case OverlayHidden():
return hidden(_that);case OverlayPopup():
return popup(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OverlayHidden value)?  hidden,TResult? Function( OverlayPopup value)?  popup,}){
final _that = this;
switch (_that) {
case OverlayHidden() when hidden != null:
return hidden(_that);case OverlayPopup() when popup != null:
return popup(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  hidden,TResult Function( PopUpState popUpState)?  popup,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OverlayHidden() when hidden != null:
return hidden();case OverlayPopup() when popup != null:
return popup(_that.popUpState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  hidden,required TResult Function( PopUpState popUpState)  popup,}) {final _that = this;
switch (_that) {
case OverlayHidden():
return hidden();case OverlayPopup():
return popup(_that.popUpState);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  hidden,TResult? Function( PopUpState popUpState)?  popup,}) {final _that = this;
switch (_that) {
case OverlayHidden() when hidden != null:
return hidden();case OverlayPopup() when popup != null:
return popup(_that.popUpState);case _:
  return null;

}
}

}

/// @nodoc


class OverlayHidden implements MapOverlayState {
  const OverlayHidden();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverlayHidden);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapOverlayState.hidden()';
}


}




/// @nodoc


class OverlayPopup implements MapOverlayState {
  const OverlayPopup({required this.popUpState});
  

 final  PopUpState popUpState;

/// Create a copy of MapOverlayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverlayPopupCopyWith<OverlayPopup> get copyWith => _$OverlayPopupCopyWithImpl<OverlayPopup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverlayPopup&&(identical(other.popUpState, popUpState) || other.popUpState == popUpState));
}


@override
int get hashCode => Object.hash(runtimeType,popUpState);

@override
String toString() {
  return 'MapOverlayState.popup(popUpState: $popUpState)';
}


}

/// @nodoc
abstract mixin class $OverlayPopupCopyWith<$Res> implements $MapOverlayStateCopyWith<$Res> {
  factory $OverlayPopupCopyWith(OverlayPopup value, $Res Function(OverlayPopup) _then) = _$OverlayPopupCopyWithImpl;
@useResult
$Res call({
 PopUpState popUpState
});


$PopUpStateCopyWith<$Res> get popUpState;

}
/// @nodoc
class _$OverlayPopupCopyWithImpl<$Res>
    implements $OverlayPopupCopyWith<$Res> {
  _$OverlayPopupCopyWithImpl(this._self, this._then);

  final OverlayPopup _self;
  final $Res Function(OverlayPopup) _then;

/// Create a copy of MapOverlayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? popUpState = null,}) {
  return _then(OverlayPopup(
popUpState: null == popUpState ? _self.popUpState : popUpState // ignore: cast_nullable_to_non_nullable
as PopUpState,
  ));
}

/// Create a copy of MapOverlayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PopUpStateCopyWith<$Res> get popUpState {
  
  return $PopUpStateCopyWith<$Res>(_self.popUpState, (value) {
    return _then(_self.copyWith(popUpState: value));
  });
}
}

// dart format on
