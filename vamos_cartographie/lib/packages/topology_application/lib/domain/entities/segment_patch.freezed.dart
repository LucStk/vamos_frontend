// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'segment_patch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SegmentPatch {

 Id<SegmentPatch> get id; Geometry get geometryOverride; bool get recomputing; Object? get error;
/// Create a copy of SegmentPatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentPatchCopyWith<SegmentPatch> get copyWith => _$SegmentPatchCopyWithImpl<SegmentPatch>(this as SegmentPatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentPatch&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.geometryOverride, geometryOverride)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(geometryOverride),recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'SegmentPatch(id: $id, geometryOverride: $geometryOverride, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class $SegmentPatchCopyWith<$Res>  {
  factory $SegmentPatchCopyWith(SegmentPatch value, $Res Function(SegmentPatch) _then) = _$SegmentPatchCopyWithImpl;
@useResult
$Res call({
 Id<SegmentPatch> id, Geometry geometryOverride, bool recomputing, Object? error
});




}
/// @nodoc
class _$SegmentPatchCopyWithImpl<$Res>
    implements $SegmentPatchCopyWith<$Res> {
  _$SegmentPatchCopyWithImpl(this._self, this._then);

  final SegmentPatch _self;
  final $Res Function(SegmentPatch) _then;

/// Create a copy of SegmentPatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? geometryOverride = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<SegmentPatch>,geometryOverride: null == geometryOverride ? _self.geometryOverride : geometryOverride // ignore: cast_nullable_to_non_nullable
as Geometry,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [SegmentPatch].
extension SegmentPatchPatterns on SegmentPatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SegmentPatch value)?  internal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SegmentPatch() when internal != null:
return internal(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SegmentPatch value)  internal,}){
final _that = this;
switch (_that) {
case _SegmentPatch():
return internal(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SegmentPatch value)?  internal,}){
final _that = this;
switch (_that) {
case _SegmentPatch() when internal != null:
return internal(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Id<SegmentPatch> id,  Geometry geometryOverride,  bool recomputing,  Object? error)?  internal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SegmentPatch() when internal != null:
return internal(_that.id,_that.geometryOverride,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Id<SegmentPatch> id,  Geometry geometryOverride,  bool recomputing,  Object? error)  internal,}) {final _that = this;
switch (_that) {
case _SegmentPatch():
return internal(_that.id,_that.geometryOverride,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Id<SegmentPatch> id,  Geometry geometryOverride,  bool recomputing,  Object? error)?  internal,}) {final _that = this;
switch (_that) {
case _SegmentPatch() when internal != null:
return internal(_that.id,_that.geometryOverride,_that.recomputing,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SegmentPatch extends SegmentPatch {
  const _SegmentPatch({required this.id, required final  Geometry geometryOverride, this.recomputing = false, this.error}): _geometryOverride = geometryOverride,super._();
  

@override final  Id<SegmentPatch> id;
 final  Geometry _geometryOverride;
@override Geometry get geometryOverride {
  if (_geometryOverride is EqualUnmodifiableListView) return _geometryOverride;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometryOverride);
}

@override@JsonKey() final  bool recomputing;
@override final  Object? error;

/// Create a copy of SegmentPatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SegmentPatchCopyWith<_SegmentPatch> get copyWith => __$SegmentPatchCopyWithImpl<_SegmentPatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SegmentPatch&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._geometryOverride, _geometryOverride)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_geometryOverride),recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'SegmentPatch.internal(id: $id, geometryOverride: $geometryOverride, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SegmentPatchCopyWith<$Res> implements $SegmentPatchCopyWith<$Res> {
  factory _$SegmentPatchCopyWith(_SegmentPatch value, $Res Function(_SegmentPatch) _then) = __$SegmentPatchCopyWithImpl;
@override @useResult
$Res call({
 Id<SegmentPatch> id, Geometry geometryOverride, bool recomputing, Object? error
});




}
/// @nodoc
class __$SegmentPatchCopyWithImpl<$Res>
    implements _$SegmentPatchCopyWith<$Res> {
  __$SegmentPatchCopyWithImpl(this._self, this._then);

  final _SegmentPatch _self;
  final $Res Function(_SegmentPatch) _then;

/// Create a copy of SegmentPatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? geometryOverride = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_SegmentPatch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<SegmentPatch>,geometryOverride: null == geometryOverride ? _self._geometryOverride : geometryOverride // ignore: cast_nullable_to_non_nullable
as Geometry,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
