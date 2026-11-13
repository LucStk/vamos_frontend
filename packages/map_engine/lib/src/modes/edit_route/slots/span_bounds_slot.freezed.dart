// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'span_bounds_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SpanBounds {

/// Bornes d'origine : elles ne changent jamais pendant l'édition.
 double get originStart; double get originEnd;/// Borne actuellement déplacée, ou null si aucune.
 BoundMove? get moved;
/// Create a copy of SpanBounds
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpanBoundsCopyWith<SpanBounds> get copyWith => _$SpanBoundsCopyWithImpl<SpanBounds>(this as SpanBounds, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SpanBounds;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpanBounds&&(identical(other.originStart, _this.originStart) || other.originStart == _this.originStart)&&(identical(other.originEnd, _this.originEnd) || other.originEnd == _this.originEnd)&&(identical(other.moved, _this.moved) || other.moved == _this.moved));
}


@override
int get hashCode {
  final _this = this as SpanBounds;
  return Object.hash(runtimeType,_this.originStart,_this.originEnd,_this.moved);
}

@override
String toString() {
  final _this = this as SpanBounds;
  return 'SpanBounds(originStart: ${_this.originStart}, originEnd: ${_this.originEnd}, moved: ${_this.moved})';
}


}

/// @nodoc
abstract mixin class $SpanBoundsCopyWith<$Res>  {
  factory $SpanBoundsCopyWith(SpanBounds value, $Res Function(SpanBounds) _then) = _$SpanBoundsCopyWithImpl;
@useResult
$Res call({
 double originStart, double originEnd, BoundMove? moved
});




}
/// @nodoc
class _$SpanBoundsCopyWithImpl<$Res>
    implements $SpanBoundsCopyWith<$Res> {
  _$SpanBoundsCopyWithImpl(this._self, this._then);

  final SpanBounds _self;
  final $Res Function(SpanBounds) _then;

/// Create a copy of SpanBounds
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? originStart = null,Object? originEnd = null,Object? moved = freezed,}) {
  return _then(SpanBounds(
originStart: null == originStart ? _self.originStart : originStart // ignore: cast_nullable_to_non_nullable
as double,originEnd: null == originEnd ? _self.originEnd : originEnd // ignore: cast_nullable_to_non_nullable
as double,moved: freezed == moved ? _self.moved : moved // ignore: cast_nullable_to_non_nullable
as BoundMove?,
  ));
}

}


/// Adds pattern-matching-related methods to [SpanBounds].
extension SpanBoundsPatterns on SpanBounds {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpanBounds value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpanBounds() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpanBounds value)  $default,){
final _that = this;
switch (_that) {
case _SpanBounds():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpanBounds value)?  $default,){
final _that = this;
switch (_that) {
case _SpanBounds() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double originStart,  double originEnd,  BoundMove? moved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpanBounds() when $default != null:
return $default(_that.originStart,_that.originEnd,_that.moved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double originStart,  double originEnd,  BoundMove? moved)  $default,) {final _that = this;
switch (_that) {
case _SpanBounds():
return $default(_that.originStart,_that.originEnd,_that.moved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double originStart,  double originEnd,  BoundMove? moved)?  $default,) {final _that = this;
switch (_that) {
case _SpanBounds() when $default != null:
return $default(_that.originStart,_that.originEnd,_that.moved);case _:
  return null;

}
}

}

/// @nodoc


class _SpanBounds extends SpanBounds {
  const _SpanBounds({required this.originStart, required this.originEnd, this.moved}): super._();
  

/// Bornes d'origine : elles ne changent jamais pendant l'édition.
@override final  double originStart;
@override final  double originEnd;
/// Borne actuellement déplacée, ou null si aucune.
@override final  BoundMove? moved;

/// Create a copy of SpanBounds
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpanBoundsCopyWith<_SpanBounds> get copyWith => __$SpanBoundsCopyWithImpl<_SpanBounds>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpanBounds&&(identical(other.originStart, originStart) || other.originStart == originStart)&&(identical(other.originEnd, originEnd) || other.originEnd == originEnd)&&(identical(other.moved, moved) || other.moved == moved));
}


@override
int get hashCode {
    return Object.hash(runtimeType,originStart,originEnd,moved);
}

@override
String toString() {
    return 'SpanBounds(originStart: $originStart, originEnd: $originEnd, moved: $moved)';
}


}

/// @nodoc
abstract mixin class _$SpanBoundsCopyWith<$Res> implements $SpanBoundsCopyWith<$Res> {
  factory _$SpanBoundsCopyWith(_SpanBounds value, $Res Function(_SpanBounds) _then) = __$SpanBoundsCopyWithImpl;
@override @useResult
$Res call({
 double originStart, double originEnd, BoundMove? moved
});




}
/// @nodoc
class __$SpanBoundsCopyWithImpl<$Res>
    implements _$SpanBoundsCopyWith<$Res> {
  __$SpanBoundsCopyWithImpl(this._self, this._then);

  final _SpanBounds _self;
  final $Res Function(_SpanBounds) _then;

/// Create a copy of SpanBounds
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? originStart = null,Object? originEnd = null,Object? moved = freezed,}) {
  return _then(_SpanBounds(
originStart: null == originStart ? _self.originStart : originStart // ignore: cast_nullable_to_non_nullable
as double,originEnd: null == originEnd ? _self.originEnd : originEnd // ignore: cast_nullable_to_non_nullable
as double,moved: freezed == moved ? _self.moved : moved // ignore: cast_nullable_to_non_nullable
as BoundMove?,
  ));
}


}

// dart format on
