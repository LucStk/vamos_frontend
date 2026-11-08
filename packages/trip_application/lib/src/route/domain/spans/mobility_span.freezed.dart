// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mobility_span.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MobilitySpanRemoteModel {

 MobilitySpanId get id; int get startIndex; MobilityType get mobilityType; double? get lengthM;
/// Create a copy of MobilitySpanRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MobilitySpanRemoteModelCopyWith<MobilitySpanRemoteModel> get copyWith => _$MobilitySpanRemoteModelCopyWithImpl<MobilitySpanRemoteModel>(this as MobilitySpanRemoteModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MobilitySpanRemoteModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MobilitySpanRemoteModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startIndex, _this.startIndex) || other.startIndex == _this.startIndex)&&(identical(other.mobilityType, _this.mobilityType) || other.mobilityType == _this.mobilityType)&&(identical(other.lengthM, _this.lengthM) || other.lengthM == _this.lengthM));
}


@override
int get hashCode {
  final _this = this as MobilitySpanRemoteModel;
  return Object.hash(runtimeType,_this.id,_this.startIndex,_this.mobilityType,_this.lengthM);
}

@override
String toString() {
  final _this = this as MobilitySpanRemoteModel;
  return 'MobilitySpanRemoteModel(id: ${_this.id}, startIndex: ${_this.startIndex}, mobilityType: ${_this.mobilityType}, lengthM: ${_this.lengthM})';
}


}

/// @nodoc
abstract mixin class $MobilitySpanRemoteModelCopyWith<$Res>  {
  factory $MobilitySpanRemoteModelCopyWith(MobilitySpanRemoteModel value, $Res Function(MobilitySpanRemoteModel) _then) = _$MobilitySpanRemoteModelCopyWithImpl;
@useResult
$Res call({
 MobilitySpanId id, int startIndex, MobilityType mobilityType, double? lengthM
});




}
/// @nodoc
class _$MobilitySpanRemoteModelCopyWithImpl<$Res>
    implements $MobilitySpanRemoteModelCopyWith<$Res> {
  _$MobilitySpanRemoteModelCopyWithImpl(this._self, this._then);

  final MobilitySpanRemoteModel _self;
  final $Res Function(MobilitySpanRemoteModel) _then;

/// Create a copy of MobilitySpanRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startIndex = null,Object? mobilityType = null,Object? lengthM = freezed,}) {
  return _then(MobilitySpanRemoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as MobilitySpanId,startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,lengthM: freezed == lengthM ? _self.lengthM : lengthM // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [MobilitySpanRemoteModel].
extension MobilitySpanRemoteModelPatterns on MobilitySpanRemoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MobilitySpanRemoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MobilitySpanRemoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MobilitySpanRemoteModel value)  $default,){
final _that = this;
switch (_that) {
case _MobilitySpanRemoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MobilitySpanRemoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _MobilitySpanRemoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MobilitySpanId id,  int startIndex,  MobilityType mobilityType,  double? lengthM)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MobilitySpanRemoteModel() when $default != null:
return $default(_that.id,_that.startIndex,_that.mobilityType,_that.lengthM);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MobilitySpanId id,  int startIndex,  MobilityType mobilityType,  double? lengthM)  $default,) {final _that = this;
switch (_that) {
case _MobilitySpanRemoteModel():
return $default(_that.id,_that.startIndex,_that.mobilityType,_that.lengthM);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MobilitySpanId id,  int startIndex,  MobilityType mobilityType,  double? lengthM)?  $default,) {final _that = this;
switch (_that) {
case _MobilitySpanRemoteModel() when $default != null:
return $default(_that.id,_that.startIndex,_that.mobilityType,_that.lengthM);case _:
  return null;

}
}

}

/// @nodoc


class _MobilitySpanRemoteModel extends MobilitySpanRemoteModel {
  const _MobilitySpanRemoteModel({required this.id, required this.startIndex, required this.mobilityType, this.lengthM}): super._();
  

@override final  MobilitySpanId id;
@override final  int startIndex;
@override final  MobilityType mobilityType;
@override final  double? lengthM;

/// Create a copy of MobilitySpanRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MobilitySpanRemoteModelCopyWith<_MobilitySpanRemoteModel> get copyWith => __$MobilitySpanRemoteModelCopyWithImpl<_MobilitySpanRemoteModel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MobilitySpanRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.startIndex, startIndex) || other.startIndex == startIndex)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType)&&(identical(other.lengthM, lengthM) || other.lengthM == lengthM));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,startIndex,mobilityType,lengthM);
}

@override
String toString() {
    return 'MobilitySpanRemoteModel(id: $id, startIndex: $startIndex, mobilityType: $mobilityType, lengthM: $lengthM)';
}


}

/// @nodoc
abstract mixin class _$MobilitySpanRemoteModelCopyWith<$Res> implements $MobilitySpanRemoteModelCopyWith<$Res> {
  factory _$MobilitySpanRemoteModelCopyWith(_MobilitySpanRemoteModel value, $Res Function(_MobilitySpanRemoteModel) _then) = __$MobilitySpanRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 MobilitySpanId id, int startIndex, MobilityType mobilityType, double? lengthM
});




}
/// @nodoc
class __$MobilitySpanRemoteModelCopyWithImpl<$Res>
    implements _$MobilitySpanRemoteModelCopyWith<$Res> {
  __$MobilitySpanRemoteModelCopyWithImpl(this._self, this._then);

  final _MobilitySpanRemoteModel _self;
  final $Res Function(_MobilitySpanRemoteModel) _then;

/// Create a copy of MobilitySpanRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startIndex = null,Object? mobilityType = null,Object? lengthM = freezed,}) {
  return _then(_MobilitySpanRemoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as MobilitySpanId,startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,lengthM: freezed == lengthM ? _self.lengthM : lengthM // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$MobilitySpanPatchModel {

 MobilitySpanId get id; int get startIndex; MobilityType get mobilityType; double? get lengthM; bool get recomputing; Object? get error;
/// Create a copy of MobilitySpanPatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MobilitySpanPatchModelCopyWith<MobilitySpanPatchModel> get copyWith => _$MobilitySpanPatchModelCopyWithImpl<MobilitySpanPatchModel>(this as MobilitySpanPatchModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MobilitySpanPatchModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MobilitySpanPatchModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startIndex, _this.startIndex) || other.startIndex == _this.startIndex)&&(identical(other.mobilityType, _this.mobilityType) || other.mobilityType == _this.mobilityType)&&(identical(other.lengthM, _this.lengthM) || other.lengthM == _this.lengthM)&&(identical(other.recomputing, _this.recomputing) || other.recomputing == _this.recomputing)&&const DeepCollectionEquality().equals(other.error, _this.error));
}


@override
int get hashCode {
  final _this = this as MobilitySpanPatchModel;
  return Object.hash(runtimeType,_this.id,_this.startIndex,_this.mobilityType,_this.lengthM,_this.recomputing,const DeepCollectionEquality().hash(_this.error));
}

@override
String toString() {
  final _this = this as MobilitySpanPatchModel;
  return 'MobilitySpanPatchModel(id: ${_this.id}, startIndex: ${_this.startIndex}, mobilityType: ${_this.mobilityType}, lengthM: ${_this.lengthM}, recomputing: ${_this.recomputing}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $MobilitySpanPatchModelCopyWith<$Res>  {
  factory $MobilitySpanPatchModelCopyWith(MobilitySpanPatchModel value, $Res Function(MobilitySpanPatchModel) _then) = _$MobilitySpanPatchModelCopyWithImpl;
@useResult
$Res call({
 MobilitySpanId id, int startIndex, MobilityType mobilityType, double? lengthM, bool recomputing, Object? error
});




}
/// @nodoc
class _$MobilitySpanPatchModelCopyWithImpl<$Res>
    implements $MobilitySpanPatchModelCopyWith<$Res> {
  _$MobilitySpanPatchModelCopyWithImpl(this._self, this._then);

  final MobilitySpanPatchModel _self;
  final $Res Function(MobilitySpanPatchModel) _then;

/// Create a copy of MobilitySpanPatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startIndex = null,Object? mobilityType = null,Object? lengthM = freezed,Object? recomputing = null,Object? error = freezed,}) {
  return _then(MobilitySpanPatchModel(
id: freezed == id ? _self.id! : id // ignore: cast_nullable_to_non_nullable
as MobilitySpanId?,startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,lengthM: freezed == lengthM ? _self.lengthM : lengthM // ignore: cast_nullable_to_non_nullable
as double?,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [MobilitySpanPatchModel].
extension MobilitySpanPatchModelPatterns on MobilitySpanPatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _MobilitySpanPatchModel value)?  internal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MobilitySpanPatchModel() when internal != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _MobilitySpanPatchModel value)  internal,}){
final _that = this;
switch (_that) {
case _MobilitySpanPatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _MobilitySpanPatchModel value)?  internal,}){
final _that = this;
switch (_that) {
case _MobilitySpanPatchModel() when internal != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( MobilitySpanId id,  int startIndex,  MobilityType mobilityType,  double? lengthM,  bool recomputing,  Object? error)?  internal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MobilitySpanPatchModel() when internal != null:
return internal(_that.id,_that.startIndex,_that.mobilityType,_that.lengthM,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( MobilitySpanId id,  int startIndex,  MobilityType mobilityType,  double? lengthM,  bool recomputing,  Object? error)  internal,}) {final _that = this;
switch (_that) {
case _MobilitySpanPatchModel():
return internal(_that.id,_that.startIndex,_that.mobilityType,_that.lengthM,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( MobilitySpanId id,  int startIndex,  MobilityType mobilityType,  double? lengthM,  bool recomputing,  Object? error)?  internal,}) {final _that = this;
switch (_that) {
case _MobilitySpanPatchModel() when internal != null:
return internal(_that.id,_that.startIndex,_that.mobilityType,_that.lengthM,_that.recomputing,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MobilitySpanPatchModel extends MobilitySpanPatchModel implements Patch<MobilitySpanRemoteModel> {
  const _MobilitySpanPatchModel({required this.id, required this.startIndex, required this.mobilityType, this.lengthM, this.recomputing = false, this.error}): super._();
  

@override final  MobilitySpanId id;
@override final  int startIndex;
@override final  MobilityType mobilityType;
@override final  double? lengthM;
@override@JsonKey() final  bool recomputing;
@override final  Object? error;

/// Create a copy of MobilitySpanPatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MobilitySpanPatchModelCopyWith<_MobilitySpanPatchModel> get copyWith => __$MobilitySpanPatchModelCopyWithImpl<_MobilitySpanPatchModel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MobilitySpanPatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.startIndex, startIndex) || other.startIndex == startIndex)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType)&&(identical(other.lengthM, lengthM) || other.lengthM == lengthM)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,startIndex,mobilityType,lengthM,recomputing,const DeepCollectionEquality().hash(error));
}

@override
String toString() {
    return 'MobilitySpanPatchModel.internal(id: $id, startIndex: $startIndex, mobilityType: $mobilityType, lengthM: $lengthM, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MobilitySpanPatchModelCopyWith<$Res> implements $MobilitySpanPatchModelCopyWith<$Res> {
  factory _$MobilitySpanPatchModelCopyWith(_MobilitySpanPatchModel value, $Res Function(_MobilitySpanPatchModel) _then) = __$MobilitySpanPatchModelCopyWithImpl;
@override @useResult
$Res call({
 MobilitySpanId id, int startIndex, MobilityType mobilityType, double? lengthM, bool recomputing, Object? error
});




}
/// @nodoc
class __$MobilitySpanPatchModelCopyWithImpl<$Res>
    implements _$MobilitySpanPatchModelCopyWith<$Res> {
  __$MobilitySpanPatchModelCopyWithImpl(this._self, this._then);

  final _MobilitySpanPatchModel _self;
  final $Res Function(_MobilitySpanPatchModel) _then;

/// Create a copy of MobilitySpanPatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startIndex = null,Object? mobilityType = null,Object? lengthM = freezed,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_MobilitySpanPatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as MobilitySpanId,startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,lengthM: freezed == lengthM ? _self.lengthM : lengthM // ignore: cast_nullable_to_non_nullable
as double?,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
