// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapState {

 Id<Trip> get tripId; MapInteraction get interaction;
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapStateCopyWith<MapState> get copyWith => _$MapStateCopyWithImpl<MapState>(this as MapState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.interaction, interaction) || other.interaction == interaction));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,interaction);

@override
String toString() {
  return 'MapState(tripId: $tripId, interaction: $interaction)';
}


}

/// @nodoc
abstract mixin class $MapStateCopyWith<$Res>  {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) _then) = _$MapStateCopyWithImpl;
@useResult
$Res call({
 Id<Trip> tripId, MapInteraction interaction
});


$MapInteractionCopyWith<$Res> get interaction;

}
/// @nodoc
class _$MapStateCopyWithImpl<$Res>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._self, this._then);

  final MapState _self;
  final $Res Function(MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = null,Object? interaction = null,}) {
  return _then(_self.copyWith(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as Id<Trip>,interaction: null == interaction ? _self.interaction : interaction // ignore: cast_nullable_to_non_nullable
as MapInteraction,
  ));
}
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapInteractionCopyWith<$Res> get interaction {
  
  return $MapInteractionCopyWith<$Res>(_self.interaction, (value) {
    return _then(_self.copyWith(interaction: value));
  });
}
}


/// Adds pattern-matching-related methods to [MapState].
extension MapStatePatterns on MapState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapState value)  $default,){
final _that = this;
switch (_that) {
case _MapState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapState value)?  $default,){
final _that = this;
switch (_that) {
case _MapState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Id<Trip> tripId,  MapInteraction interaction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.tripId,_that.interaction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Id<Trip> tripId,  MapInteraction interaction)  $default,) {final _that = this;
switch (_that) {
case _MapState():
return $default(_that.tripId,_that.interaction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Id<Trip> tripId,  MapInteraction interaction)?  $default,) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.tripId,_that.interaction);case _:
  return null;

}
}

}

/// @nodoc


class _MapState extends MapState {
  const _MapState({required this.tripId, this.interaction = const MapInteraction.none()}): super._();
  

@override final  Id<Trip> tripId;
@override@JsonKey() final  MapInteraction interaction;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapStateCopyWith<_MapState> get copyWith => __$MapStateCopyWithImpl<_MapState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapState&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.interaction, interaction) || other.interaction == interaction));
}


@override
int get hashCode => Object.hash(runtimeType,tripId,interaction);

@override
String toString() {
  return 'MapState(tripId: $tripId, interaction: $interaction)';
}


}

/// @nodoc
abstract mixin class _$MapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory _$MapStateCopyWith(_MapState value, $Res Function(_MapState) _then) = __$MapStateCopyWithImpl;
@override @useResult
$Res call({
 Id<Trip> tripId, MapInteraction interaction
});


@override $MapInteractionCopyWith<$Res> get interaction;

}
/// @nodoc
class __$MapStateCopyWithImpl<$Res>
    implements _$MapStateCopyWith<$Res> {
  __$MapStateCopyWithImpl(this._self, this._then);

  final _MapState _self;
  final $Res Function(_MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? interaction = null,}) {
  return _then(_MapState(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as Id<Trip>,interaction: null == interaction ? _self.interaction : interaction // ignore: cast_nullable_to_non_nullable
as MapInteraction,
  ));
}

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapInteractionCopyWith<$Res> get interaction {
  
  return $MapInteractionCopyWith<$Res>(_self.interaction, (value) {
    return _then(_self.copyWith(interaction: value));
  });
}
}

// dart format on
