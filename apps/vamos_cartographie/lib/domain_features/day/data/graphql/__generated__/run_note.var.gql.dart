// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GRunNotesVars {
  const GRunNotesVars({required this.tripId});

  factory GRunNotesVars.fromJson(Map<String, dynamic> json) {
    return GRunNotesVars(tripId: (json['tripId'] as String));
  }

  final String tripId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    return _$result;
  }

  GRunNotesVars copyWith({String? tripId}) {
    return GRunNotesVars(tripId: tripId ?? this.tripId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRunNotesVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GRunNotesVars(tripId: $tripId)';
  }
}

class GSetRunNoteVars {
  const GSetRunNoteVars({
    required this.tripId,
    required this.spanId,
    this.stayId = const Value.absent(),
    required this.title,
    required this.notes,
  });

  factory GSetRunNoteVars.fromJson(Map<String, dynamic> json) {
    return GSetRunNoteVars(
      tripId: (json['tripId'] as String),
      spanId: (json['spanId'] as String),
      stayId: json.containsKey('stayId')
          ? Value.present(
              json['stayId'] == null ? null : (json['stayId'] as String))
          : Value.absent(),
      title: (json['title'] as String),
      notes: (json['notes'] as String),
    );
  }

  final String tripId;

  final String spanId;

  final Value<String> stayId;

  final String title;

  final String notes;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$spanIdValue = this.spanId;
    _$result['spanId'] = _$spanIdValue;
    final _$stayIdValue = this.stayId;
    if (_$stayIdValue.isPresent) {
      final _$stayIdRequired = _$stayIdValue.requireValue;
      _$result['stayId'] = _$stayIdRequired == null ? null : _$stayIdRequired;
    }
    final _$titleValue = this.title;
    _$result['title'] = _$titleValue;
    final _$notesValue = this.notes;
    _$result['notes'] = _$notesValue;
    return _$result;
  }

  GSetRunNoteVars copyWith({
    String? tripId,
    String? spanId,
    Value<String>? stayId,
    String? title,
    String? notes,
  }) {
    return GSetRunNoteVars(
      tripId: tripId ?? this.tripId,
      spanId: spanId ?? this.spanId,
      stayId: stayId ?? this.stayId,
      title: title ?? this.title,
      notes: notes ?? this.notes,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSetRunNoteVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GSetRunNoteVars(tripId: $tripId, spanId: $spanId, stayId: $stayId, title: $title, notes: $notes)';
  }
}
