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

 MapMode get mode; MapSelection get selection;
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
 MapMode mode, MapSelection selection
});


$MapModeCopyWith<$Res> get mode;$MapSelectionCopyWith<$Res> get selection;

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
as MapSelection,
  ));
}
/// Create a copy of MapEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapModeCopyWith<$Res> get mode {
  
  return $MapModeCopyWith<$Res>(_self.mode, (value) {
    return _then(_self.copyWith(mode: value));
  });
}/// Create a copy of MapEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapSelectionCopyWith<$Res> get selection {
  
  return $MapSelectionCopyWith<$Res>(_self.selection, (value) {
    return _then(_self.copyWith(selection: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MapMode mode,  MapSelection selection)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MapMode mode,  MapSelection selection)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MapMode mode,  MapSelection selection)?  $default,) {final _that = this;
switch (_that) {
case _MapEditorState() when $default != null:
return $default(_that.mode,_that.selection);case _:
  return null;

}
}

}

/// @nodoc


class _MapEditorState implements MapEditorState {
  const _MapEditorState({this.mode = const Idle(), this.selection = const MapSelection.none()});
  

@override@JsonKey() final  MapMode mode;
@override@JsonKey() final  MapSelection selection;

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
 MapMode mode, MapSelection selection
});


@override $MapModeCopyWith<$Res> get mode;@override $MapSelectionCopyWith<$Res> get selection;

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
as MapSelection,
  ));
}

/// Create a copy of MapEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapModeCopyWith<$Res> get mode {
  
  return $MapModeCopyWith<$Res>(_self.mode, (value) {
    return _then(_self.copyWith(mode: value));
  });
}/// Create a copy of MapEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapSelectionCopyWith<$Res> get selection {
  
  return $MapSelectionCopyWith<$Res>(_self.selection, (value) {
    return _then(_self.copyWith(selection: value));
  });
}
}

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
