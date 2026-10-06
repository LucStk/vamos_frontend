// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_explore_mode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IdleExplorer {


/// Create a copy of IdleExplorer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdleExplorerCopyWith<IdleExplorer> get copyWith => _$IdleExplorerCopyWithImpl<IdleExplorer>(this as IdleExplorer, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as IdleExplorer;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdleExplorer&&(identical(other.popUpPosition, _this.popUpPosition) || other.popUpPosition == _this.popUpPosition));
}


@override
int get hashCode {
  final _this = this as IdleExplorer;
  return Object.hash(runtimeType,_this.popUpPosition);
}

@override
String toString() {
  final _this = this as IdleExplorer;
  return 'IdleExplorer(popUpPosition: ${_this.popUpPosition})';
}


}

/// @nodoc
abstract mixin class $IdleExplorerCopyWith<$Res>  {
  factory $IdleExplorerCopyWith(IdleExplorer value, $Res Function(IdleExplorer) _then) = _$IdleExplorerCopyWithImpl;
@useResult
$Res call({
 PopUpPositionType? popUpPosition
});




}
/// @nodoc
class _$IdleExplorerCopyWithImpl<$Res>
    implements $IdleExplorerCopyWith<$Res> {
  _$IdleExplorerCopyWithImpl(this._self, this._then);

  final IdleExplorer _self;
  final $Res Function(IdleExplorer) _then;

/// Create a copy of IdleExplorer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? popUpPosition = freezed,}) {
  return _then(IdleExplorer(
popUpPosition: freezed == popUpPosition ? _self.popUpPosition : popUpPosition // ignore: cast_nullable_to_non_nullable
as PopUpPositionType?,
  ));
}

}


/// Adds pattern-matching-related methods to [IdleExplorer].
extension IdleExplorerPatterns on IdleExplorer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$TripSelectMode {


/// Create a copy of TripSelectMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripSelectModeCopyWith<TripSelectMode> get copyWith => _$TripSelectModeCopyWithImpl<TripSelectMode>(this as TripSelectMode, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TripSelectMode;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripSelectMode&&(identical(other.trip, _this.trip) || other.trip == _this.trip)&&(identical(other.popUpPosition, _this.popUpPosition) || other.popUpPosition == _this.popUpPosition));
}


@override
int get hashCode {
  final _this = this as TripSelectMode;
  return Object.hash(runtimeType,_this.trip,_this.popUpPosition);
}

@override
String toString() {
  final _this = this as TripSelectMode;
  return 'TripSelectMode(trip: ${_this.trip}, popUpPosition: ${_this.popUpPosition})';
}


}

/// @nodoc
abstract mixin class $TripSelectModeCopyWith<$Res>  {
  factory $TripSelectModeCopyWith(TripSelectMode value, $Res Function(TripSelectMode) _then) = _$TripSelectModeCopyWithImpl;
@useResult
$Res call({
 MapTripObject trip, PopUpPositionType? popUpPosition
});




}
/// @nodoc
class _$TripSelectModeCopyWithImpl<$Res>
    implements $TripSelectModeCopyWith<$Res> {
  _$TripSelectModeCopyWithImpl(this._self, this._then);

  final TripSelectMode _self;
  final $Res Function(TripSelectMode) _then;

/// Create a copy of TripSelectMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trip = null,Object? popUpPosition = freezed,}) {
  return _then(TripSelectMode(
trip: null == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as MapTripObject,popUpPosition: freezed == popUpPosition ? _self.popUpPosition : popUpPosition // ignore: cast_nullable_to_non_nullable
as PopUpPositionType?,
  ));
}

}


/// Adds pattern-matching-related methods to [TripSelectMode].
extension TripSelectModePatterns on TripSelectMode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
