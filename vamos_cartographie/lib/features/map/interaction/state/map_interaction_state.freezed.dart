// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_interaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapInteractionState {

 InteractionMode? get mode; MapCursorState? get cursor; MapPopupState? get popup; Id<Vertex>? get activeVertex; Id<Segment>? get activeSegment; LayerHitResult<Id<Segment>>? get segmentHit;
/// Create a copy of MapInteractionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapInteractionStateCopyWith<MapInteractionState> get copyWith => _$MapInteractionStateCopyWithImpl<MapInteractionState>(this as MapInteractionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapInteractionState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.popup, popup) || other.popup == popup)&&(identical(other.activeVertex, activeVertex) || other.activeVertex == activeVertex)&&(identical(other.activeSegment, activeSegment) || other.activeSegment == activeSegment)&&(identical(other.segmentHit, segmentHit) || other.segmentHit == segmentHit));
}


@override
int get hashCode => Object.hash(runtimeType,mode,cursor,popup,activeVertex,activeSegment,segmentHit);

@override
String toString() {
  return 'MapInteractionState(mode: $mode, cursor: $cursor, popup: $popup, activeVertex: $activeVertex, activeSegment: $activeSegment, segmentHit: $segmentHit)';
}


}

/// @nodoc
abstract mixin class $MapInteractionStateCopyWith<$Res>  {
  factory $MapInteractionStateCopyWith(MapInteractionState value, $Res Function(MapInteractionState) _then) = _$MapInteractionStateCopyWithImpl;
@useResult
$Res call({
 InteractionMode? mode, MapCursorState? cursor, MapPopupState? popup, Id<Vertex>? activeVertex, Id<Segment>? activeSegment, LayerHitResult<Id<Segment>>? segmentHit
});


$MapCursorStateCopyWith<$Res>? get cursor;$MapPopupStateCopyWith<$Res>? get popup;

}
/// @nodoc
class _$MapInteractionStateCopyWithImpl<$Res>
    implements $MapInteractionStateCopyWith<$Res> {
  _$MapInteractionStateCopyWithImpl(this._self, this._then);

  final MapInteractionState _self;
  final $Res Function(MapInteractionState) _then;

/// Create a copy of MapInteractionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = freezed,Object? cursor = freezed,Object? popup = freezed,Object? activeVertex = freezed,Object? activeSegment = freezed,Object? segmentHit = freezed,}) {
  return _then(_self.copyWith(
mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as InteractionMode?,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as MapCursorState?,popup: freezed == popup ? _self.popup : popup // ignore: cast_nullable_to_non_nullable
as MapPopupState?,activeVertex: freezed == activeVertex ? _self.activeVertex : activeVertex // ignore: cast_nullable_to_non_nullable
as Id<Vertex>?,activeSegment: freezed == activeSegment ? _self.activeSegment : activeSegment // ignore: cast_nullable_to_non_nullable
as Id<Segment>?,segmentHit: freezed == segmentHit ? _self.segmentHit : segmentHit // ignore: cast_nullable_to_non_nullable
as LayerHitResult<Id<Segment>>?,
  ));
}
/// Create a copy of MapInteractionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapCursorStateCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
    return null;
  }

  return $MapCursorStateCopyWith<$Res>(_self.cursor!, (value) {
    return _then(_self.copyWith(cursor: value));
  });
}/// Create a copy of MapInteractionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapPopupStateCopyWith<$Res>? get popup {
    if (_self.popup == null) {
    return null;
  }

  return $MapPopupStateCopyWith<$Res>(_self.popup!, (value) {
    return _then(_self.copyWith(popup: value));
  });
}
}


/// Adds pattern-matching-related methods to [MapInteractionState].
extension MapInteractionStatePatterns on MapInteractionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapInteractionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapInteractionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapInteractionState value)  $default,){
final _that = this;
switch (_that) {
case _MapInteractionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapInteractionState value)?  $default,){
final _that = this;
switch (_that) {
case _MapInteractionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InteractionMode? mode,  MapCursorState? cursor,  MapPopupState? popup,  Id<Vertex>? activeVertex,  Id<Segment>? activeSegment,  LayerHitResult<Id<Segment>>? segmentHit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapInteractionState() when $default != null:
return $default(_that.mode,_that.cursor,_that.popup,_that.activeVertex,_that.activeSegment,_that.segmentHit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InteractionMode? mode,  MapCursorState? cursor,  MapPopupState? popup,  Id<Vertex>? activeVertex,  Id<Segment>? activeSegment,  LayerHitResult<Id<Segment>>? segmentHit)  $default,) {final _that = this;
switch (_that) {
case _MapInteractionState():
return $default(_that.mode,_that.cursor,_that.popup,_that.activeVertex,_that.activeSegment,_that.segmentHit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InteractionMode? mode,  MapCursorState? cursor,  MapPopupState? popup,  Id<Vertex>? activeVertex,  Id<Segment>? activeSegment,  LayerHitResult<Id<Segment>>? segmentHit)?  $default,) {final _that = this;
switch (_that) {
case _MapInteractionState() when $default != null:
return $default(_that.mode,_that.cursor,_that.popup,_that.activeVertex,_that.activeSegment,_that.segmentHit);case _:
  return null;

}
}

}

/// @nodoc


class _MapInteractionState implements MapInteractionState {
  const _MapInteractionState({this.mode, this.cursor, this.popup, this.activeVertex, this.activeSegment, this.segmentHit});
  

@override final  InteractionMode? mode;
@override final  MapCursorState? cursor;
@override final  MapPopupState? popup;
@override final  Id<Vertex>? activeVertex;
@override final  Id<Segment>? activeSegment;
@override final  LayerHitResult<Id<Segment>>? segmentHit;

/// Create a copy of MapInteractionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapInteractionStateCopyWith<_MapInteractionState> get copyWith => __$MapInteractionStateCopyWithImpl<_MapInteractionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapInteractionState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.popup, popup) || other.popup == popup)&&(identical(other.activeVertex, activeVertex) || other.activeVertex == activeVertex)&&(identical(other.activeSegment, activeSegment) || other.activeSegment == activeSegment)&&(identical(other.segmentHit, segmentHit) || other.segmentHit == segmentHit));
}


@override
int get hashCode => Object.hash(runtimeType,mode,cursor,popup,activeVertex,activeSegment,segmentHit);

@override
String toString() {
  return 'MapInteractionState(mode: $mode, cursor: $cursor, popup: $popup, activeVertex: $activeVertex, activeSegment: $activeSegment, segmentHit: $segmentHit)';
}


}

/// @nodoc
abstract mixin class _$MapInteractionStateCopyWith<$Res> implements $MapInteractionStateCopyWith<$Res> {
  factory _$MapInteractionStateCopyWith(_MapInteractionState value, $Res Function(_MapInteractionState) _then) = __$MapInteractionStateCopyWithImpl;
@override @useResult
$Res call({
 InteractionMode? mode, MapCursorState? cursor, MapPopupState? popup, Id<Vertex>? activeVertex, Id<Segment>? activeSegment, LayerHitResult<Id<Segment>>? segmentHit
});


@override $MapCursorStateCopyWith<$Res>? get cursor;@override $MapPopupStateCopyWith<$Res>? get popup;

}
/// @nodoc
class __$MapInteractionStateCopyWithImpl<$Res>
    implements _$MapInteractionStateCopyWith<$Res> {
  __$MapInteractionStateCopyWithImpl(this._self, this._then);

  final _MapInteractionState _self;
  final $Res Function(_MapInteractionState) _then;

/// Create a copy of MapInteractionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = freezed,Object? cursor = freezed,Object? popup = freezed,Object? activeVertex = freezed,Object? activeSegment = freezed,Object? segmentHit = freezed,}) {
  return _then(_MapInteractionState(
mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as InteractionMode?,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as MapCursorState?,popup: freezed == popup ? _self.popup : popup // ignore: cast_nullable_to_non_nullable
as MapPopupState?,activeVertex: freezed == activeVertex ? _self.activeVertex : activeVertex // ignore: cast_nullable_to_non_nullable
as Id<Vertex>?,activeSegment: freezed == activeSegment ? _self.activeSegment : activeSegment // ignore: cast_nullable_to_non_nullable
as Id<Segment>?,segmentHit: freezed == segmentHit ? _self.segmentHit : segmentHit // ignore: cast_nullable_to_non_nullable
as LayerHitResult<Id<Segment>>?,
  ));
}

/// Create a copy of MapInteractionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapCursorStateCopyWith<$Res>? get cursor {
    if (_self.cursor == null) {
    return null;
  }

  return $MapCursorStateCopyWith<$Res>(_self.cursor!, (value) {
    return _then(_self.copyWith(cursor: value));
  });
}/// Create a copy of MapInteractionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapPopupStateCopyWith<$Res>? get popup {
    if (_self.popup == null) {
    return null;
  }

  return $MapPopupStateCopyWith<$Res>(_self.popup!, (value) {
    return _then(_self.copyWith(popup: value));
  });
}
}

// dart format on
