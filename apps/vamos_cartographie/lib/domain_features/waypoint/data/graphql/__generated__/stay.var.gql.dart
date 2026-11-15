// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GSetStayVars {
  const GSetStayVars({
    required this.waypointId,
    required this.nights,
  });

  factory GSetStayVars.fromJson(Map<String, dynamic> json) {
    return GSetStayVars(
      waypointId: (json['waypointId'] as String),
      nights: (json['nights'] as int),
    );
  }

  final String waypointId;

  final int nights;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$waypointIdValue = this.waypointId;
    _$result['waypointId'] = _$waypointIdValue;
    final _$nightsValue = this.nights;
    _$result['nights'] = _$nightsValue;
    return _$result;
  }

  GSetStayVars copyWith({
    String? waypointId,
    int? nights,
  }) {
    return GSetStayVars(
      waypointId: waypointId ?? this.waypointId,
      nights: nights ?? this.nights,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSetStayVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GSetStayVars(waypointId: $waypointId, nights: $nights)';
  }
}

class GClearStayVars {
  const GClearStayVars({required this.waypointId});

  factory GClearStayVars.fromJson(Map<String, dynamic> json) {
    return GClearStayVars(waypointId: (json['waypointId'] as String));
  }

  final String waypointId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$waypointIdValue = this.waypointId;
    _$result['waypointId'] = _$waypointIdValue;
    return _$result;
  }

  GClearStayVars copyWith({String? waypointId}) {
    return GClearStayVars(waypointId: waypointId ?? this.waypointId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GClearStayVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GClearStayVars(waypointId: $waypointId)';
  }
}

class GSetDayNoteVars {
  const GSetDayNoteVars({
    required this.tripId,
    this.stayId = const Value.absent(),
    required this.offset,
    required this.title,
    required this.notes,
  });

  factory GSetDayNoteVars.fromJson(Map<String, dynamic> json) {
    return GSetDayNoteVars(
      tripId: (json['tripId'] as String),
      stayId: json.containsKey('stayId')
          ? Value.present(
              json['stayId'] == null ? null : (json['stayId'] as String))
          : Value.absent(),
      offset: (json['offset'] as int),
      title: (json['title'] as String),
      notes: (json['notes'] as String),
    );
  }

  final String tripId;

  final Value<String> stayId;

  final int offset;

  final String title;

  final String notes;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$stayIdValue = this.stayId;
    if (_$stayIdValue.isPresent) {
      final _$stayIdRequired = _$stayIdValue.requireValue;
      _$result['stayId'] = _$stayIdRequired == null ? null : _$stayIdRequired;
    }
    final _$offsetValue = this.offset;
    _$result['offset'] = _$offsetValue;
    final _$titleValue = this.title;
    _$result['title'] = _$titleValue;
    final _$notesValue = this.notes;
    _$result['notes'] = _$notesValue;
    return _$result;
  }

  GSetDayNoteVars copyWith({
    String? tripId,
    Value<String>? stayId,
    int? offset,
    String? title,
    String? notes,
  }) {
    return GSetDayNoteVars(
      tripId: tripId ?? this.tripId,
      stayId: stayId ?? this.stayId,
      offset: offset ?? this.offset,
      title: title ?? this.title,
      notes: notes ?? this.notes,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSetDayNoteVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GSetDayNoteVars(tripId: $tripId, stayId: $stayId, offset: $offset, title: $title, notes: $notes)';
  }
}

class GFinalDayNoteVars {
  const GFinalDayNoteVars({required this.tripId});

  factory GFinalDayNoteVars.fromJson(Map<String, dynamic> json) {
    return GFinalDayNoteVars(tripId: (json['tripId'] as String));
  }

  final String tripId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    return _$result;
  }

  GFinalDayNoteVars copyWith({String? tripId}) {
    return GFinalDayNoteVars(tripId: tripId ?? this.tripId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFinalDayNoteVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GFinalDayNoteVars(tripId: $tripId)';
  }
}
