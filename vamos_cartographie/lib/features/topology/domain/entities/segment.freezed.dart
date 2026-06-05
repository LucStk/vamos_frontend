// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'segment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Segment {

 int get id; int get startVertexId; int get endVertexId; List<LatLng> get geometry; SegmentType get type;
/// Create a copy of Segment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentCopyWith<Segment> get copyWith => _$SegmentCopyWithImpl<Segment>(this as Segment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Segment&&(identical(other.id, id) || other.id == id)&&(identical(other.startVertexId, startVertexId) || other.startVertexId == startVertexId)&&(identical(other.endVertexId, endVertexId) || other.endVertexId == endVertexId)&&const DeepCollectionEquality().equals(other.geometry, geometry)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,startVertexId,endVertexId,const DeepCollectionEquality().hash(geometry),type);

@override
String toString() {
  return 'Segment(id: $id, startVertexId: $startVertexId, endVertexId: $endVertexId, geometry: $geometry, type: $type)';
}


}

/// @nodoc
abstract mixin class $SegmentCopyWith<$Res>  {
  factory $SegmentCopyWith(Segment value, $Res Function(Segment) _then) = _$SegmentCopyWithImpl;
@useResult
$Res call({
 int id, int startVertexId, int endVertexId, List<LatLng> geometry, SegmentType type
});




}
/// @nodoc
class _$SegmentCopyWithImpl<$Res>
    implements $SegmentCopyWith<$Res> {
  _$SegmentCopyWithImpl(this._self, this._then);

  final Segment _self;
  final $Res Function(Segment) _then;

/// Create a copy of Segment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startVertexId = null,Object? endVertexId = null,Object? geometry = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startVertexId: null == startVertexId ? _self.startVertexId : startVertexId // ignore: cast_nullable_to_non_nullable
as int,endVertexId: null == endVertexId ? _self.endVertexId : endVertexId // ignore: cast_nullable_to_non_nullable
as int,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SegmentType,
  ));
}

}


/// Adds pattern-matching-related methods to [Segment].
extension SegmentPatterns on Segment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Segment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Segment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Segment value)  $default,){
final _that = this;
switch (_that) {
case _Segment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Segment value)?  $default,){
final _that = this;
switch (_that) {
case _Segment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int startVertexId,  int endVertexId,  List<LatLng> geometry,  SegmentType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Segment() when $default != null:
return $default(_that.id,_that.startVertexId,_that.endVertexId,_that.geometry,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int startVertexId,  int endVertexId,  List<LatLng> geometry,  SegmentType type)  $default,) {final _that = this;
switch (_that) {
case _Segment():
return $default(_that.id,_that.startVertexId,_that.endVertexId,_that.geometry,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int startVertexId,  int endVertexId,  List<LatLng> geometry,  SegmentType type)?  $default,) {final _that = this;
switch (_that) {
case _Segment() when $default != null:
return $default(_that.id,_that.startVertexId,_that.endVertexId,_that.geometry,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _Segment extends Segment {
  const _Segment({required this.id, required this.startVertexId, required this.endVertexId, final  List<LatLng> geometry = const [], this.type = SegmentType.bike}): _geometry = geometry,super._();
  

@override final  int id;
@override final  int startVertexId;
@override final  int endVertexId;
 final  List<LatLng> _geometry;
@override@JsonKey() List<LatLng> get geometry {
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometry);
}

@override@JsonKey() final  SegmentType type;

/// Create a copy of Segment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SegmentCopyWith<_Segment> get copyWith => __$SegmentCopyWithImpl<_Segment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Segment&&(identical(other.id, id) || other.id == id)&&(identical(other.startVertexId, startVertexId) || other.startVertexId == startVertexId)&&(identical(other.endVertexId, endVertexId) || other.endVertexId == endVertexId)&&const DeepCollectionEquality().equals(other._geometry, _geometry)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,startVertexId,endVertexId,const DeepCollectionEquality().hash(_geometry),type);

@override
String toString() {
  return 'Segment(id: $id, startVertexId: $startVertexId, endVertexId: $endVertexId, geometry: $geometry, type: $type)';
}


}

/// @nodoc
abstract mixin class _$SegmentCopyWith<$Res> implements $SegmentCopyWith<$Res> {
  factory _$SegmentCopyWith(_Segment value, $Res Function(_Segment) _then) = __$SegmentCopyWithImpl;
@override @useResult
$Res call({
 int id, int startVertexId, int endVertexId, List<LatLng> geometry, SegmentType type
});




}
/// @nodoc
class __$SegmentCopyWithImpl<$Res>
    implements _$SegmentCopyWith<$Res> {
  __$SegmentCopyWithImpl(this._self, this._then);

  final _Segment _self;
  final $Res Function(_Segment) _then;

/// Create a copy of Segment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startVertexId = null,Object? endVertexId = null,Object? geometry = null,Object? type = null,}) {
  return _then(_Segment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startVertexId: null == startVertexId ? _self.startVertexId : startVertexId // ignore: cast_nullable_to_non_nullable
as int,endVertexId: null == endVertexId ? _self.endVertexId : endVertexId // ignore: cast_nullable_to_non_nullable
as int,geometry: null == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SegmentType,
  ));
}


}

/// @nodoc
mixin _$SegmentDraft {

 int get startVertexId; int get endVertexId; List<LatLng>? get geometry; SegmentType get type;
/// Create a copy of SegmentDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentDraftCopyWith<SegmentDraft> get copyWith => _$SegmentDraftCopyWithImpl<SegmentDraft>(this as SegmentDraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentDraft&&(identical(other.startVertexId, startVertexId) || other.startVertexId == startVertexId)&&(identical(other.endVertexId, endVertexId) || other.endVertexId == endVertexId)&&const DeepCollectionEquality().equals(other.geometry, geometry)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,startVertexId,endVertexId,const DeepCollectionEquality().hash(geometry),type);

@override
String toString() {
  return 'SegmentDraft(startVertexId: $startVertexId, endVertexId: $endVertexId, geometry: $geometry, type: $type)';
}


}

/// @nodoc
abstract mixin class $SegmentDraftCopyWith<$Res>  {
  factory $SegmentDraftCopyWith(SegmentDraft value, $Res Function(SegmentDraft) _then) = _$SegmentDraftCopyWithImpl;
@useResult
$Res call({
 int startVertexId, int endVertexId, List<LatLng>? geometry, SegmentType type
});




}
/// @nodoc
class _$SegmentDraftCopyWithImpl<$Res>
    implements $SegmentDraftCopyWith<$Res> {
  _$SegmentDraftCopyWithImpl(this._self, this._then);

  final SegmentDraft _self;
  final $Res Function(SegmentDraft) _then;

/// Create a copy of SegmentDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startVertexId = null,Object? endVertexId = null,Object? geometry = freezed,Object? type = null,}) {
  return _then(_self.copyWith(
startVertexId: null == startVertexId ? _self.startVertexId : startVertexId // ignore: cast_nullable_to_non_nullable
as int,endVertexId: null == endVertexId ? _self.endVertexId : endVertexId // ignore: cast_nullable_to_non_nullable
as int,geometry: freezed == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SegmentType,
  ));
}

}


/// Adds pattern-matching-related methods to [SegmentDraft].
extension SegmentDraftPatterns on SegmentDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SegmentDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SegmentDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SegmentDraft value)  $default,){
final _that = this;
switch (_that) {
case _SegmentDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SegmentDraft value)?  $default,){
final _that = this;
switch (_that) {
case _SegmentDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int startVertexId,  int endVertexId,  List<LatLng>? geometry,  SegmentType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SegmentDraft() when $default != null:
return $default(_that.startVertexId,_that.endVertexId,_that.geometry,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int startVertexId,  int endVertexId,  List<LatLng>? geometry,  SegmentType type)  $default,) {final _that = this;
switch (_that) {
case _SegmentDraft():
return $default(_that.startVertexId,_that.endVertexId,_that.geometry,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int startVertexId,  int endVertexId,  List<LatLng>? geometry,  SegmentType type)?  $default,) {final _that = this;
switch (_that) {
case _SegmentDraft() when $default != null:
return $default(_that.startVertexId,_that.endVertexId,_that.geometry,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _SegmentDraft extends SegmentDraft {
  const _SegmentDraft({required this.startVertexId, required this.endVertexId, final  List<LatLng>? geometry, this.type = SegmentType.bike}): _geometry = geometry,super._();
  

@override final  int startVertexId;
@override final  int endVertexId;
 final  List<LatLng>? _geometry;
@override List<LatLng>? get geometry {
  final value = _geometry;
  if (value == null) return null;
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  SegmentType type;

/// Create a copy of SegmentDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SegmentDraftCopyWith<_SegmentDraft> get copyWith => __$SegmentDraftCopyWithImpl<_SegmentDraft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SegmentDraft&&(identical(other.startVertexId, startVertexId) || other.startVertexId == startVertexId)&&(identical(other.endVertexId, endVertexId) || other.endVertexId == endVertexId)&&const DeepCollectionEquality().equals(other._geometry, _geometry)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,startVertexId,endVertexId,const DeepCollectionEquality().hash(_geometry),type);

@override
String toString() {
  return 'SegmentDraft(startVertexId: $startVertexId, endVertexId: $endVertexId, geometry: $geometry, type: $type)';
}


}

/// @nodoc
abstract mixin class _$SegmentDraftCopyWith<$Res> implements $SegmentDraftCopyWith<$Res> {
  factory _$SegmentDraftCopyWith(_SegmentDraft value, $Res Function(_SegmentDraft) _then) = __$SegmentDraftCopyWithImpl;
@override @useResult
$Res call({
 int startVertexId, int endVertexId, List<LatLng>? geometry, SegmentType type
});




}
/// @nodoc
class __$SegmentDraftCopyWithImpl<$Res>
    implements _$SegmentDraftCopyWith<$Res> {
  __$SegmentDraftCopyWithImpl(this._self, this._then);

  final _SegmentDraft _self;
  final $Res Function(_SegmentDraft) _then;

/// Create a copy of SegmentDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startVertexId = null,Object? endVertexId = null,Object? geometry = freezed,Object? type = null,}) {
  return _then(_SegmentDraft(
startVertexId: null == startVertexId ? _self.startVertexId : startVertexId // ignore: cast_nullable_to_non_nullable
as int,endVertexId: null == endVertexId ? _self.endVertexId : endVertexId // ignore: cast_nullable_to_non_nullable
as int,geometry: freezed == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SegmentType,
  ));
}


}

// dart format on
