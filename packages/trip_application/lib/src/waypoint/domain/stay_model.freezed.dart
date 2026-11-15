// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stay_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DayNote {

/// Null tant que le serveur ne l'a pas créée (mise à jour optimiste).
 DayNoteId? get id; StayId? get stayId; int get offset; String get title; String get notes;
/// Create a copy of DayNote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayNoteCopyWith<DayNote> get copyWith => _$DayNoteCopyWithImpl<DayNote>(this as DayNote, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DayNote;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayNote&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.stayId, _this.stayId) || other.stayId == _this.stayId)&&(identical(other.offset, _this.offset) || other.offset == _this.offset)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}


@override
int get hashCode {
  final _this = this as DayNote;
  return Object.hash(runtimeType,_this.id,_this.stayId,_this.offset,_this.title,_this.notes);
}

@override
String toString() {
  final _this = this as DayNote;
  return 'DayNote(id: ${_this.id}, stayId: ${_this.stayId}, offset: ${_this.offset}, title: ${_this.title}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $DayNoteCopyWith<$Res>  {
  factory $DayNoteCopyWith(DayNote value, $Res Function(DayNote) _then) = _$DayNoteCopyWithImpl;
@useResult
$Res call({
 DayNoteId? id, StayId? stayId, int offset, String title, String notes
});




}
/// @nodoc
class _$DayNoteCopyWithImpl<$Res>
    implements $DayNoteCopyWith<$Res> {
  _$DayNoteCopyWithImpl(this._self, this._then);

  final DayNote _self;
  final $Res Function(DayNote) _then;

/// Create a copy of DayNote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? stayId = freezed,Object? offset = null,Object? title = null,Object? notes = null,}) {
  return _then(DayNote(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as DayNoteId?,stayId: freezed == stayId ? _self.stayId : stayId // ignore: cast_nullable_to_non_nullable
as StayId?,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DayNote].
extension DayNotePatterns on DayNote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayNote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayNote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayNote value)  $default,){
final _that = this;
switch (_that) {
case _DayNote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayNote value)?  $default,){
final _that = this;
switch (_that) {
case _DayNote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DayNoteId? id,  StayId? stayId,  int offset,  String title,  String notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayNote() when $default != null:
return $default(_that.id,_that.stayId,_that.offset,_that.title,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DayNoteId? id,  StayId? stayId,  int offset,  String title,  String notes)  $default,) {final _that = this;
switch (_that) {
case _DayNote():
return $default(_that.id,_that.stayId,_that.offset,_that.title,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DayNoteId? id,  StayId? stayId,  int offset,  String title,  String notes)?  $default,) {final _that = this;
switch (_that) {
case _DayNote() when $default != null:
return $default(_that.id,_that.stayId,_that.offset,_that.title,_that.notes);case _:
  return null;

}
}

}

/// @nodoc


class _DayNote extends DayNote {
  const _DayNote({this.id, this.stayId, required this.offset, this.title = '', this.notes = ''}): super._();
  

/// Null tant que le serveur ne l'a pas créée (mise à jour optimiste).
@override final  DayNoteId? id;
@override final  StayId? stayId;
@override final  int offset;
@override@JsonKey() final  String title;
@override@JsonKey() final  String notes;

/// Create a copy of DayNote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayNoteCopyWith<_DayNote> get copyWith => __$DayNoteCopyWithImpl<_DayNote>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayNote&&(identical(other.id, id) || other.id == id)&&(identical(other.stayId, stayId) || other.stayId == stayId)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.title, title) || other.title == title)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,stayId,offset,title,notes);
}

@override
String toString() {
    return 'DayNote(id: $id, stayId: $stayId, offset: $offset, title: $title, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$DayNoteCopyWith<$Res> implements $DayNoteCopyWith<$Res> {
  factory _$DayNoteCopyWith(_DayNote value, $Res Function(_DayNote) _then) = __$DayNoteCopyWithImpl;
@override @useResult
$Res call({
 DayNoteId? id, StayId? stayId, int offset, String title, String notes
});




}
/// @nodoc
class __$DayNoteCopyWithImpl<$Res>
    implements _$DayNoteCopyWith<$Res> {
  __$DayNoteCopyWithImpl(this._self, this._then);

  final _DayNote _self;
  final $Res Function(_DayNote) _then;

/// Create a copy of DayNote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? stayId = freezed,Object? offset = null,Object? title = null,Object? notes = null,}) {
  return _then(_DayNote(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as DayNoteId?,stayId: freezed == stayId ? _self.stayId : stayId // ignore: cast_nullable_to_non_nullable
as StayId?,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$StayInfo {

/// Null pendant la création optimiste, avant la réponse du serveur.
 StayId? get id; int get nights; List<DayNote> get dayNotes;
/// Create a copy of StayInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StayInfoCopyWith<StayInfo> get copyWith => _$StayInfoCopyWithImpl<StayInfo>(this as StayInfo, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StayInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StayInfo&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.nights, _this.nights) || other.nights == _this.nights)&&const DeepCollectionEquality().equals(other.dayNotes, _this.dayNotes));
}


@override
int get hashCode {
  final _this = this as StayInfo;
  return Object.hash(runtimeType,_this.id,_this.nights,const DeepCollectionEquality().hash(_this.dayNotes));
}

@override
String toString() {
  final _this = this as StayInfo;
  return 'StayInfo(id: ${_this.id}, nights: ${_this.nights}, dayNotes: ${_this.dayNotes})';
}


}

/// @nodoc
abstract mixin class $StayInfoCopyWith<$Res>  {
  factory $StayInfoCopyWith(StayInfo value, $Res Function(StayInfo) _then) = _$StayInfoCopyWithImpl;
@useResult
$Res call({
 StayId? id, int nights, List<DayNote> dayNotes
});




}
/// @nodoc
class _$StayInfoCopyWithImpl<$Res>
    implements $StayInfoCopyWith<$Res> {
  _$StayInfoCopyWithImpl(this._self, this._then);

  final StayInfo _self;
  final $Res Function(StayInfo) _then;

/// Create a copy of StayInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nights = null,Object? dayNotes = null,}) {
  return _then(StayInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as StayId?,nights: null == nights ? _self.nights : nights // ignore: cast_nullable_to_non_nullable
as int,dayNotes: null == dayNotes ? _self.dayNotes : dayNotes // ignore: cast_nullable_to_non_nullable
as List<DayNote>,
  ));
}

}


/// Adds pattern-matching-related methods to [StayInfo].
extension StayInfoPatterns on StayInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StayInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StayInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StayInfo value)  $default,){
final _that = this;
switch (_that) {
case _StayInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StayInfo value)?  $default,){
final _that = this;
switch (_that) {
case _StayInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StayId? id,  int nights,  List<DayNote> dayNotes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StayInfo() when $default != null:
return $default(_that.id,_that.nights,_that.dayNotes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StayId? id,  int nights,  List<DayNote> dayNotes)  $default,) {final _that = this;
switch (_that) {
case _StayInfo():
return $default(_that.id,_that.nights,_that.dayNotes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StayId? id,  int nights,  List<DayNote> dayNotes)?  $default,) {final _that = this;
switch (_that) {
case _StayInfo() when $default != null:
return $default(_that.id,_that.nights,_that.dayNotes);case _:
  return null;

}
}

}

/// @nodoc


class _StayInfo extends StayInfo {
  const _StayInfo({this.id, this.nights = 1,  List<DayNote> dayNotes = const <DayNote>[]}): _dayNotes = dayNotes,super._();
  

/// Null pendant la création optimiste, avant la réponse du serveur.
@override final  StayId? id;
@override@JsonKey() final  int nights;
 final  List<DayNote> _dayNotes;
@override@JsonKey() List<DayNote> get dayNotes {
  if (_dayNotes is EqualUnmodifiableListView) return _dayNotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dayNotes);
}


/// Create a copy of StayInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StayInfoCopyWith<_StayInfo> get copyWith => __$StayInfoCopyWithImpl<_StayInfo>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StayInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.nights, nights) || other.nights == nights)&&const DeepCollectionEquality().equals(other.dayNotes, _dayNotes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,nights,const DeepCollectionEquality().hash(_dayNotes));
}

@override
String toString() {
    return 'StayInfo(id: $id, nights: $nights, dayNotes: $dayNotes)';
}


}

/// @nodoc
abstract mixin class _$StayInfoCopyWith<$Res> implements $StayInfoCopyWith<$Res> {
  factory _$StayInfoCopyWith(_StayInfo value, $Res Function(_StayInfo) _then) = __$StayInfoCopyWithImpl;
@override @useResult
$Res call({
 StayId? id, int nights, List<DayNote> dayNotes
});




}
/// @nodoc
class __$StayInfoCopyWithImpl<$Res>
    implements _$StayInfoCopyWith<$Res> {
  __$StayInfoCopyWithImpl(this._self, this._then);

  final _StayInfo _self;
  final $Res Function(_StayInfo) _then;

/// Create a copy of StayInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nights = null,Object? dayNotes = null,}) {
  return _then(_StayInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as StayId?,nights: null == nights ? _self.nights : nights // ignore: cast_nullable_to_non_nullable
as int,dayNotes: null == dayNotes ? _self._dayNotes : dayNotes // ignore: cast_nullable_to_non_nullable
as List<DayNote>,
  ));
}


}

// dart format on
