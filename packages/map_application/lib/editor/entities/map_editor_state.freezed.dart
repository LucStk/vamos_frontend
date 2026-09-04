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
mixin _$MapEditorState {

 MapMode get mode; MapElement get selection;
/// Create a copy of MapEditorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapEditorStateCopyWith<MapEditorState> get copyWith => _$MapEditorStateCopyWithImpl<MapEditorState>(this as MapEditorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapEditorState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.selection, selection) || other.selection == selection));
}


@override
int get hashCode => Object.hash(runtimeType,mode,selection);

@override
String toString() {
  return 'MapEditorState(mode: $mode, selection: $selection)';
}


}

/// @nodoc
abstract mixin class $MapEditorStateCopyWith<$Res>  {
  factory $MapEditorStateCopyWith(MapEditorState value, $Res Function(MapEditorState) _then) = _$MapEditorStateCopyWithImpl;
@useResult
$Res call({
 MapMode mode, MapElement selection
});




}
/// @nodoc
class _$MapEditorStateCopyWithImpl<$Res>
    implements $MapEditorStateCopyWith<$Res> {
  _$MapEditorStateCopyWithImpl(this._self, this._then);

  final MapEditorState _self;
  final $Res Function(MapEditorState) _then;

/// Create a copy of MapEditorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? selection = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MapMode,selection: null == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as MapElement,
  ));
}

}


/// Adds pattern-matching-related methods to [MapEditorState].
extension MapEditorStatePatterns on MapEditorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapEditorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapEditorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapEditorState value)  $default,){
final _that = this;
switch (_that) {
case _MapEditorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapEditorState value)?  $default,){
final _that = this;
switch (_that) {
case _MapEditorState() when $default != null:
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
case _MapEditorState() when $default != null:
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
case _MapEditorState():
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
case _MapEditorState() when $default != null:
return $default(_that.mode,_that.selection);case _:
  return null;

}
}

}

/// @nodoc


class _MapEditorState implements MapEditorState {
  const _MapEditorState({this.mode = const Idle(), this.selection = const NoMapElement()});
  

@override@JsonKey() final  MapMode mode;
@override@JsonKey() final  MapElement selection;

/// Create a copy of MapEditorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapEditorStateCopyWith<_MapEditorState> get copyWith => __$MapEditorStateCopyWithImpl<_MapEditorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapEditorState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.selection, selection) || other.selection == selection));
}


@override
int get hashCode => Object.hash(runtimeType,mode,selection);

@override
String toString() {
  return 'MapEditorState(mode: $mode, selection: $selection)';
}


}

/// @nodoc
abstract mixin class _$MapEditorStateCopyWith<$Res> implements $MapEditorStateCopyWith<$Res> {
  factory _$MapEditorStateCopyWith(_MapEditorState value, $Res Function(_MapEditorState) _then) = __$MapEditorStateCopyWithImpl;
@override @useResult
$Res call({
 MapMode mode, MapElement selection
});




}
/// @nodoc
class __$MapEditorStateCopyWithImpl<$Res>
    implements _$MapEditorStateCopyWith<$Res> {
  __$MapEditorStateCopyWithImpl(this._self, this._then);

  final _MapEditorState _self;
  final $Res Function(_MapEditorState) _then;

/// Create a copy of MapEditorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? selection = null,}) {
  return _then(_MapEditorState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MapMode,selection: null == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as MapElement,
  ));
}


}

// dart format on
