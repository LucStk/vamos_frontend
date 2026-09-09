// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapContextState {

 MapMode get mode; MapElement get selection;
/// Create a copy of MapContextState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapContextStateCopyWith<MapContextState> get copyWith => _$MapContextStateCopyWithImpl<MapContextState>(this as MapContextState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapContextState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.selection, selection) || other.selection == selection));
}


@override
int get hashCode => Object.hash(runtimeType,mode,selection);

@override
String toString() {
  return 'MapContextState(mode: $mode, selection: $selection)';
}


}

/// @nodoc
abstract mixin class $MapContextStateCopyWith<$Res>  {
  factory $MapContextStateCopyWith(MapContextState value, $Res Function(MapContextState) _then) = _$MapContextStateCopyWithImpl;
@useResult
$Res call({
 MapMode mode, MapElement selection
});




}
/// @nodoc
class _$MapContextStateCopyWithImpl<$Res>
    implements $MapContextStateCopyWith<$Res> {
  _$MapContextStateCopyWithImpl(this._self, this._then);

  final MapContextState _self;
  final $Res Function(MapContextState) _then;

/// Create a copy of MapContextState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? selection = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MapMode,selection: null == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as MapElement,
  ));
}

}


/// Adds pattern-matching-related methods to [MapContextState].
extension MapContextStatePatterns on MapContextState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapContextState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapContextState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapContextState value)  $default,){
final _that = this;
switch (_that) {
case _MapContextState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapContextState value)?  $default,){
final _that = this;
switch (_that) {
case _MapContextState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MapMode mode,  MapElement selection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapContextState() when $default != null:
return $default(_that.mode,_that.selection);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MapMode mode,  MapElement selection)  $default,) {final _that = this;
switch (_that) {
case _MapContextState():
return $default(_that.mode,_that.selection);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MapMode mode,  MapElement selection)?  $default,) {final _that = this;
switch (_that) {
case _MapContextState() when $default != null:
return $default(_that.mode,_that.selection);case _:
  return null;

}
}

}

/// @nodoc


class _MapContextState implements MapContextState {
  const _MapContextState({this.mode = const Idle(), this.selection = const NoMapElement()});
  

@override@JsonKey() final  MapMode mode;
@override@JsonKey() final  MapElement selection;

/// Create a copy of MapContextState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapContextStateCopyWith<_MapContextState> get copyWith => __$MapContextStateCopyWithImpl<_MapContextState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapContextState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.selection, selection) || other.selection == selection));
}


@override
int get hashCode => Object.hash(runtimeType,mode,selection);

@override
String toString() {
  return 'MapContextState(mode: $mode, selection: $selection)';
}


}

/// @nodoc
abstract mixin class _$MapContextStateCopyWith<$Res> implements $MapContextStateCopyWith<$Res> {
  factory _$MapContextStateCopyWith(_MapContextState value, $Res Function(_MapContextState) _then) = __$MapContextStateCopyWithImpl;
@override @useResult
$Res call({
 MapMode mode, MapElement selection
});




}
/// @nodoc
class __$MapContextStateCopyWithImpl<$Res>
    implements _$MapContextStateCopyWith<$Res> {
  __$MapContextStateCopyWithImpl(this._self, this._then);

  final _MapContextState _self;
  final $Res Function(_MapContextState) _then;

/// Create a copy of MapContextState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? selection = null,}) {
  return _then(_MapContextState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MapMode,selection: null == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as MapElement,
  ));
}


}

// dart format on
