// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pop_up.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapPopupState {

 LatLng get latLng; PopMenu get popMenu;
/// Create a copy of MapPopupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapPopupStateCopyWith<MapPopupState> get copyWith => _$MapPopupStateCopyWithImpl<MapPopupState>(this as MapPopupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapPopupState&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.popMenu, popMenu) || other.popMenu == popMenu));
}


@override
int get hashCode => Object.hash(runtimeType,latLng,popMenu);

@override
String toString() {
  return 'MapPopupState(latLng: $latLng, popMenu: $popMenu)';
}


}

/// @nodoc
abstract mixin class $MapPopupStateCopyWith<$Res>  {
  factory $MapPopupStateCopyWith(MapPopupState value, $Res Function(MapPopupState) _then) = _$MapPopupStateCopyWithImpl;
@useResult
$Res call({
 LatLng latLng, PopMenu popMenu
});




}
/// @nodoc
class _$MapPopupStateCopyWithImpl<$Res>
    implements $MapPopupStateCopyWith<$Res> {
  _$MapPopupStateCopyWithImpl(this._self, this._then);

  final MapPopupState _self;
  final $Res Function(MapPopupState) _then;

/// Create a copy of MapPopupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latLng = null,Object? popMenu = null,}) {
  return _then(_self.copyWith(
latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,popMenu: null == popMenu ? _self.popMenu : popMenu // ignore: cast_nullable_to_non_nullable
as PopMenu,
  ));
}

}


/// Adds pattern-matching-related methods to [MapPopupState].
extension MapPopupStatePatterns on MapPopupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapPopupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapPopupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapPopupState value)  $default,){
final _that = this;
switch (_that) {
case _MapPopupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapPopupState value)?  $default,){
final _that = this;
switch (_that) {
case _MapPopupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LatLng latLng,  PopMenu popMenu)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapPopupState() when $default != null:
return $default(_that.latLng,_that.popMenu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LatLng latLng,  PopMenu popMenu)  $default,) {final _that = this;
switch (_that) {
case _MapPopupState():
return $default(_that.latLng,_that.popMenu);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LatLng latLng,  PopMenu popMenu)?  $default,) {final _that = this;
switch (_that) {
case _MapPopupState() when $default != null:
return $default(_that.latLng,_that.popMenu);case _:
  return null;

}
}

}

/// @nodoc


class _MapPopupState implements MapPopupState {
  const _MapPopupState({required this.latLng, required this.popMenu});
  

@override final  LatLng latLng;
@override final  PopMenu popMenu;

/// Create a copy of MapPopupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapPopupStateCopyWith<_MapPopupState> get copyWith => __$MapPopupStateCopyWithImpl<_MapPopupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapPopupState&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.popMenu, popMenu) || other.popMenu == popMenu));
}


@override
int get hashCode => Object.hash(runtimeType,latLng,popMenu);

@override
String toString() {
  return 'MapPopupState(latLng: $latLng, popMenu: $popMenu)';
}


}

/// @nodoc
abstract mixin class _$MapPopupStateCopyWith<$Res> implements $MapPopupStateCopyWith<$Res> {
  factory _$MapPopupStateCopyWith(_MapPopupState value, $Res Function(_MapPopupState) _then) = __$MapPopupStateCopyWithImpl;
@override @useResult
$Res call({
 LatLng latLng, PopMenu popMenu
});




}
/// @nodoc
class __$MapPopupStateCopyWithImpl<$Res>
    implements _$MapPopupStateCopyWith<$Res> {
  __$MapPopupStateCopyWithImpl(this._self, this._then);

  final _MapPopupState _self;
  final $Res Function(_MapPopupState) _then;

/// Create a copy of MapPopupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latLng = null,Object? popMenu = null,}) {
  return _then(_MapPopupState(
latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,popMenu: null == popMenu ? _self.popMenu : popMenu // ignore: cast_nullable_to_non_nullable
as PopMenu,
  ));
}


}

// dart format on
