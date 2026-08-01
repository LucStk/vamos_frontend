// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vertex_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VertexRemoteModel {

 VertexId get id; LatLng get latLng;
/// Create a copy of VertexRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VertexRemoteModelCopyWith<VertexRemoteModel> get copyWith => _$VertexRemoteModelCopyWithImpl<VertexRemoteModel>(this as VertexRemoteModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VertexRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.latLng, latLng) || other.latLng == latLng));
}


@override
int get hashCode => Object.hash(runtimeType,id,latLng);

@override
String toString() {
  return 'VertexRemoteModel(id: $id, latLng: $latLng)';
}


}

/// @nodoc
abstract mixin class $VertexRemoteModelCopyWith<$Res>  {
  factory $VertexRemoteModelCopyWith(VertexRemoteModel value, $Res Function(VertexRemoteModel) _then) = _$VertexRemoteModelCopyWithImpl;
@useResult
$Res call({
 VertexId id, LatLng latLng
});




}
/// @nodoc
class _$VertexRemoteModelCopyWithImpl<$Res>
    implements $VertexRemoteModelCopyWith<$Res> {
  _$VertexRemoteModelCopyWithImpl(this._self, this._then);

  final VertexRemoteModel _self;
  final $Res Function(VertexRemoteModel) _then;

/// Create a copy of VertexRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? latLng = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as VertexId,latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}

}


/// Adds pattern-matching-related methods to [VertexRemoteModel].
extension VertexRemoteModelPatterns on VertexRemoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VertexRemoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VertexRemoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VertexRemoteModel value)  $default,){
final _that = this;
switch (_that) {
case _VertexRemoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VertexRemoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _VertexRemoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VertexId id,  LatLng latLng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VertexRemoteModel() when $default != null:
return $default(_that.id,_that.latLng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VertexId id,  LatLng latLng)  $default,) {final _that = this;
switch (_that) {
case _VertexRemoteModel():
return $default(_that.id,_that.latLng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VertexId id,  LatLng latLng)?  $default,) {final _that = this;
switch (_that) {
case _VertexRemoteModel() when $default != null:
return $default(_that.id,_that.latLng);case _:
  return null;

}
}

}

/// @nodoc


class _VertexRemoteModel extends VertexRemoteModel {
  const _VertexRemoteModel({required this.id, required this.latLng}): super._();
  

@override final  VertexId id;
@override final  LatLng latLng;

/// Create a copy of VertexRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VertexRemoteModelCopyWith<_VertexRemoteModel> get copyWith => __$VertexRemoteModelCopyWithImpl<_VertexRemoteModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VertexRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.latLng, latLng) || other.latLng == latLng));
}


@override
int get hashCode => Object.hash(runtimeType,id,latLng);

@override
String toString() {
  return 'VertexRemoteModel(id: $id, latLng: $latLng)';
}


}

/// @nodoc
abstract mixin class _$VertexRemoteModelCopyWith<$Res> implements $VertexRemoteModelCopyWith<$Res> {
  factory _$VertexRemoteModelCopyWith(_VertexRemoteModel value, $Res Function(_VertexRemoteModel) _then) = __$VertexRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 VertexId id, LatLng latLng
});




}
/// @nodoc
class __$VertexRemoteModelCopyWithImpl<$Res>
    implements _$VertexRemoteModelCopyWith<$Res> {
  __$VertexRemoteModelCopyWithImpl(this._self, this._then);

  final _VertexRemoteModel _self;
  final $Res Function(_VertexRemoteModel) _then;

/// Create a copy of VertexRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? latLng = null,}) {
  return _then(_VertexRemoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as VertexId,latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

/// @nodoc
mixin _$VertexPatchModel {

 VertexId get id; LatLng get latLng; bool get recomputing; Object? get error;
/// Create a copy of VertexPatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VertexPatchModelCopyWith<VertexPatchModel> get copyWith => _$VertexPatchModelCopyWithImpl<VertexPatchModel>(this as VertexPatchModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VertexPatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,id,latLng,recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'VertexPatchModel(id: $id, latLng: $latLng, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class $VertexPatchModelCopyWith<$Res>  {
  factory $VertexPatchModelCopyWith(VertexPatchModel value, $Res Function(VertexPatchModel) _then) = _$VertexPatchModelCopyWithImpl;
@useResult
$Res call({
 VertexId id, LatLng latLng, bool recomputing, Object? error
});




}
/// @nodoc
class _$VertexPatchModelCopyWithImpl<$Res>
    implements $VertexPatchModelCopyWith<$Res> {
  _$VertexPatchModelCopyWithImpl(this._self, this._then);

  final VertexPatchModel _self;
  final $Res Function(VertexPatchModel) _then;

/// Create a copy of VertexPatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? latLng = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as VertexId,latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [VertexPatchModel].
extension VertexPatchModelPatterns on VertexPatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _VertexPatchModel value)?  internal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VertexPatchModel() when internal != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _VertexPatchModel value)  internal,}){
final _that = this;
switch (_that) {
case _VertexPatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _VertexPatchModel value)?  internal,}){
final _that = this;
switch (_that) {
case _VertexPatchModel() when internal != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( VertexId id,  LatLng latLng,  bool recomputing,  Object? error)?  internal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VertexPatchModel() when internal != null:
return internal(_that.id,_that.latLng,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( VertexId id,  LatLng latLng,  bool recomputing,  Object? error)  internal,}) {final _that = this;
switch (_that) {
case _VertexPatchModel():
return internal(_that.id,_that.latLng,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( VertexId id,  LatLng latLng,  bool recomputing,  Object? error)?  internal,}) {final _that = this;
switch (_that) {
case _VertexPatchModel() when internal != null:
return internal(_that.id,_that.latLng,_that.recomputing,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _VertexPatchModel extends VertexPatchModel implements Patch<VertexRemoteModel> {
  const _VertexPatchModel({required this.id, required this.latLng, required this.recomputing, this.error}): super._();
  

@override final  VertexId id;
@override final  LatLng latLng;
@override final  bool recomputing;
@override final  Object? error;

/// Create a copy of VertexPatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VertexPatchModelCopyWith<_VertexPatchModel> get copyWith => __$VertexPatchModelCopyWithImpl<_VertexPatchModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VertexPatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,id,latLng,recomputing,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'VertexPatchModel.internal(id: $id, latLng: $latLng, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class _$VertexPatchModelCopyWith<$Res> implements $VertexPatchModelCopyWith<$Res> {
  factory _$VertexPatchModelCopyWith(_VertexPatchModel value, $Res Function(_VertexPatchModel) _then) = __$VertexPatchModelCopyWithImpl;
@override @useResult
$Res call({
 VertexId id, LatLng latLng, bool recomputing, Object? error
});




}
/// @nodoc
class __$VertexPatchModelCopyWithImpl<$Res>
    implements _$VertexPatchModelCopyWith<$Res> {
  __$VertexPatchModelCopyWithImpl(this._self, this._then);

  final _VertexPatchModel _self;
  final $Res Function(_VertexPatchModel) _then;

/// Create a copy of VertexPatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? latLng = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_VertexPatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as VertexId,latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
