// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sketch_trace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SketchAnchor {

 MapHit<RouteElements> get hit;
/// Create a copy of SketchAnchor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SketchAnchorCopyWith<SketchAnchor> get copyWith => _$SketchAnchorCopyWithImpl<SketchAnchor>(this as SketchAnchor, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SketchAnchor;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SketchAnchor&&(identical(other.hit, _this.hit) || other.hit == _this.hit));
}


@override
int get hashCode {
  final _this = this as SketchAnchor;
  return Object.hash(runtimeType,_this.hit);
}

@override
String toString() {
  final _this = this as SketchAnchor;
  return 'SketchAnchor(hit: ${_this.hit})';
}


}

/// @nodoc
abstract mixin class $SketchAnchorCopyWith<$Res>  {
  factory $SketchAnchorCopyWith(SketchAnchor value, $Res Function(SketchAnchor) _then) = _$SketchAnchorCopyWithImpl;
@useResult
$Res call({
 MapHit<RouteElements> hit
});




}
/// @nodoc
class _$SketchAnchorCopyWithImpl<$Res>
    implements $SketchAnchorCopyWith<$Res> {
  _$SketchAnchorCopyWithImpl(this._self, this._then);

  final SketchAnchor _self;
  final $Res Function(SketchAnchor) _then;

/// Create a copy of SketchAnchor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hit = null,}) {
  return _then(SketchAnchor(
null == hit ? _self.hit : hit // ignore: cast_nullable_to_non_nullable
as MapHit<RouteElements>,
  ));
}

}


/// Adds pattern-matching-related methods to [SketchAnchor].
extension SketchAnchorPatterns on SketchAnchor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SketchAnchor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SketchAnchor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SketchAnchor value)  $default,){
final _that = this;
switch (_that) {
case _SketchAnchor():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SketchAnchor value)?  $default,){
final _that = this;
switch (_that) {
case _SketchAnchor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MapHit<RouteElements> hit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SketchAnchor() when $default != null:
return $default(_that.hit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MapHit<RouteElements> hit)  $default,) {final _that = this;
switch (_that) {
case _SketchAnchor():
return $default(_that.hit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MapHit<RouteElements> hit)?  $default,) {final _that = this;
switch (_that) {
case _SketchAnchor() when $default != null:
return $default(_that.hit);case _:
  return null;

}
}

}

/// @nodoc


class _SketchAnchor extends SketchAnchor {
  const _SketchAnchor(this.hit): super._();
  

@override final  MapHit<RouteElements> hit;

/// Create a copy of SketchAnchor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SketchAnchorCopyWith<_SketchAnchor> get copyWith => __$SketchAnchorCopyWithImpl<_SketchAnchor>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SketchAnchor&&(identical(other.hit, hit) || other.hit == hit));
}


@override
int get hashCode {
    return Object.hash(runtimeType,hit);
}

@override
String toString() {
    return 'SketchAnchor(hit: $hit)';
}


}

/// @nodoc
abstract mixin class _$SketchAnchorCopyWith<$Res> implements $SketchAnchorCopyWith<$Res> {
  factory _$SketchAnchorCopyWith(_SketchAnchor value, $Res Function(_SketchAnchor) _then) = __$SketchAnchorCopyWithImpl;
@override @useResult
$Res call({
 MapHit<RouteElements> hit
});




}
/// @nodoc
class __$SketchAnchorCopyWithImpl<$Res>
    implements _$SketchAnchorCopyWith<$Res> {
  __$SketchAnchorCopyWithImpl(this._self, this._then);

  final _SketchAnchor _self;
  final $Res Function(_SketchAnchor) _then;

/// Create a copy of SketchAnchor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hit = null,}) {
  return _then(_SketchAnchor(
null == hit ? _self.hit : hit // ignore: cast_nullable_to_non_nullable
as MapHit<RouteElements>,
  ));
}


}

/// @nodoc
mixin _$SketchTrace {

 SketchAnchor get startAnchor; SketchAnchor? get endAnchor; MobilityType? get mobilityType; List<WorldOffset> get points; Offset get grabOffset;
/// Create a copy of SketchTrace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SketchTraceCopyWith<SketchTrace> get copyWith => _$SketchTraceCopyWithImpl<SketchTrace>(this as SketchTrace, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SketchTrace;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SketchTrace&&(identical(other.startAnchor, _this.startAnchor) || other.startAnchor == _this.startAnchor)&&(identical(other.endAnchor, _this.endAnchor) || other.endAnchor == _this.endAnchor)&&(identical(other.mobilityType, _this.mobilityType) || other.mobilityType == _this.mobilityType)&&const DeepCollectionEquality().equals(other.points, _this.points)&&const DeepCollectionEquality().equals(other.grabOffset, _this.grabOffset));
}


@override
int get hashCode {
  final _this = this as SketchTrace;
  return Object.hash(runtimeType,_this.startAnchor,_this.endAnchor,_this.mobilityType,const DeepCollectionEquality().hash(_this.points),const DeepCollectionEquality().hash(_this.grabOffset));
}

@override
String toString() {
  final _this = this as SketchTrace;
  return 'SketchTrace(startAnchor: ${_this.startAnchor}, endAnchor: ${_this.endAnchor}, mobilityType: ${_this.mobilityType}, points: ${_this.points}, grabOffset: ${_this.grabOffset})';
}


}

/// @nodoc
abstract mixin class $SketchTraceCopyWith<$Res>  {
  factory $SketchTraceCopyWith(SketchTrace value, $Res Function(SketchTrace) _then) = _$SketchTraceCopyWithImpl;
@useResult
$Res call({
 SketchAnchor startAnchor, SketchAnchor? endAnchor, MobilityType? mobilityType, List<WorldOffset> points, Offset grabOffset
});


$SketchAnchorCopyWith<$Res> get startAnchor;$SketchAnchorCopyWith<$Res>? get endAnchor;

}
/// @nodoc
class _$SketchTraceCopyWithImpl<$Res>
    implements $SketchTraceCopyWith<$Res> {
  _$SketchTraceCopyWithImpl(this._self, this._then);

  final SketchTrace _self;
  final $Res Function(SketchTrace) _then;

/// Create a copy of SketchTrace
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startAnchor = null,Object? endAnchor = freezed,Object? mobilityType = freezed,Object? points = null,Object? grabOffset = freezed,}) {
  return _then(SketchTrace(
startAnchor: null == startAnchor ? _self.startAnchor : startAnchor // ignore: cast_nullable_to_non_nullable
as SketchAnchor,endAnchor: freezed == endAnchor ? _self.endAnchor : endAnchor // ignore: cast_nullable_to_non_nullable
as SketchAnchor?,mobilityType: freezed == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType?,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<WorldOffset>,grabOffset: freezed == grabOffset ? _self.grabOffset : grabOffset // ignore: cast_nullable_to_non_nullable
as Offset,
  ));
}
/// Create a copy of SketchTrace
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SketchAnchorCopyWith<$Res> get startAnchor {
  
  return $SketchAnchorCopyWith<$Res>(_self.startAnchor, (value) {
    return _then(_self.copyWith(startAnchor: value));
  });
}/// Create a copy of SketchTrace
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SketchAnchorCopyWith<$Res>? get endAnchor {
    if (_self.endAnchor == null) {
    return null;
  }

  return $SketchAnchorCopyWith<$Res>(_self.endAnchor!, (value) {
    return _then(_self.copyWith(endAnchor: value));
  });
}
}


/// Adds pattern-matching-related methods to [SketchTrace].
extension SketchTracePatterns on SketchTrace {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SketchTrace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SketchTrace() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SketchTrace value)  $default,){
final _that = this;
switch (_that) {
case _SketchTrace():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SketchTrace value)?  $default,){
final _that = this;
switch (_that) {
case _SketchTrace() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SketchAnchor startAnchor,  SketchAnchor? endAnchor,  MobilityType? mobilityType,  List<WorldOffset> points,  Offset grabOffset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SketchTrace() when $default != null:
return $default(_that.startAnchor,_that.endAnchor,_that.mobilityType,_that.points,_that.grabOffset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SketchAnchor startAnchor,  SketchAnchor? endAnchor,  MobilityType? mobilityType,  List<WorldOffset> points,  Offset grabOffset)  $default,) {final _that = this;
switch (_that) {
case _SketchTrace():
return $default(_that.startAnchor,_that.endAnchor,_that.mobilityType,_that.points,_that.grabOffset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SketchAnchor startAnchor,  SketchAnchor? endAnchor,  MobilityType? mobilityType,  List<WorldOffset> points,  Offset grabOffset)?  $default,) {final _that = this;
switch (_that) {
case _SketchTrace() when $default != null:
return $default(_that.startAnchor,_that.endAnchor,_that.mobilityType,_that.points,_that.grabOffset);case _:
  return null;

}
}

}

/// @nodoc


class _SketchTrace extends SketchTrace {
  const _SketchTrace({required this.startAnchor, this.endAnchor, this.mobilityType,  List<WorldOffset> points = const [], this.grabOffset = Offset.zero}): _points = points,super._();
  

@override final  SketchAnchor startAnchor;
@override final  SketchAnchor? endAnchor;
@override final  MobilityType? mobilityType;
 final  List<WorldOffset> _points;
@override@JsonKey() List<WorldOffset> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}

@override@JsonKey() final  Offset grabOffset;

/// Create a copy of SketchTrace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SketchTraceCopyWith<_SketchTrace> get copyWith => __$SketchTraceCopyWithImpl<_SketchTrace>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SketchTrace&&(identical(other.startAnchor, startAnchor) || other.startAnchor == startAnchor)&&(identical(other.endAnchor, endAnchor) || other.endAnchor == endAnchor)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType)&&const DeepCollectionEquality().equals(other.points, _points)&&const DeepCollectionEquality().equals(other.grabOffset, grabOffset));
}


@override
int get hashCode {
    return Object.hash(runtimeType,startAnchor,endAnchor,mobilityType,const DeepCollectionEquality().hash(_points),const DeepCollectionEquality().hash(grabOffset));
}

@override
String toString() {
    return 'SketchTrace(startAnchor: $startAnchor, endAnchor: $endAnchor, mobilityType: $mobilityType, points: $points, grabOffset: $grabOffset)';
}


}

/// @nodoc
abstract mixin class _$SketchTraceCopyWith<$Res> implements $SketchTraceCopyWith<$Res> {
  factory _$SketchTraceCopyWith(_SketchTrace value, $Res Function(_SketchTrace) _then) = __$SketchTraceCopyWithImpl;
@override @useResult
$Res call({
 SketchAnchor startAnchor, SketchAnchor? endAnchor, MobilityType? mobilityType, List<WorldOffset> points, Offset grabOffset
});


@override $SketchAnchorCopyWith<$Res> get startAnchor;@override $SketchAnchorCopyWith<$Res>? get endAnchor;

}
/// @nodoc
class __$SketchTraceCopyWithImpl<$Res>
    implements _$SketchTraceCopyWith<$Res> {
  __$SketchTraceCopyWithImpl(this._self, this._then);

  final _SketchTrace _self;
  final $Res Function(_SketchTrace) _then;

/// Create a copy of SketchTrace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startAnchor = null,Object? endAnchor = freezed,Object? mobilityType = freezed,Object? points = null,Object? grabOffset = freezed,}) {
  return _then(_SketchTrace(
startAnchor: null == startAnchor ? _self.startAnchor : startAnchor // ignore: cast_nullable_to_non_nullable
as SketchAnchor,endAnchor: freezed == endAnchor ? _self.endAnchor : endAnchor // ignore: cast_nullable_to_non_nullable
as SketchAnchor?,mobilityType: freezed == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType?,points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<WorldOffset>,grabOffset: freezed == grabOffset ? _self.grabOffset : grabOffset // ignore: cast_nullable_to_non_nullable
as Offset,
  ));
}

/// Create a copy of SketchTrace
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SketchAnchorCopyWith<$Res> get startAnchor {
  
  return $SketchAnchorCopyWith<$Res>(_self.startAnchor, (value) {
    return _then(_self.copyWith(startAnchor: value));
  });
}/// Create a copy of SketchTrace
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SketchAnchorCopyWith<$Res>? get endAnchor {
    if (_self.endAnchor == null) {
    return null;
  }

  return $SketchAnchorCopyWith<$Res>(_self.endAnchor!, (value) {
    return _then(_self.copyWith(endAnchor: value));
  });
}
}

// dart format on
