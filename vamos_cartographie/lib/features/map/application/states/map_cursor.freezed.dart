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
mixin _$MapCursor {

 LatLng get latLng; bool get isOpen;
/// Create a copy of MapCursor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapCursorCopyWith<MapCursor> get copyWith => _$MapCursorCopyWithImpl<MapCursor>(this as MapCursor, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapCursor&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen));
}


@override
int get hashCode => Object.hash(runtimeType,latLng,isOpen);

@override
String toString() {
  return 'MapCursor(latLng: $latLng, isOpen: $isOpen)';
}


}

/// @nodoc
abstract mixin class $MapCursorCopyWith<$Res>  {
  factory $MapCursorCopyWith(MapCursor value, $Res Function(MapCursor) _then) = _$MapCursorCopyWithImpl;
@useResult
$Res call({
 LatLng latLng, bool isOpen
});




}
/// @nodoc
class _$MapCursorCopyWithImpl<$Res>
    implements $MapCursorCopyWith<$Res> {
  _$MapCursorCopyWithImpl(this._self, this._then);

  final MapCursor _self;
  final $Res Function(MapCursor) _then;

/// Create a copy of MapCursor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latLng = null,Object? isOpen = null,}) {
  return _then(_self.copyWith(
latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MapCursor].
extension MapCursorPatterns on MapCursor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapCursor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapCursor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapCursor value)  $default,){
final _that = this;
switch (_that) {
case _MapCursor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapCursor value)?  $default,){
final _that = this;
switch (_that) {
case _MapCursor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LatLng latLng,  bool isOpen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapCursor() when $default != null:
return $default(_that.latLng,_that.isOpen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LatLng latLng,  bool isOpen)  $default,) {final _that = this;
switch (_that) {
case _MapCursor():
return $default(_that.latLng,_that.isOpen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LatLng latLng,  bool isOpen)?  $default,) {final _that = this;
switch (_that) {
case _MapCursor() when $default != null:
return $default(_that.latLng,_that.isOpen);case _:
  return null;

}
}

}

/// @nodoc


class _MapCursor implements MapCursor {
  const _MapCursor({this.latLng = const LatLng(0, 0), this.isOpen = false});
  

@override@JsonKey() final  LatLng latLng;
@override@JsonKey() final  bool isOpen;

/// Create a copy of MapCursor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapCursorCopyWith<_MapCursor> get copyWith => __$MapCursorCopyWithImpl<_MapCursor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapCursor&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen));
}


@override
int get hashCode => Object.hash(runtimeType,latLng,isOpen);

@override
String toString() {
  return 'MapCursor(latLng: $latLng, isOpen: $isOpen)';
}


}

/// @nodoc
abstract mixin class _$MapCursorCopyWith<$Res> implements $MapCursorCopyWith<$Res> {
  factory _$MapCursorCopyWith(_MapCursor value, $Res Function(_MapCursor) _then) = __$MapCursorCopyWithImpl;
@override @useResult
$Res call({
 LatLng latLng, bool isOpen
});




}
/// @nodoc
class __$MapCursorCopyWithImpl<$Res>
    implements _$MapCursorCopyWith<$Res> {
  __$MapCursorCopyWithImpl(this._self, this._then);

  final _MapCursor _self;
  final $Res Function(_MapCursor) _then;

/// Create a copy of MapCursor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latLng = null,Object? isOpen = null,}) {
  return _then(_MapCursor(
latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
