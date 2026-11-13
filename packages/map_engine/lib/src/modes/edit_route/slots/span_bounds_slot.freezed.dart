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

 SpanBound get bound; double get value;
/// Create a copy of SpanBounds
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpanBoundsCopyWith<SpanBounds> get copyWith => _$SpanBoundsCopyWithImpl<SpanBounds>(this as SpanBounds, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SpanBounds;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpanBounds&&(identical(other.bound, _this.bound) || other.bound == _this.bound)&&(identical(other.value, _this.value) || other.value == _this.value));
}


@override
int get hashCode {
  final _this = this as SpanBounds;
  return Object.hash(runtimeType,_this.bound,_this.value);
}

@override
String toString() {
  final _this = this as SpanBounds;
  return 'SpanBounds(bound: ${_this.bound}, value: ${_this.value})';
}


}

/// @nodoc
abstract mixin class $SpanBoundsCopyWith<$Res>  {
  factory $SpanBoundsCopyWith(SpanBounds value, $Res Function(SpanBounds) _then) = _$SpanBoundsCopyWithImpl;
@useResult
$Res call({
 SpanBound bound, double value
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
@pragma('vm:prefer-inline') @override $Res call({Object? bound = null,Object? value = null,}) {
  return _then(SpanBounds(
bound: null == bound ? _self.bound : bound // ignore: cast_nullable_to_non_nullable
as SpanBound,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SpanBound bound,  double value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpanBounds() when $default != null:
return $default(_that.bound,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SpanBound bound,  double value)  $default,) {final _that = this;
switch (_that) {
case _SpanBounds():
return $default(_that.bound,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SpanBound bound,  double value)?  $default,) {final _that = this;
switch (_that) {
case _SpanBounds() when $default != null:
return $default(_that.bound,_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _SpanBounds implements SpanBounds {
  const _SpanBounds({required this.bound, required this.value});
  

@override final  SpanBound bound;
@override final  double value;

/// Create a copy of SpanBounds
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpanBoundsCopyWith<_SpanBounds> get copyWith => __$SpanBoundsCopyWithImpl<_SpanBounds>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpanBounds&&(identical(other.bound, bound) || other.bound == bound)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode {
    return Object.hash(runtimeType,bound,value);
}

@override
String toString() {
    return 'SpanBounds(bound: $bound, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SpanBoundsCopyWith<$Res> implements $SpanBoundsCopyWith<$Res> {
  factory _$SpanBoundsCopyWith(_SpanBounds value, $Res Function(_SpanBounds) _then) = __$SpanBoundsCopyWithImpl;
@override @useResult
$Res call({
 SpanBound bound, double value
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
@override @pragma('vm:prefer-inline') $Res call({Object? bound = null,Object? value = null,}) {
  return _then(_SpanBounds(
bound: null == bound ? _self.bound : bound // ignore: cast_nullable_to_non_nullable
as SpanBound,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
