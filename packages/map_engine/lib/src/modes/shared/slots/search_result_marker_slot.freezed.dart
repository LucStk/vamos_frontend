// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_result_marker_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchResultMarker {

 WorldOffset get point;
/// Create a copy of SearchResultMarker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultMarkerCopyWith<SearchResultMarker> get copyWith => _$SearchResultMarkerCopyWithImpl<SearchResultMarker>(this as SearchResultMarker, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SearchResultMarker;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResultMarker&&(identical(other.point, _this.point) || other.point == _this.point));
}


@override
int get hashCode {
  final _this = this as SearchResultMarker;
  return Object.hash(runtimeType,_this.point);
}

@override
String toString() {
  final _this = this as SearchResultMarker;
  return 'SearchResultMarker(point: ${_this.point})';
}


}

/// @nodoc
abstract mixin class $SearchResultMarkerCopyWith<$Res>  {
  factory $SearchResultMarkerCopyWith(SearchResultMarker value, $Res Function(SearchResultMarker) _then) = _$SearchResultMarkerCopyWithImpl;
@useResult
$Res call({
 WorldOffset point
});




}
/// @nodoc
class _$SearchResultMarkerCopyWithImpl<$Res>
    implements $SearchResultMarkerCopyWith<$Res> {
  _$SearchResultMarkerCopyWithImpl(this._self, this._then);

  final SearchResultMarker _self;
  final $Res Function(SearchResultMarker) _then;

/// Create a copy of SearchResultMarker
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? point = null,}) {
  return _then(SearchResultMarker(
point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as WorldOffset,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchResultMarker].
extension SearchResultMarkerPatterns on SearchResultMarker {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResultMarker value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResultMarker() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResultMarker value)  $default,){
final _that = this;
switch (_that) {
case _SearchResultMarker():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResultMarker value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResultMarker() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WorldOffset point)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResultMarker() when $default != null:
return $default(_that.point);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WorldOffset point)  $default,) {final _that = this;
switch (_that) {
case _SearchResultMarker():
return $default(_that.point);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WorldOffset point)?  $default,) {final _that = this;
switch (_that) {
case _SearchResultMarker() when $default != null:
return $default(_that.point);case _:
  return null;

}
}

}

/// @nodoc


class _SearchResultMarker extends SearchResultMarker {
  const _SearchResultMarker({required this.point}): super._();
  

@override final  WorldOffset point;

/// Create a copy of SearchResultMarker
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultMarkerCopyWith<_SearchResultMarker> get copyWith => __$SearchResultMarkerCopyWithImpl<_SearchResultMarker>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResultMarker&&(identical(other.point, point) || other.point == point));
}


@override
int get hashCode {
    return Object.hash(runtimeType,point);
}

@override
String toString() {
    return 'SearchResultMarker(point: $point)';
}


}

/// @nodoc
abstract mixin class _$SearchResultMarkerCopyWith<$Res> implements $SearchResultMarkerCopyWith<$Res> {
  factory _$SearchResultMarkerCopyWith(_SearchResultMarker value, $Res Function(_SearchResultMarker) _then) = __$SearchResultMarkerCopyWithImpl;
@override @useResult
$Res call({
 WorldOffset point
});




}
/// @nodoc
class __$SearchResultMarkerCopyWithImpl<$Res>
    implements _$SearchResultMarkerCopyWith<$Res> {
  __$SearchResultMarkerCopyWithImpl(this._self, this._then);

  final _SearchResultMarker _self;
  final $Res Function(_SearchResultMarker) _then;

/// Create a copy of SearchResultMarker
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? point = null,}) {
  return _then(_SearchResultMarker(
point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as WorldOffset,
  ));
}


}

// dart format on
