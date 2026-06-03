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

 int get id; int get startWaypointId; int get endWaypointId; SegmentType get type; List<LatLng> get geometry;
/// Create a copy of Segment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentCopyWith<Segment> get copyWith => _$SegmentCopyWithImpl<Segment>(this as Segment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Segment&&(identical(other.id, id) || other.id == id)&&(identical(other.startWaypointId, startWaypointId) || other.startWaypointId == startWaypointId)&&(identical(other.endWaypointId, endWaypointId) || other.endWaypointId == endWaypointId)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.geometry, geometry));
}


@override
int get hashCode => Object.hash(runtimeType,id,startWaypointId,endWaypointId,type,const DeepCollectionEquality().hash(geometry));

@override
String toString() {
  return 'Segment(id: $id, startWaypointId: $startWaypointId, endWaypointId: $endWaypointId, type: $type, geometry: $geometry)';
}


}

/// @nodoc
abstract mixin class $SegmentCopyWith<$Res>  {
  factory $SegmentCopyWith(Segment value, $Res Function(Segment) _then) = _$SegmentCopyWithImpl;
@useResult
$Res call({
 int id, int startWaypointId, int endWaypointId, SegmentType type, List<LatLng> geometry
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startWaypointId = null,Object? endWaypointId = null,Object? type = null,Object? geometry = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startWaypointId: null == startWaypointId ? _self.startWaypointId : startWaypointId // ignore: cast_nullable_to_non_nullable
as int,endWaypointId: null == endWaypointId ? _self.endWaypointId : endWaypointId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SegmentType,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int startWaypointId,  int endWaypointId,  SegmentType type,  List<LatLng> geometry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Segment() when $default != null:
return $default(_that.id,_that.startWaypointId,_that.endWaypointId,_that.type,_that.geometry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int startWaypointId,  int endWaypointId,  SegmentType type,  List<LatLng> geometry)  $default,) {final _that = this;
switch (_that) {
case _Segment():
return $default(_that.id,_that.startWaypointId,_that.endWaypointId,_that.type,_that.geometry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int startWaypointId,  int endWaypointId,  SegmentType type,  List<LatLng> geometry)?  $default,) {final _that = this;
switch (_that) {
case _Segment() when $default != null:
return $default(_that.id,_that.startWaypointId,_that.endWaypointId,_that.type,_that.geometry);case _:
  return null;

}
}

}

/// @nodoc


class _Segment extends Segment {
  const _Segment({required this.id, required this.startWaypointId, required this.endWaypointId, this.type = SegmentType.bike, final  List<LatLng> geometry = const []}): _geometry = geometry,super._();
  

@override final  int id;
@override final  int startWaypointId;
@override final  int endWaypointId;
@override@JsonKey() final  SegmentType type;
 final  List<LatLng> _geometry;
@override@JsonKey() List<LatLng> get geometry {
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometry);
}


/// Create a copy of Segment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SegmentCopyWith<_Segment> get copyWith => __$SegmentCopyWithImpl<_Segment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Segment&&(identical(other.id, id) || other.id == id)&&(identical(other.startWaypointId, startWaypointId) || other.startWaypointId == startWaypointId)&&(identical(other.endWaypointId, endWaypointId) || other.endWaypointId == endWaypointId)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._geometry, _geometry));
}


@override
int get hashCode => Object.hash(runtimeType,id,startWaypointId,endWaypointId,type,const DeepCollectionEquality().hash(_geometry));

@override
String toString() {
  return 'Segment(id: $id, startWaypointId: $startWaypointId, endWaypointId: $endWaypointId, type: $type, geometry: $geometry)';
}


}

/// @nodoc
abstract mixin class _$SegmentCopyWith<$Res> implements $SegmentCopyWith<$Res> {
  factory _$SegmentCopyWith(_Segment value, $Res Function(_Segment) _then) = __$SegmentCopyWithImpl;
@override @useResult
$Res call({
 int id, int startWaypointId, int endWaypointId, SegmentType type, List<LatLng> geometry
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startWaypointId = null,Object? endWaypointId = null,Object? type = null,Object? geometry = null,}) {
  return _then(_Segment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startWaypointId: null == startWaypointId ? _self.startWaypointId : startWaypointId // ignore: cast_nullable_to_non_nullable
as int,endWaypointId: null == endWaypointId ? _self.endWaypointId : endWaypointId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SegmentType,geometry: null == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,
  ));
}


}

/// @nodoc
mixin _$SegmentDraft {

 int get startWaypointId; int get endWaypointId; SegmentType get type; List<LatLng> get geometry;
/// Create a copy of SegmentDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentDraftCopyWith<SegmentDraft> get copyWith => _$SegmentDraftCopyWithImpl<SegmentDraft>(this as SegmentDraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentDraft&&(identical(other.startWaypointId, startWaypointId) || other.startWaypointId == startWaypointId)&&(identical(other.endWaypointId, endWaypointId) || other.endWaypointId == endWaypointId)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.geometry, geometry));
}


@override
int get hashCode => Object.hash(runtimeType,startWaypointId,endWaypointId,type,const DeepCollectionEquality().hash(geometry));

@override
String toString() {
  return 'SegmentDraft(startWaypointId: $startWaypointId, endWaypointId: $endWaypointId, type: $type, geometry: $geometry)';
}


}

/// @nodoc
abstract mixin class $SegmentDraftCopyWith<$Res>  {
  factory $SegmentDraftCopyWith(SegmentDraft value, $Res Function(SegmentDraft) _then) = _$SegmentDraftCopyWithImpl;
@useResult
$Res call({
 int startWaypointId, int endWaypointId, SegmentType type, List<LatLng> geometry
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
@pragma('vm:prefer-inline') @override $Res call({Object? startWaypointId = null,Object? endWaypointId = null,Object? type = null,Object? geometry = null,}) {
  return _then(_self.copyWith(
startWaypointId: null == startWaypointId ? _self.startWaypointId : startWaypointId // ignore: cast_nullable_to_non_nullable
as int,endWaypointId: null == endWaypointId ? _self.endWaypointId : endWaypointId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SegmentType,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int startWaypointId,  int endWaypointId,  SegmentType type,  List<LatLng> geometry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SegmentDraft() when $default != null:
return $default(_that.startWaypointId,_that.endWaypointId,_that.type,_that.geometry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int startWaypointId,  int endWaypointId,  SegmentType type,  List<LatLng> geometry)  $default,) {final _that = this;
switch (_that) {
case _SegmentDraft():
return $default(_that.startWaypointId,_that.endWaypointId,_that.type,_that.geometry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int startWaypointId,  int endWaypointId,  SegmentType type,  List<LatLng> geometry)?  $default,) {final _that = this;
switch (_that) {
case _SegmentDraft() when $default != null:
return $default(_that.startWaypointId,_that.endWaypointId,_that.type,_that.geometry);case _:
  return null;

}
}

}

/// @nodoc


class _SegmentDraft extends SegmentDraft {
  const _SegmentDraft({required this.startWaypointId, required this.endWaypointId, this.type = SegmentType.bike, final  List<LatLng> geometry = const []}): _geometry = geometry,super._();
  

@override final  int startWaypointId;
@override final  int endWaypointId;
@override@JsonKey() final  SegmentType type;
 final  List<LatLng> _geometry;
@override@JsonKey() List<LatLng> get geometry {
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometry);
}


/// Create a copy of SegmentDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SegmentDraftCopyWith<_SegmentDraft> get copyWith => __$SegmentDraftCopyWithImpl<_SegmentDraft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SegmentDraft&&(identical(other.startWaypointId, startWaypointId) || other.startWaypointId == startWaypointId)&&(identical(other.endWaypointId, endWaypointId) || other.endWaypointId == endWaypointId)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._geometry, _geometry));
}


@override
int get hashCode => Object.hash(runtimeType,startWaypointId,endWaypointId,type,const DeepCollectionEquality().hash(_geometry));

@override
String toString() {
  return 'SegmentDraft(startWaypointId: $startWaypointId, endWaypointId: $endWaypointId, type: $type, geometry: $geometry)';
}


}

/// @nodoc
abstract mixin class _$SegmentDraftCopyWith<$Res> implements $SegmentDraftCopyWith<$Res> {
  factory _$SegmentDraftCopyWith(_SegmentDraft value, $Res Function(_SegmentDraft) _then) = __$SegmentDraftCopyWithImpl;
@override @useResult
$Res call({
 int startWaypointId, int endWaypointId, SegmentType type, List<LatLng> geometry
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
@override @pragma('vm:prefer-inline') $Res call({Object? startWaypointId = null,Object? endWaypointId = null,Object? type = null,Object? geometry = null,}) {
  return _then(_SegmentDraft(
startWaypointId: null == startWaypointId ? _self.startWaypointId : startWaypointId // ignore: cast_nullable_to_non_nullable
as int,endWaypointId: null == endWaypointId ? _self.endWaypointId : endWaypointId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SegmentType,geometry: null == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,
  ));
}


}

// dart format on
