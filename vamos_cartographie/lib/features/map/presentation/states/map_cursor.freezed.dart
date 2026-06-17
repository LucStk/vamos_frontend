// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_cursor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapCursorState {

 LatLng get latLng; bool get isOpen; bool get popUpOpen;
/// Create a copy of MapCursorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapCursorStateCopyWith<MapCursorState> get copyWith => _$MapCursorStateCopyWithImpl<MapCursorState>(this as MapCursorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapCursorState&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.popUpOpen, popUpOpen) || other.popUpOpen == popUpOpen));
}


@override
int get hashCode => Object.hash(runtimeType,latLng,isOpen,popUpOpen);

@override
String toString() {
  return 'MapCursorState(latLng: $latLng, isOpen: $isOpen, popUpOpen: $popUpOpen)';
}


}

/// @nodoc
abstract mixin class $MapCursorStateCopyWith<$Res>  {
  factory $MapCursorStateCopyWith(MapCursorState value, $Res Function(MapCursorState) _then) = _$MapCursorStateCopyWithImpl;
@useResult
$Res call({
 LatLng latLng, bool isOpen, bool popUpOpen
});




}
/// @nodoc
class _$MapCursorStateCopyWithImpl<$Res>
    implements $MapCursorStateCopyWith<$Res> {
  _$MapCursorStateCopyWithImpl(this._self, this._then);

  final MapCursorState _self;
  final $Res Function(MapCursorState) _then;

/// Create a copy of MapCursorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latLng = null,Object? isOpen = null,Object? popUpOpen = null,}) {
  return _then(_self.copyWith(
latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,popUpOpen: null == popUpOpen ? _self.popUpOpen : popUpOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MapCursorState].
extension MapCursorStatePatterns on MapCursorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapCursorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapCursorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapCursorState value)  $default,){
final _that = this;
switch (_that) {
case _MapCursorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapCursorState value)?  $default,){
final _that = this;
switch (_that) {
case _MapCursorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LatLng latLng,  bool isOpen,  bool popUpOpen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapCursorState() when $default != null:
return $default(_that.latLng,_that.isOpen,_that.popUpOpen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LatLng latLng,  bool isOpen,  bool popUpOpen)  $default,) {final _that = this;
switch (_that) {
case _MapCursorState():
return $default(_that.latLng,_that.isOpen,_that.popUpOpen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LatLng latLng,  bool isOpen,  bool popUpOpen)?  $default,) {final _that = this;
switch (_that) {
case _MapCursorState() when $default != null:
return $default(_that.latLng,_that.isOpen,_that.popUpOpen);case _:
  return null;

}
}

}

/// @nodoc


class _MapCursorState implements MapCursorState {
  const _MapCursorState({this.latLng = const LatLng(0, 0), this.isOpen = false, this.popUpOpen = true});
  

@override@JsonKey() final  LatLng latLng;
@override@JsonKey() final  bool isOpen;
@override@JsonKey() final  bool popUpOpen;

/// Create a copy of MapCursorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapCursorStateCopyWith<_MapCursorState> get copyWith => __$MapCursorStateCopyWithImpl<_MapCursorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapCursorState&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.popUpOpen, popUpOpen) || other.popUpOpen == popUpOpen));
}


@override
int get hashCode => Object.hash(runtimeType,latLng,isOpen,popUpOpen);

@override
String toString() {
  return 'MapCursorState(latLng: $latLng, isOpen: $isOpen, popUpOpen: $popUpOpen)';
}


}

/// @nodoc
abstract mixin class _$MapCursorStateCopyWith<$Res> implements $MapCursorStateCopyWith<$Res> {
  factory _$MapCursorStateCopyWith(_MapCursorState value, $Res Function(_MapCursorState) _then) = __$MapCursorStateCopyWithImpl;
@override @useResult
$Res call({
 LatLng latLng, bool isOpen, bool popUpOpen
});




}
/// @nodoc
class __$MapCursorStateCopyWithImpl<$Res>
    implements _$MapCursorStateCopyWith<$Res> {
  __$MapCursorStateCopyWithImpl(this._self, this._then);

  final _MapCursorState _self;
  final $Res Function(_MapCursorState) _then;

/// Create a copy of MapCursorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latLng = null,Object? isOpen = null,Object? popUpOpen = null,}) {
  return _then(_MapCursorState(
latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,popUpOpen: null == popUpOpen ? _self.popUpOpen : popUpOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
