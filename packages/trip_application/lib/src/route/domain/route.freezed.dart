// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RouteRemoteModel {

 TripId get id; Geometry get geometry; MapLatLngBounds? get bounds;
/// Create a copy of RouteRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteRemoteModelCopyWith<RouteRemoteModel> get copyWith => _$RouteRemoteModelCopyWithImpl<RouteRemoteModel>(this as RouteRemoteModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RouteRemoteModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteRemoteModel&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.geometry, _this.geometry)&&(identical(other.bounds, _this.bounds) || other.bounds == _this.bounds));
}


@override
int get hashCode {
  final _this = this as RouteRemoteModel;
  return Object.hash(runtimeType,_this.id,const DeepCollectionEquality().hash(_this.geometry),_this.bounds);
}

@override
String toString() {
  final _this = this as RouteRemoteModel;
  return 'RouteRemoteModel(id: ${_this.id}, geometry: ${_this.geometry}, bounds: ${_this.bounds})';
}


}

/// @nodoc
abstract mixin class $RouteRemoteModelCopyWith<$Res>  {
  factory $RouteRemoteModelCopyWith(RouteRemoteModel value, $Res Function(RouteRemoteModel) _then) = _$RouteRemoteModelCopyWithImpl;
@useResult
$Res call({
 TripId id, Geometry geometry, MapLatLngBounds? bounds
});




}
/// @nodoc
class _$RouteRemoteModelCopyWithImpl<$Res>
    implements $RouteRemoteModelCopyWith<$Res> {
  _$RouteRemoteModelCopyWithImpl(this._self, this._then);

  final RouteRemoteModel _self;
  final $Res Function(RouteRemoteModel) _then;

/// Create a copy of RouteRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? geometry = null,Object? bounds = freezed,}) {
  return _then(RouteRemoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as TripId,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as Geometry,bounds: freezed == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as MapLatLngBounds?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteRemoteModel].
extension RouteRemoteModelPatterns on RouteRemoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteRemoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteRemoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteRemoteModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteRemoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteRemoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteRemoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TripId id,  Geometry geometry,  MapLatLngBounds? bounds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteRemoteModel() when $default != null:
return $default(_that.id,_that.geometry,_that.bounds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TripId id,  Geometry geometry,  MapLatLngBounds? bounds)  $default,) {final _that = this;
switch (_that) {
case _RouteRemoteModel():
return $default(_that.id,_that.geometry,_that.bounds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TripId id,  Geometry geometry,  MapLatLngBounds? bounds)?  $default,) {final _that = this;
switch (_that) {
case _RouteRemoteModel() when $default != null:
return $default(_that.id,_that.geometry,_that.bounds);case _:
  return null;

}
}

}

/// @nodoc


class _RouteRemoteModel extends RouteRemoteModel {
  const _RouteRemoteModel({required this.id, required  Geometry geometry, this.bounds}): _geometry = geometry,super._();
  

@override final  TripId id;
 final  Geometry _geometry;
@override Geometry get geometry {
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometry);
}

@override final  MapLatLngBounds? bounds;

/// Create a copy of RouteRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteRemoteModelCopyWith<_RouteRemoteModel> get copyWith => __$RouteRemoteModelCopyWithImpl<_RouteRemoteModel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteRemoteModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.geometry, _geometry)&&(identical(other.bounds, bounds) || other.bounds == bounds));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_geometry),bounds);
}

@override
String toString() {
    return 'RouteRemoteModel(id: $id, geometry: $geometry, bounds: $bounds)';
}


}

/// @nodoc
abstract mixin class _$RouteRemoteModelCopyWith<$Res> implements $RouteRemoteModelCopyWith<$Res> {
  factory _$RouteRemoteModelCopyWith(_RouteRemoteModel value, $Res Function(_RouteRemoteModel) _then) = __$RouteRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 TripId id, Geometry geometry, MapLatLngBounds? bounds
});




}
/// @nodoc
class __$RouteRemoteModelCopyWithImpl<$Res>
    implements _$RouteRemoteModelCopyWith<$Res> {
  __$RouteRemoteModelCopyWithImpl(this._self, this._then);

  final _RouteRemoteModel _self;
  final $Res Function(_RouteRemoteModel) _then;

/// Create a copy of RouteRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? geometry = null,Object? bounds = freezed,}) {
  return _then(_RouteRemoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as TripId,geometry: null == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as Geometry,bounds: freezed == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as MapLatLngBounds?,
  ));
}


}

/// @nodoc
mixin _$RoutePatchModel {

 Geometry get geometry; TripId get id; MapLatLngBounds? get bounds; bool get recomputing; Object? get error;
/// Create a copy of RoutePatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoutePatchModelCopyWith<RoutePatchModel> get copyWith => _$RoutePatchModelCopyWithImpl<RoutePatchModel>(this as RoutePatchModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RoutePatchModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoutePatchModel&&const DeepCollectionEquality().equals(other.geometry, _this.geometry)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.bounds, _this.bounds) || other.bounds == _this.bounds)&&(identical(other.recomputing, _this.recomputing) || other.recomputing == _this.recomputing)&&const DeepCollectionEquality().equals(other.error, _this.error));
}


@override
int get hashCode {
  final _this = this as RoutePatchModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.geometry),_this.id,_this.bounds,_this.recomputing,const DeepCollectionEquality().hash(_this.error));
}

@override
String toString() {
  final _this = this as RoutePatchModel;
  return 'RoutePatchModel(geometry: ${_this.geometry}, id: ${_this.id}, bounds: ${_this.bounds}, recomputing: ${_this.recomputing}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $RoutePatchModelCopyWith<$Res>  {
  factory $RoutePatchModelCopyWith(RoutePatchModel value, $Res Function(RoutePatchModel) _then) = _$RoutePatchModelCopyWithImpl;
@useResult
$Res call({
 Geometry geometry, TripId id, MapLatLngBounds? bounds, bool recomputing, Object? error
});




}
/// @nodoc
class _$RoutePatchModelCopyWithImpl<$Res>
    implements $RoutePatchModelCopyWith<$Res> {
  _$RoutePatchModelCopyWithImpl(this._self, this._then);

  final RoutePatchModel _self;
  final $Res Function(RoutePatchModel) _then;

/// Create a copy of RoutePatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? geometry = null,Object? id = null,Object? bounds = freezed,Object? recomputing = null,Object? error = freezed,}) {
  return _then(RoutePatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as TripId,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as Geometry,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [RoutePatchModel].
extension RoutePatchModelPatterns on RoutePatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RoutePatchModel value)?  internal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoutePatchModel() when internal != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RoutePatchModel value)  internal,}){
final _that = this;
switch (_that) {
case _RoutePatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RoutePatchModel value)?  internal,}){
final _that = this;
switch (_that) {
case _RoutePatchModel() when internal != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Geometry geometry,  TripId id,  MapLatLngBounds? bounds,  bool recomputing,  Object? error)?  internal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoutePatchModel() when internal != null:
return internal(_that.geometry,_that.id,_that.bounds,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Geometry geometry,  TripId id,  MapLatLngBounds? bounds,  bool recomputing,  Object? error)  internal,}) {final _that = this;
switch (_that) {
case _RoutePatchModel():
return internal(_that.geometry,_that.id,_that.bounds,_that.recomputing,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Geometry geometry,  TripId id,  MapLatLngBounds? bounds,  bool recomputing,  Object? error)?  internal,}) {final _that = this;
switch (_that) {
case _RoutePatchModel() when internal != null:
return internal(_that.geometry,_that.id,_that.bounds,_that.recomputing,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _RoutePatchModel extends RoutePatchModel implements Patch<RouteRemoteModel> {
  const _RoutePatchModel({required  Geometry geometry, required this.id, this.bounds, this.recomputing = false, this.error}): _geometry = geometry,super._();
  

 final  Geometry _geometry;
@override Geometry get geometry {
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometry);
}

@override final  TripId id;
@override final  MapLatLngBounds? bounds;
@override@JsonKey() final  bool recomputing;
@override final  Object? error;

/// Create a copy of RoutePatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoutePatchModelCopyWith<_RoutePatchModel> get copyWith => __$RoutePatchModelCopyWithImpl<_RoutePatchModel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoutePatchModel&&const DeepCollectionEquality().equals(other.geometry, _geometry)&&(identical(other.id, id) || other.id == id)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.recomputing, recomputing) || other.recomputing == recomputing)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_geometry),id,bounds,recomputing,const DeepCollectionEquality().hash(error));
}

@override
String toString() {
    return 'RoutePatchModel.internal(geometry: $geometry, id: $id, bounds: $bounds, recomputing: $recomputing, error: $error)';
}


}

/// @nodoc
abstract mixin class _$RoutePatchModelCopyWith<$Res> implements $RoutePatchModelCopyWith<$Res> {
  factory _$RoutePatchModelCopyWith(_RoutePatchModel value, $Res Function(_RoutePatchModel) _then) = __$RoutePatchModelCopyWithImpl;
@override @useResult
$Res call({
 Geometry geometry, TripId id, MapLatLngBounds? bounds, bool recomputing, Object? error
});




}
/// @nodoc
class __$RoutePatchModelCopyWithImpl<$Res>
    implements _$RoutePatchModelCopyWith<$Res> {
  __$RoutePatchModelCopyWithImpl(this._self, this._then);

  final _RoutePatchModel _self;
  final $Res Function(_RoutePatchModel) _then;

/// Create a copy of RoutePatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? geometry = null,Object? id = null,Object? bounds = freezed,Object? recomputing = null,Object? error = freezed,}) {
  return _then(_RoutePatchModel(
geometry: null == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as Geometry,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as TripId,bounds: freezed == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as MapLatLngBounds?,recomputing: null == recomputing ? _self.recomputing : recomputing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
