// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_selection_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RouteSelection {

 double get a; double get b;
/// Create a copy of RouteSelection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteSelectionCopyWith<RouteSelection> get copyWith => _$RouteSelectionCopyWithImpl<RouteSelection>(this as RouteSelection, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RouteSelection;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteSelection&&(identical(other.a, _this.a) || other.a == _this.a)&&(identical(other.b, _this.b) || other.b == _this.b));
}


@override
int get hashCode {
  final _this = this as RouteSelection;
  return Object.hash(runtimeType,_this.a,_this.b);
}

@override
String toString() {
  final _this = this as RouteSelection;
  return 'RouteSelection(a: ${_this.a}, b: ${_this.b})';
}


}

/// @nodoc
abstract mixin class $RouteSelectionCopyWith<$Res>  {
  factory $RouteSelectionCopyWith(RouteSelection value, $Res Function(RouteSelection) _then) = _$RouteSelectionCopyWithImpl;
@useResult
$Res call({
 double a, double b
});




}
/// @nodoc
class _$RouteSelectionCopyWithImpl<$Res>
    implements $RouteSelectionCopyWith<$Res> {
  _$RouteSelectionCopyWithImpl(this._self, this._then);

  final RouteSelection _self;
  final $Res Function(RouteSelection) _then;

/// Create a copy of RouteSelection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? a = null,Object? b = null,}) {
  return _then(RouteSelection(
a: null == a ? _self.a : a // ignore: cast_nullable_to_non_nullable
as double,b: null == b ? _self.b : b // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteSelection].
extension RouteSelectionPatterns on RouteSelection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteSelection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteSelection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteSelection value)  $default,){
final _that = this;
switch (_that) {
case _RouteSelection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteSelection value)?  $default,){
final _that = this;
switch (_that) {
case _RouteSelection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double a,  double b)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteSelection() when $default != null:
return $default(_that.a,_that.b);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double a,  double b)  $default,) {final _that = this;
switch (_that) {
case _RouteSelection():
return $default(_that.a,_that.b);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double a,  double b)?  $default,) {final _that = this;
switch (_that) {
case _RouteSelection() when $default != null:
return $default(_that.a,_that.b);case _:
  return null;

}
}

}

/// @nodoc


class _RouteSelection extends RouteSelection {
  const _RouteSelection({required this.a, required this.b}): super._();
  

@override final  double a;
@override final  double b;

/// Create a copy of RouteSelection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteSelectionCopyWith<_RouteSelection> get copyWith => __$RouteSelectionCopyWithImpl<_RouteSelection>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteSelection&&(identical(other.a, a) || other.a == a)&&(identical(other.b, b) || other.b == b));
}


@override
int get hashCode {
    return Object.hash(runtimeType,a,b);
}

@override
String toString() {
    return 'RouteSelection(a: $a, b: $b)';
}


}

/// @nodoc
abstract mixin class _$RouteSelectionCopyWith<$Res> implements $RouteSelectionCopyWith<$Res> {
  factory _$RouteSelectionCopyWith(_RouteSelection value, $Res Function(_RouteSelection) _then) = __$RouteSelectionCopyWithImpl;
@override @useResult
$Res call({
 double a, double b
});




}
/// @nodoc
class __$RouteSelectionCopyWithImpl<$Res>
    implements _$RouteSelectionCopyWith<$Res> {
  __$RouteSelectionCopyWithImpl(this._self, this._then);

  final _RouteSelection _self;
  final $Res Function(_RouteSelection) _then;

/// Create a copy of RouteSelection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? a = null,Object? b = null,}) {
  return _then(_RouteSelection(
a: null == a ? _self.a : a // ignore: cast_nullable_to_non_nullable
as double,b: null == b ? _self.b : b // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
