// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph_node_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NodeValueOrPatch<T extends HasId> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NodeValueOrPatch<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NodeValueOrPatch<$T>()';
}


}

/// @nodoc
class $NodeValueOrPatchCopyWith<T extends HasId,$Res>  {
$NodeValueOrPatchCopyWith(NodeValueOrPatch<T> _, $Res Function(NodeValueOrPatch<T>) __);
}


/// Adds pattern-matching-related methods to [NodeValueOrPatch].
extension NodeValueOrPatchPatterns<T extends HasId> on NodeValueOrPatch<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ValueResult<T> value)?  value,TResult Function( _PatchResult<T> value)?  patch,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValueResult() when value != null:
return value(_that);case _PatchResult() when patch != null:
return patch(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ValueResult<T> value)  value,required TResult Function( _PatchResult<T> value)  patch,}){
final _that = this;
switch (_that) {
case _ValueResult():
return value(_that);case _PatchResult():
return patch(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ValueResult<T> value)?  value,TResult? Function( _PatchResult<T> value)?  patch,}){
final _that = this;
switch (_that) {
case _ValueResult() when value != null:
return value(_that);case _PatchResult() when patch != null:
return patch(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T value)?  value,TResult Function( Patch<T> patch)?  patch,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValueResult() when value != null:
return value(_that.value);case _PatchResult() when patch != null:
return patch(_that.patch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T value)  value,required TResult Function( Patch<T> patch)  patch,}) {final _that = this;
switch (_that) {
case _ValueResult():
return value(_that.value);case _PatchResult():
return patch(_that.patch);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T value)?  value,TResult? Function( Patch<T> patch)?  patch,}) {final _that = this;
switch (_that) {
case _ValueResult() when value != null:
return value(_that.value);case _PatchResult() when patch != null:
return patch(_that.patch);case _:
  return null;

}
}

}

/// @nodoc


class _ValueResult<T extends HasId> implements NodeValueOrPatch<T> {
  const _ValueResult(this.value);
  

 final  T value;

/// Create a copy of NodeValueOrPatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValueResultCopyWith<T, _ValueResult<T>> get copyWith => __$ValueResultCopyWithImpl<T, _ValueResult<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValueResult<T>&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'NodeValueOrPatch<$T>.value(value: $value)';
}


}

/// @nodoc
abstract mixin class _$ValueResultCopyWith<T extends HasId,$Res> implements $NodeValueOrPatchCopyWith<T, $Res> {
  factory _$ValueResultCopyWith(_ValueResult<T> value, $Res Function(_ValueResult<T>) _then) = __$ValueResultCopyWithImpl;
@useResult
$Res call({
 T value
});




}
/// @nodoc
class __$ValueResultCopyWithImpl<T extends HasId,$Res>
    implements _$ValueResultCopyWith<T, $Res> {
  __$ValueResultCopyWithImpl(this._self, this._then);

  final _ValueResult<T> _self;
  final $Res Function(_ValueResult<T>) _then;

/// Create a copy of NodeValueOrPatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_ValueResult<T>(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class _PatchResult<T extends HasId> implements NodeValueOrPatch<T> {
  const _PatchResult(this.patch);
  

 final  Patch<T> patch;

/// Create a copy of NodeValueOrPatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchResultCopyWith<T, _PatchResult<T>> get copyWith => __$PatchResultCopyWithImpl<T, _PatchResult<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchResult<T>&&(identical(other.patch, patch) || other.patch == patch));
}


@override
int get hashCode => Object.hash(runtimeType,patch);

@override
String toString() {
  return 'NodeValueOrPatch<$T>.patch(patch: $patch)';
}


}

/// @nodoc
abstract mixin class _$PatchResultCopyWith<T extends HasId,$Res> implements $NodeValueOrPatchCopyWith<T, $Res> {
  factory _$PatchResultCopyWith(_PatchResult<T> value, $Res Function(_PatchResult<T>) _then) = __$PatchResultCopyWithImpl;
@useResult
$Res call({
 Patch<T> patch
});




}
/// @nodoc
class __$PatchResultCopyWithImpl<T extends HasId,$Res>
    implements _$PatchResultCopyWith<T, $Res> {
  __$PatchResultCopyWithImpl(this._self, this._then);

  final _PatchResult<T> _self;
  final $Res Function(_PatchResult<T>) _then;

/// Create a copy of NodeValueOrPatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? patch = null,}) {
  return _then(_PatchResult<T>(
null == patch ? _self.patch : patch // ignore: cast_nullable_to_non_nullable
as Patch<T>,
  ));
}


}

/// @nodoc
mixin _$NodeState<T extends HasId> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NodeState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NodeState<$T>()';
}


}

/// @nodoc
class $NodeStateCopyWith<T extends HasId,$Res>  {
$NodeStateCopyWith(NodeState<T> _, $Res Function(NodeState<T>) __);
}


/// Adds pattern-matching-related methods to [NodeState].
extension NodeStatePatterns<T extends HasId> on NodeState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HasValue<T> value)?  hasValue,TResult Function( HasPatch<T> value)?  hasPatch,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HasValue() when hasValue != null:
return hasValue(_that);case HasPatch() when hasPatch != null:
return hasPatch(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HasValue<T> value)  hasValue,required TResult Function( HasPatch<T> value)  hasPatch,}){
final _that = this;
switch (_that) {
case HasValue():
return hasValue(_that);case HasPatch():
return hasPatch(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HasValue<T> value)?  hasValue,TResult? Function( HasPatch<T> value)?  hasPatch,}){
final _that = this;
switch (_that) {
case HasValue() when hasValue != null:
return hasValue(_that);case HasPatch() when hasPatch != null:
return hasPatch(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T value)?  hasValue,TResult Function( Patch<T> patch,  T? originalValue)?  hasPatch,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HasValue() when hasValue != null:
return hasValue(_that.value);case HasPatch() when hasPatch != null:
return hasPatch(_that.patch,_that.originalValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T value)  hasValue,required TResult Function( Patch<T> patch,  T? originalValue)  hasPatch,}) {final _that = this;
switch (_that) {
case HasValue():
return hasValue(_that.value);case HasPatch():
return hasPatch(_that.patch,_that.originalValue);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T value)?  hasValue,TResult? Function( Patch<T> patch,  T? originalValue)?  hasPatch,}) {final _that = this;
switch (_that) {
case HasValue() when hasValue != null:
return hasValue(_that.value);case HasPatch() when hasPatch != null:
return hasPatch(_that.patch,_that.originalValue);case _:
  return null;

}
}

}

/// @nodoc


class HasValue<T extends HasId> extends NodeState<T> {
  const HasValue(this.value): super._();
  

 final  T value;

/// Create a copy of NodeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HasValueCopyWith<T, HasValue<T>> get copyWith => _$HasValueCopyWithImpl<T, HasValue<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HasValue<T>&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'NodeState<$T>.hasValue(value: $value)';
}


}

/// @nodoc
abstract mixin class $HasValueCopyWith<T extends HasId,$Res> implements $NodeStateCopyWith<T, $Res> {
  factory $HasValueCopyWith(HasValue<T> value, $Res Function(HasValue<T>) _then) = _$HasValueCopyWithImpl;
@useResult
$Res call({
 T value
});




}
/// @nodoc
class _$HasValueCopyWithImpl<T extends HasId,$Res>
    implements $HasValueCopyWith<T, $Res> {
  _$HasValueCopyWithImpl(this._self, this._then);

  final HasValue<T> _self;
  final $Res Function(HasValue<T>) _then;

/// Create a copy of NodeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(HasValue<T>(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class HasPatch<T extends HasId> extends NodeState<T> {
  const HasPatch({required this.patch, this.originalValue}): super._();
  

 final  Patch<T> patch;
 final  T? originalValue;

/// Create a copy of NodeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HasPatchCopyWith<T, HasPatch<T>> get copyWith => _$HasPatchCopyWithImpl<T, HasPatch<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HasPatch<T>&&(identical(other.patch, patch) || other.patch == patch)&&const DeepCollectionEquality().equals(other.originalValue, originalValue));
}


@override
int get hashCode => Object.hash(runtimeType,patch,const DeepCollectionEquality().hash(originalValue));

@override
String toString() {
  return 'NodeState<$T>.hasPatch(patch: $patch, originalValue: $originalValue)';
}


}

/// @nodoc
abstract mixin class $HasPatchCopyWith<T extends HasId,$Res> implements $NodeStateCopyWith<T, $Res> {
  factory $HasPatchCopyWith(HasPatch<T> value, $Res Function(HasPatch<T>) _then) = _$HasPatchCopyWithImpl;
@useResult
$Res call({
 Patch<T> patch, T? originalValue
});




}
/// @nodoc
class _$HasPatchCopyWithImpl<T extends HasId,$Res>
    implements $HasPatchCopyWith<T, $Res> {
  _$HasPatchCopyWithImpl(this._self, this._then);

  final HasPatch<T> _self;
  final $Res Function(HasPatch<T>) _then;

/// Create a copy of NodeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? patch = null,Object? originalValue = freezed,}) {
  return _then(HasPatch<T>(
patch: null == patch ? _self.patch : patch // ignore: cast_nullable_to_non_nullable
as Patch<T>,originalValue: freezed == originalValue ? _self.originalValue : originalValue // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

// dart format on
