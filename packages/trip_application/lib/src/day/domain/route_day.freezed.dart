// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RouteDay {

/// Numéro dans le calendrier, jours sur place compris (1, 4, 5…).
 int get number;/// Positions sur la polyline, même repère que `anchorPosition`.
 double get from; double get to;/// Waypoint de halte qui termine cette journée. Null : dernière journée
/// (celle qui finit à l'arrivée). Sert d'identité : le numéro change dès
/// qu'on modifie un nombre de nuits, pas la halte.
 WaypointId? get endsAt;
/// Create a copy of RouteDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteDayCopyWith<RouteDay> get copyWith => _$RouteDayCopyWithImpl<RouteDay>(this as RouteDay, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RouteDay;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteDay&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.from, _this.from) || other.from == _this.from)&&(identical(other.to, _this.to) || other.to == _this.to)&&(identical(other.endsAt, _this.endsAt) || other.endsAt == _this.endsAt));
}


@override
int get hashCode {
  final _this = this as RouteDay;
  return Object.hash(runtimeType,_this.number,_this.from,_this.to,_this.endsAt);
}

@override
String toString() {
  final _this = this as RouteDay;
  return 'RouteDay(number: ${_this.number}, from: ${_this.from}, to: ${_this.to}, endsAt: ${_this.endsAt})';
}


}

/// @nodoc
abstract mixin class $RouteDayCopyWith<$Res>  {
  factory $RouteDayCopyWith(RouteDay value, $Res Function(RouteDay) _then) = _$RouteDayCopyWithImpl;
@useResult
$Res call({
 int number, double from, double to, WaypointId? endsAt
});




}
/// @nodoc
class _$RouteDayCopyWithImpl<$Res>
    implements $RouteDayCopyWith<$Res> {
  _$RouteDayCopyWithImpl(this._self, this._then);

  final RouteDay _self;
  final $Res Function(RouteDay) _then;

/// Create a copy of RouteDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? from = null,Object? to = null,Object? endsAt = freezed,}) {
  return _then(RouteDay(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as double,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as double,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as WaypointId?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteDay].
extension RouteDayPatterns on RouteDay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteDay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteDay() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteDay value)  $default,){
final _that = this;
switch (_that) {
case _RouteDay():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteDay value)?  $default,){
final _that = this;
switch (_that) {
case _RouteDay() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int number,  double from,  double to,  WaypointId? endsAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteDay() when $default != null:
return $default(_that.number,_that.from,_that.to,_that.endsAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int number,  double from,  double to,  WaypointId? endsAt)  $default,) {final _that = this;
switch (_that) {
case _RouteDay():
return $default(_that.number,_that.from,_that.to,_that.endsAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int number,  double from,  double to,  WaypointId? endsAt)?  $default,) {final _that = this;
switch (_that) {
case _RouteDay() when $default != null:
return $default(_that.number,_that.from,_that.to,_that.endsAt);case _:
  return null;

}
}

}

/// @nodoc


class _RouteDay extends RouteDay {
  const _RouteDay({required this.number, required this.from, required this.to, this.endsAt}): super._();
  

/// Numéro dans le calendrier, jours sur place compris (1, 4, 5…).
@override final  int number;
/// Positions sur la polyline, même repère que `anchorPosition`.
@override final  double from;
@override final  double to;
/// Waypoint de halte qui termine cette journée. Null : dernière journée
/// (celle qui finit à l'arrivée). Sert d'identité : le numéro change dès
/// qu'on modifie un nombre de nuits, pas la halte.
@override final  WaypointId? endsAt;

/// Create a copy of RouteDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteDayCopyWith<_RouteDay> get copyWith => __$RouteDayCopyWithImpl<_RouteDay>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteDay&&(identical(other.number, number) || other.number == number)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,number,from,to,endsAt);
}

@override
String toString() {
    return 'RouteDay(number: $number, from: $from, to: $to, endsAt: $endsAt)';
}


}

/// @nodoc
abstract mixin class _$RouteDayCopyWith<$Res> implements $RouteDayCopyWith<$Res> {
  factory _$RouteDayCopyWith(_RouteDay value, $Res Function(_RouteDay) _then) = __$RouteDayCopyWithImpl;
@override @useResult
$Res call({
 int number, double from, double to, WaypointId? endsAt
});




}
/// @nodoc
class __$RouteDayCopyWithImpl<$Res>
    implements _$RouteDayCopyWith<$Res> {
  __$RouteDayCopyWithImpl(this._self, this._then);

  final _RouteDay _self;
  final $Res Function(_RouteDay) _then;

/// Create a copy of RouteDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? from = null,Object? to = null,Object? endsAt = freezed,}) {
  return _then(_RouteDay(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as double,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as double,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as WaypointId?,
  ));
}


}

// dart format on
