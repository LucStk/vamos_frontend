// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RouteSectionRemoteModel {

 SectionId get id; int get startIndex; MobilityType get mobilityType;
/// Create a copy of RouteSectionRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteSectionRemoteModelCopyWith<RouteSectionRemoteModel> get copyWith => _$RouteSectionRemoteModelCopyWithImpl<RouteSectionRemoteModel>(this as RouteSectionRemoteModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RouteSectionRemoteModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteSectionRemoteModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startIndex, _this.startIndex) || other.startIndex == _this.startIndex)&&(identical(other.mobilityType, _this.mobilityType) || other.mobilityType == _this.mobilityType));
}


@override
int get hashCode {
  final _this = this as RouteSectionRemoteModel;
  return Object.hash(runtimeType,_this.id,_this.startIndex,_this.mobilityType);
}

@override
String toString() {
  final _this = this as RouteSectionRemoteModel;
  return 'RouteSectionRemoteModel(id: ${_this.id}, startIndex: ${_this.startIndex}, mobilityType: ${_this.mobilityType})';
}


}

/// @nodoc
abstract mixin class $RouteSectionRemoteModelCopyWith<$Res>  {
  factory $RouteSectionRemoteModelCopyWith(RouteSectionRemoteModel value, $Res Function(RouteSectionRemoteModel) _then) = _$RouteSectionRemoteModelCopyWithImpl;
@useResult
$Res call({
 SectionId id, int startIndex, MobilityType mobilityType
});




}
/// @nodoc
class _$RouteSectionRemoteModelCopyWithImpl<$Res>
    implements $RouteSectionRemoteModelCopyWith<$Res> {
  _$RouteSectionRemoteModelCopyWithImpl(this._self, this._then);

  final RouteSectionRemoteModel _self;
  final $Res Function(RouteSectionRemoteModel) _then;

/// Create a copy of RouteSectionRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startIndex = null,Object? mobilityType = null,}) {
  return _then(RouteSectionRemoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SectionId,startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteSectionRemoteModel].
extension RouteSectionRemoteModelPatterns on RouteSectionRemoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteSectionRemoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteSectionRemoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteSectionRemoteModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteSectionRemoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteSectionRemoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteSectionRemoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionId id,  int startIndex,  MobilityType mobilityType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteSectionRemoteModel() when $default != null:
return $default(_that.id,_that.startIndex,_that.mobilityType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionId id,  int startIndex,  MobilityType mobilityType)  $default,) {final _that = this;
switch (_that) {
case _RouteSectionRemoteModel():
return $default(_that.id,_that.startIndex,_that.mobilityType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionId id,  int startIndex,  MobilityType mobilityType)?  $default,) {final _that = this;
switch (_that) {
case _RouteSectionRemoteModel() when $default != null:
return $default(_that.id,_that.startIndex,_that.mobilityType);case _:
  return null;

}
}

}

/// @nodoc


class _RouteSectionRemoteModel extends RouteSectionRemoteModel {
  const _RouteSectionRemoteModel({required this.id, required this.startIndex, this.mobilityType = MobilityType.bike}): super._();
  

@override final  SectionId id;
@override final  int startIndex;
@override@JsonKey() final  MobilityType mobilityType;

/// Create a copy of RouteSectionRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteSectionRemoteModelCopyWith<_RouteSectionRemoteModel> get copyWith => __$RouteSectionRemoteModelCopyWithImpl<_RouteSectionRemoteModel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteSectionRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.startIndex, startIndex) || other.startIndex == startIndex)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,startIndex,mobilityType);
}

@override
String toString() {
    return 'RouteSectionRemoteModel(id: $id, startIndex: $startIndex, mobilityType: $mobilityType)';
}


}

/// @nodoc
abstract mixin class _$RouteSectionRemoteModelCopyWith<$Res> implements $RouteSectionRemoteModelCopyWith<$Res> {
  factory _$RouteSectionRemoteModelCopyWith(_RouteSectionRemoteModel value, $Res Function(_RouteSectionRemoteModel) _then) = __$RouteSectionRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 SectionId id, int startIndex, MobilityType mobilityType
});




}
/// @nodoc
class __$RouteSectionRemoteModelCopyWithImpl<$Res>
    implements _$RouteSectionRemoteModelCopyWith<$Res> {
  __$RouteSectionRemoteModelCopyWithImpl(this._self, this._then);

  final _RouteSectionRemoteModel _self;
  final $Res Function(_RouteSectionRemoteModel) _then;

/// Create a copy of RouteSectionRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startIndex = null,Object? mobilityType = null,}) {
  return _then(_RouteSectionRemoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SectionId,startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,
  ));
}


}

/// @nodoc
mixin _$RouteSectionPatchModel {

 SectionId get id; int get startIndex; MobilityType get mobilityType; bool get recomputing; Object? get error;
/// Create a copy of RouteSectionPatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteSectionPatchModelCopyWith<RouteSectionPatchModel> get copyWith => _$RouteSectionPatchModelCopyWithImpl<RouteSectionPatchModel>(this as RouteSectionPatchModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RouteSectionPatchModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteSectionPatchModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startIndex, _this.startIndex) || other.startIndex == _this.startIndex)&&(identical(other.mobilityType, _this.mobilityType) || other.mobilityType == _this.mobilityType)&&(identical(other.recomputing, _this.recomputing) || other.recomputing == _this.recomputing)&&const DeepCollectionEquality().equals(other.error, _this.error));
}


@override
int get hashCode {
  final _this = this as RouteSectionPatchModel;
  return Object.hash(runtimeType,_this.id,_this.startIndex,_this.mobilityType,_this.recomputing,const DeepCollectionEquality().hash(_this.error));
}

@override
String toString() {
  final _this = this as RouteSectionPatchModel;
  return 'RouteSectionPatchModel(id: ${_this.id}, startIndex: ${_this.startIndex}, mobilityType: ${_this.mobilityType}, recomputing: ${_this.recomputing}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $RouteSectionPatchModelCopyWith<$Res>  {
  factory $RouteSectionPatchModelCopyWith(RouteSectionPatchModel value, $Res Function(RouteSectionPatchModel) _then) = _$RouteSectionPatchModelCopyWithImpl;
@useResult
$Res call({
 SectionId id, int startIndex, MobilityType mobilityType, bool recomputing, Object? error
});




}
/// @nodoc
class _$RouteSectionPatchModelCopyWithImpl<$Res>
    implements $RouteSectionPatchModelCopyWith<$Res> {
  _$RouteSectionPatchModelCopyWithImpl(this._self, this._then);

  final RouteSectionPatchModel _self;
  final $Res Function(RouteSectionPatchModel) _then;

/// Create a copy of RouteSectionPatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startIndex = null,Object? mobilityType = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(RouteSectionPatchModel(
id: freezed == id ? _self.id! : id // ignore: cast_nullable_to_non_nullable
as SectionId?,startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteSectionPatchModel].
extension RouteSectionPatchModelPatterns on RouteSectionPatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RouteSectionPatchModel value)?  internal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteSectionPatchModel() when internal != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RouteSectionPatchModel value)  internal,}){
final _that = this;
switch (_that) {
case _RouteSectionPatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RouteSectionPatchModel value)?  internal,}){
final _that = this;
switch (_that) {
case _RouteSectionPatchModel() when internal != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SectionId id,  int startIndex,  MobilityType mobilityType,  bool recomputing,  Object? error)?  internal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteSectionPatchModel() when internal != null:
return internal(_that.id,_that.startIndex,_that.mobilityType,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SectionId id,  int startIndex,  MobilityType mobilityType,  bool recomputing,  Object? error)  internal,}) {final _that = this;
switch (_that) {
case _RouteSectionPatchModel():
return internal(_that.id,_that.startIndex,_that.mobilityType,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SectionId id,  int startIndex,  MobilityType mobilityType,  bool recomputing,  Object? error)?  internal,}) {final _that = this;
switch (_that) {
case _RouteSectionPatchModel() when internal != null:
return internal(_that.id,_that.startIndex,_that.mobilityType,_that.recomputing,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _RouteSectionPatchModel extends RouteSectionPatchModel implements Patch<RouteSectionRemoteModel> {
  const _RouteSectionPatchModel({required this.id, required this.startIndex, this.mobilityType = MobilityType.bike, this.recomputing = false, this.error}): super._();
  

@override final  SectionId id;
@override final  int startIndex;
@override@JsonKey() final  MobilityType mobilityType;
@override@JsonKey() final  bool recomputing;
@override final  Object? error;

/// Create a copy of RouteSectionPatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteSectionPatchModelCopyWith<_RouteSectionPatchModel> get copyWith => __$RouteSectionPatchModelCopyWithImpl<_RouteSectionPatchModel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteSectionPatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.startIndex, startIndex) || other.startIndex == startIndex)&&(identical(other.mobilityType, mobilityType) || other.mobilityType == mobilityType)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,startIndex,mobilityType,recomputing,const DeepCollectionEquality().hash(error));
}

@override
String toString() {
    return 'RouteSectionPatchModel.internal(id: $id, startIndex: $startIndex, mobilityType: $mobilityType, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class _$RouteSectionPatchModelCopyWith<$Res> implements $RouteSectionPatchModelCopyWith<$Res> {
  factory _$RouteSectionPatchModelCopyWith(_RouteSectionPatchModel value, $Res Function(_RouteSectionPatchModel) _then) = __$RouteSectionPatchModelCopyWithImpl;
@override @useResult
$Res call({
 SectionId id, int startIndex, MobilityType mobilityType, bool recomputing, Object? error
});




}
/// @nodoc
class __$RouteSectionPatchModelCopyWithImpl<$Res>
    implements _$RouteSectionPatchModelCopyWith<$Res> {
  __$RouteSectionPatchModelCopyWithImpl(this._self, this._then);

  final _RouteSectionPatchModel _self;
  final $Res Function(_RouteSectionPatchModel) _then;

/// Create a copy of RouteSectionPatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startIndex = null,Object? mobilityType = null,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_RouteSectionPatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SectionId,startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,mobilityType: null == mobilityType ? _self.mobilityType : mobilityType // ignore: cast_nullable_to_non_nullable
as MobilityType,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
