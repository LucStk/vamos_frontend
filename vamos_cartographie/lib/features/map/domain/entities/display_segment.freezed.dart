// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'display_segment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DisplaySegment {

 Segment get segment; List<LatLng> get geometry;
/// Create a copy of DisplaySegment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisplaySegmentCopyWith<DisplaySegment> get copyWith => _$DisplaySegmentCopyWithImpl<DisplaySegment>(this as DisplaySegment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisplaySegment&&(identical(other.segment, segment) || other.segment == segment)&&const DeepCollectionEquality().equals(other.geometry, geometry));
}


@override
int get hashCode => Object.hash(runtimeType,segment,const DeepCollectionEquality().hash(geometry));

@override
String toString() {
  return 'DisplaySegment(segment: $segment, geometry: $geometry)';
}


}

/// @nodoc
abstract mixin class $DisplaySegmentCopyWith<$Res>  {
  factory $DisplaySegmentCopyWith(DisplaySegment value, $Res Function(DisplaySegment) _then) = _$DisplaySegmentCopyWithImpl;
@useResult
$Res call({
 Segment segment, List<LatLng> geometry
});


$SegmentCopyWith<$Res> get segment;

}
/// @nodoc
class _$DisplaySegmentCopyWithImpl<$Res>
    implements $DisplaySegmentCopyWith<$Res> {
  _$DisplaySegmentCopyWithImpl(this._self, this._then);

  final DisplaySegment _self;
  final $Res Function(DisplaySegment) _then;

/// Create a copy of DisplaySegment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? segment = null,Object? geometry = null,}) {
  return _then(_self.copyWith(
segment: null == segment ? _self.segment : segment // ignore: cast_nullable_to_non_nullable
as Segment,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,
  ));
}
/// Create a copy of DisplaySegment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SegmentCopyWith<$Res> get segment {
  
  return $SegmentCopyWith<$Res>(_self.segment, (value) {
    return _then(_self.copyWith(segment: value));
  });
}
}


/// Adds pattern-matching-related methods to [DisplaySegment].
extension DisplaySegmentPatterns on DisplaySegment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DisplaySegment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DisplaySegment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DisplaySegment value)  $default,){
final _that = this;
switch (_that) {
case _DisplaySegment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DisplaySegment value)?  $default,){
final _that = this;
switch (_that) {
case _DisplaySegment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Segment segment,  List<LatLng> geometry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DisplaySegment() when $default != null:
return $default(_that.segment,_that.geometry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Segment segment,  List<LatLng> geometry)  $default,) {final _that = this;
switch (_that) {
case _DisplaySegment():
return $default(_that.segment,_that.geometry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Segment segment,  List<LatLng> geometry)?  $default,) {final _that = this;
switch (_that) {
case _DisplaySegment() when $default != null:
return $default(_that.segment,_that.geometry);case _:
  return null;

}
}

}

/// @nodoc


class _DisplaySegment implements DisplaySegment {
  const _DisplaySegment({required this.segment, required final  List<LatLng> geometry}): _geometry = geometry;
  

@override final  Segment segment;
 final  List<LatLng> _geometry;
@override List<LatLng> get geometry {
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometry);
}


/// Create a copy of DisplaySegment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DisplaySegmentCopyWith<_DisplaySegment> get copyWith => __$DisplaySegmentCopyWithImpl<_DisplaySegment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DisplaySegment&&(identical(other.segment, segment) || other.segment == segment)&&const DeepCollectionEquality().equals(other._geometry, _geometry));
}


@override
int get hashCode => Object.hash(runtimeType,segment,const DeepCollectionEquality().hash(_geometry));

@override
String toString() {
  return 'DisplaySegment(segment: $segment, geometry: $geometry)';
}


}

/// @nodoc
abstract mixin class _$DisplaySegmentCopyWith<$Res> implements $DisplaySegmentCopyWith<$Res> {
  factory _$DisplaySegmentCopyWith(_DisplaySegment value, $Res Function(_DisplaySegment) _then) = __$DisplaySegmentCopyWithImpl;
@override @useResult
$Res call({
 Segment segment, List<LatLng> geometry
});


@override $SegmentCopyWith<$Res> get segment;

}
/// @nodoc
class __$DisplaySegmentCopyWithImpl<$Res>
    implements _$DisplaySegmentCopyWith<$Res> {
  __$DisplaySegmentCopyWithImpl(this._self, this._then);

  final _DisplaySegment _self;
  final $Res Function(_DisplaySegment) _then;

/// Create a copy of DisplaySegment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? segment = null,Object? geometry = null,}) {
  return _then(_DisplaySegment(
segment: null == segment ? _self.segment : segment // ignore: cast_nullable_to_non_nullable
as Segment,geometry: null == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,
  ));
}

/// Create a copy of DisplaySegment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SegmentCopyWith<$Res> get segment {
  
  return $SegmentCopyWith<$Res>(_self.segment, (value) {
    return _then(_self.copyWith(segment: value));
  });
}
}

// dart format on
