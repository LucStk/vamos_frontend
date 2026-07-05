// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vertex_ref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VertexRef {

 Id<HasId> get id;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VertexRef&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'VertexRef(id: $id)';
}


}

/// @nodoc
class $VertexRefCopyWith<$Res>  {
$VertexRefCopyWith(VertexRef _, $Res Function(VertexRef) __);
}


/// Adds pattern-matching-related methods to [VertexRef].
extension VertexRefPatterns on VertexRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConfirmedVertexRef value)?  confirmed,TResult Function( PendingVertexRef value)?  pending,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConfirmedVertexRef() when confirmed != null:
return confirmed(_that);case PendingVertexRef() when pending != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConfirmedVertexRef value)  confirmed,required TResult Function( PendingVertexRef value)  pending,}){
final _that = this;
switch (_that) {
case ConfirmedVertexRef():
return confirmed(_that);case PendingVertexRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConfirmedVertexRef value)?  confirmed,TResult? Function( PendingVertexRef value)?  pending,}){
final _that = this;
switch (_that) {
case ConfirmedVertexRef() when confirmed != null:
return confirmed(_that);case PendingVertexRef() when pending != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Id<Vertex> id)?  confirmed,TResult Function( Id<VertexPatch> id)?  pending,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConfirmedVertexRef() when confirmed != null:
return confirmed(_that.id);case PendingVertexRef() when pending != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Id<Vertex> id)  confirmed,required TResult Function( Id<VertexPatch> id)  pending,}) {final _that = this;
switch (_that) {
case ConfirmedVertexRef():
return confirmed(_that.id);case PendingVertexRef():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Id<Vertex> id)?  confirmed,TResult? Function( Id<VertexPatch> id)?  pending,}) {final _that = this;
switch (_that) {
case ConfirmedVertexRef() when confirmed != null:
return confirmed(_that.id);case PendingVertexRef() when pending != null:
return pending(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class ConfirmedVertexRef implements VertexRef {
  const ConfirmedVertexRef(this.id);
  

@override final  Id<Vertex> id;

/// Create a copy of VertexRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmedVertexRefCopyWith<ConfirmedVertexRef> get copyWith => _$ConfirmedVertexRefCopyWithImpl<ConfirmedVertexRef>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmedVertexRef&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'VertexRef.confirmed(id: $id)';
}


}

/// @nodoc
abstract mixin class $ConfirmedVertexRefCopyWith<$Res> implements $VertexRefCopyWith<$Res> {
  factory $ConfirmedVertexRefCopyWith(ConfirmedVertexRef value, $Res Function(ConfirmedVertexRef) _then) = _$ConfirmedVertexRefCopyWithImpl;
@useResult
$Res call({
 Id<Vertex> id
});




}
/// @nodoc
class _$ConfirmedVertexRefCopyWithImpl<$Res>
    implements $ConfirmedVertexRefCopyWith<$Res> {
  _$ConfirmedVertexRefCopyWithImpl(this._self, this._then);

  final ConfirmedVertexRef _self;
  final $Res Function(ConfirmedVertexRef) _then;

/// Create a copy of VertexRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(ConfirmedVertexRef(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<Vertex>,
  ));
}


}

/// @nodoc


class PendingVertexRef implements VertexRef {
  const PendingVertexRef(this.id);
  

@override final  Id<VertexPatch> id;

/// Create a copy of VertexRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingVertexRefCopyWith<PendingVertexRef> get copyWith => _$PendingVertexRefCopyWithImpl<PendingVertexRef>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingVertexRef&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'VertexRef.pending(id: $id)';
}


}

/// @nodoc
abstract mixin class $PendingVertexRefCopyWith<$Res> implements $VertexRefCopyWith<$Res> {
  factory $PendingVertexRefCopyWith(PendingVertexRef value, $Res Function(PendingVertexRef) _then) = _$PendingVertexRefCopyWithImpl;
@useResult
$Res call({
 Id<VertexPatch> id
});




}
/// @nodoc
class _$PendingVertexRefCopyWithImpl<$Res>
    implements $PendingVertexRefCopyWith<$Res> {
  _$PendingVertexRefCopyWithImpl(this._self, this._then);

  final PendingVertexRef _self;
  final $Res Function(PendingVertexRef) _then;

/// Create a copy of VertexRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(PendingVertexRef(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id<VertexPatch>,
  ));
}


}

// dart format on
