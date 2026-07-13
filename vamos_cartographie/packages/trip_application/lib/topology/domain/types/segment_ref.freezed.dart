// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'segment_ref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SegmentRef {

 Id<Segment> get id;
/// Create a copy of SegmentRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SegmentRefCopyWith<SegmentRef> get copyWith => _$SegmentRefCopyWithImpl<SegmentRef>(this as SegmentRef, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SegmentRef&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'SegmentRef(id: $id)';
}


}

/// @nodoc
abstract mixin class $SegmentRefCopyWith<$Res>  {
  factory $SegmentRefCopyWith(SegmentRef value, $Res Function(SegmentRef) _then) = _$SegmentRefCopyWithImpl;
@useResult
$Res call({
 Id<Segment> id
});




}
/// @nodoc
class _$SegmentRefCopyWithImpl<$Res>
    implements $SegmentRefCopyWith<$Res> {
  _$SegmentRefCopyWithImpl(this._self, this._then);

  final SegmentRef _self;
  final $Res Function(SegmentRef) _then;

/// Create a copy of SegmentRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<Segment>,
  ));
}

}


/// Adds pattern-matching-related methods to [SegmentRef].
extension SegmentRefPatterns on SegmentRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConfirmedSegmentRef value)?  confirmed,TResult Function( PendingSegmentRef value)?  pending,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConfirmedSegmentRef() when confirmed != null:
return confirmed(_that);case PendingSegmentRef() when pending != null:
return pending(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConfirmedSegmentRef value)  confirmed,required TResult Function( PendingSegmentRef value)  pending,}){
final _that = this;
switch (_that) {
case ConfirmedSegmentRef():
return confirmed(_that);case PendingSegmentRef():
return pending(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConfirmedSegmentRef value)?  confirmed,TResult? Function( PendingSegmentRef value)?  pending,}){
final _that = this;
switch (_that) {
case ConfirmedSegmentRef() when confirmed != null:
return confirmed(_that);case PendingSegmentRef() when pending != null:
return pending(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Id<Segment> id)?  confirmed,TResult Function( Id<Segment> id)?  pending,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConfirmedSegmentRef() when confirmed != null:
return confirmed(_that.id);case PendingSegmentRef() when pending != null:
return pending(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Id<Segment> id)  confirmed,required TResult Function( Id<Segment> id)  pending,}) {final _that = this;
switch (_that) {
case ConfirmedSegmentRef():
return confirmed(_that.id);case PendingSegmentRef():
return pending(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Id<Segment> id)?  confirmed,TResult? Function( Id<Segment> id)?  pending,}) {final _that = this;
switch (_that) {
case ConfirmedSegmentRef() when confirmed != null:
return confirmed(_that.id);case PendingSegmentRef() when pending != null:
return pending(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class ConfirmedSegmentRef implements SegmentRef {
  const ConfirmedSegmentRef(this.id);
  

@override final  Id<Segment> id;

/// Create a copy of SegmentRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmedSegmentRefCopyWith<ConfirmedSegmentRef> get copyWith => _$ConfirmedSegmentRefCopyWithImpl<ConfirmedSegmentRef>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmedSegmentRef&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'SegmentRef.confirmed(id: $id)';
}


}

/// @nodoc
abstract mixin class $ConfirmedSegmentRefCopyWith<$Res> implements $SegmentRefCopyWith<$Res> {
  factory $ConfirmedSegmentRefCopyWith(ConfirmedSegmentRef value, $Res Function(ConfirmedSegmentRef) _then) = _$ConfirmedSegmentRefCopyWithImpl;
@override @useResult
$Res call({
 Id<Segment> id
});




}
/// @nodoc
class _$ConfirmedSegmentRefCopyWithImpl<$Res>
    implements $ConfirmedSegmentRefCopyWith<$Res> {
  _$ConfirmedSegmentRefCopyWithImpl(this._self, this._then);

  final ConfirmedSegmentRef _self;
  final $Res Function(ConfirmedSegmentRef) _then;

/// Create a copy of SegmentRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(ConfirmedSegmentRef(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<Segment>,
  ));
}


}

/// @nodoc


class PendingSegmentRef implements SegmentRef {
  const PendingSegmentRef(this.id);
  

@override final  Id<Segment> id;

/// Create a copy of SegmentRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingSegmentRefCopyWith<PendingSegmentRef> get copyWith => _$PendingSegmentRefCopyWithImpl<PendingSegmentRef>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingSegmentRef&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'SegmentRef.pending(id: $id)';
}


}

/// @nodoc
abstract mixin class $PendingSegmentRefCopyWith<$Res> implements $SegmentRefCopyWith<$Res> {
  factory $PendingSegmentRefCopyWith(PendingSegmentRef value, $Res Function(PendingSegmentRef) _then) = _$PendingSegmentRefCopyWithImpl;
@override @useResult
$Res call({
 Id<Segment> id
});




}
/// @nodoc
class _$PendingSegmentRefCopyWithImpl<$Res>
    implements $PendingSegmentRefCopyWith<$Res> {
  _$PendingSegmentRefCopyWithImpl(this._self, this._then);

  final PendingSegmentRef _self;
  final $Res Function(PendingSegmentRef) _then;

/// Create a copy of SegmentRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(PendingSegmentRef(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<Segment>,
  ));
}


}

// dart format on
