// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapEvent {

 int get waypointId;
/// Create a copy of MapEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapEventCopyWith<MapEvent> get copyWith => _$MapEventCopyWithImpl<MapEvent>(this as MapEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapEvent&&(identical(other.waypointId, waypointId) || other.waypointId == waypointId));
}


@override
int get hashCode => Object.hash(runtimeType,waypointId);

@override
String toString() {
  return 'MapEvent(waypointId: $waypointId)';
}


}

/// @nodoc
abstract mixin class $MapEventCopyWith<$Res>  {
  factory $MapEventCopyWith(MapEvent value, $Res Function(MapEvent) _then) = _$MapEventCopyWithImpl;
@useResult
$Res call({
 int waypointId
});




}
/// @nodoc
class _$MapEventCopyWithImpl<$Res>
    implements $MapEventCopyWith<$Res> {
  _$MapEventCopyWithImpl(this._self, this._then);

  final MapEvent _self;
  final $Res Function(MapEvent) _then;

/// Create a copy of MapEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? waypointId = null,}) {
  return _then(_self.copyWith(
waypointId: null == waypointId ? _self.waypointId : waypointId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MapEvent].
extension MapEventPatterns on MapEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OpenWaypointDialog value)?  openWaypointDialog,TResult Function( OpenWaypointEditor value)?  openWaypointEditor,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OpenWaypointDialog() when openWaypointDialog != null:
return openWaypointDialog(_that);case OpenWaypointEditor() when openWaypointEditor != null:
return openWaypointEditor(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OpenWaypointDialog value)  openWaypointDialog,required TResult Function( OpenWaypointEditor value)  openWaypointEditor,}){
final _that = this;
switch (_that) {
case OpenWaypointDialog():
return openWaypointDialog(_that);case OpenWaypointEditor():
return openWaypointEditor(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OpenWaypointDialog value)?  openWaypointDialog,TResult? Function( OpenWaypointEditor value)?  openWaypointEditor,}){
final _that = this;
switch (_that) {
case OpenWaypointDialog() when openWaypointDialog != null:
return openWaypointDialog(_that);case OpenWaypointEditor() when openWaypointEditor != null:
return openWaypointEditor(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int waypointId)?  openWaypointDialog,TResult Function( int waypointId)?  openWaypointEditor,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OpenWaypointDialog() when openWaypointDialog != null:
return openWaypointDialog(_that.waypointId);case OpenWaypointEditor() when openWaypointEditor != null:
return openWaypointEditor(_that.waypointId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int waypointId)  openWaypointDialog,required TResult Function( int waypointId)  openWaypointEditor,}) {final _that = this;
switch (_that) {
case OpenWaypointDialog():
return openWaypointDialog(_that.waypointId);case OpenWaypointEditor():
return openWaypointEditor(_that.waypointId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int waypointId)?  openWaypointDialog,TResult? Function( int waypointId)?  openWaypointEditor,}) {final _that = this;
switch (_that) {
case OpenWaypointDialog() when openWaypointDialog != null:
return openWaypointDialog(_that.waypointId);case OpenWaypointEditor() when openWaypointEditor != null:
return openWaypointEditor(_that.waypointId);case _:
  return null;

}
}

}

/// @nodoc


class OpenWaypointDialog implements MapEvent {
  const OpenWaypointDialog({required this.waypointId});
  

@override final  int waypointId;

/// Create a copy of MapEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenWaypointDialogCopyWith<OpenWaypointDialog> get copyWith => _$OpenWaypointDialogCopyWithImpl<OpenWaypointDialog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenWaypointDialog&&(identical(other.waypointId, waypointId) || other.waypointId == waypointId));
}


@override
int get hashCode => Object.hash(runtimeType,waypointId);

@override
String toString() {
  return 'MapEvent.openWaypointDialog(waypointId: $waypointId)';
}


}

/// @nodoc
abstract mixin class $OpenWaypointDialogCopyWith<$Res> implements $MapEventCopyWith<$Res> {
  factory $OpenWaypointDialogCopyWith(OpenWaypointDialog value, $Res Function(OpenWaypointDialog) _then) = _$OpenWaypointDialogCopyWithImpl;
@override @useResult
$Res call({
 int waypointId
});




}
/// @nodoc
class _$OpenWaypointDialogCopyWithImpl<$Res>
    implements $OpenWaypointDialogCopyWith<$Res> {
  _$OpenWaypointDialogCopyWithImpl(this._self, this._then);

  final OpenWaypointDialog _self;
  final $Res Function(OpenWaypointDialog) _then;

/// Create a copy of MapEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? waypointId = null,}) {
  return _then(OpenWaypointDialog(
waypointId: null == waypointId ? _self.waypointId : waypointId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class OpenWaypointEditor implements MapEvent {
  const OpenWaypointEditor({required this.waypointId});
  

@override final  int waypointId;

/// Create a copy of MapEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenWaypointEditorCopyWith<OpenWaypointEditor> get copyWith => _$OpenWaypointEditorCopyWithImpl<OpenWaypointEditor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenWaypointEditor&&(identical(other.waypointId, waypointId) || other.waypointId == waypointId));
}


@override
int get hashCode => Object.hash(runtimeType,waypointId);

@override
String toString() {
  return 'MapEvent.openWaypointEditor(waypointId: $waypointId)';
}


}

/// @nodoc
abstract mixin class $OpenWaypointEditorCopyWith<$Res> implements $MapEventCopyWith<$Res> {
  factory $OpenWaypointEditorCopyWith(OpenWaypointEditor value, $Res Function(OpenWaypointEditor) _then) = _$OpenWaypointEditorCopyWithImpl;
@override @useResult
$Res call({
 int waypointId
});




}
/// @nodoc
class _$OpenWaypointEditorCopyWithImpl<$Res>
    implements $OpenWaypointEditorCopyWith<$Res> {
  _$OpenWaypointEditorCopyWithImpl(this._self, this._then);

  final OpenWaypointEditor _self;
  final $Res Function(OpenWaypointEditor) _then;

/// Create a copy of MapEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? waypointId = null,}) {
  return _then(OpenWaypointEditor(
waypointId: null == waypointId ? _self.waypointId : waypointId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
