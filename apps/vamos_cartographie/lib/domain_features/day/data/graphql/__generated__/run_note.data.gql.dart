// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

abstract class GRunNoteDetails {
  String get id;
  String? get stayId;
  String get spanId;
  String get title;
  String get notes;
  String get G__typename;
}

class GRunNoteDetailsData implements GRunNoteDetails {
  const GRunNoteDetailsData({
    required this.id,
    this.stayId,
    required this.spanId,
    required this.title,
    required this.notes,
    this.G__typename = 'RunNoteType',
  });

  factory GRunNoteDetailsData.fromJson(Map<String, dynamic> json) {
    return GRunNoteDetailsData(
      id: (json['id'] as String),
      stayId: json['stayId'] == null ? null : (json['stayId'] as String),
      spanId: (json['spanId'] as String),
      title: (json['title'] as String),
      notes: (json['notes'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String? stayId;

  final String spanId;

  final String title;

  final String notes;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    final _$stayIdValue = this.stayId;
    _$result['stayId'] = _$stayIdValue == null ? null : _$stayIdValue;
    _$result['spanId'] = this.spanId;
    _$result['title'] = this.title;
    _$result['notes'] = this.notes;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GRunNoteDetailsData copyWith({
    String? id,
    String? stayId,
    bool stayIdIsSet = false,
    String? spanId,
    String? title,
    String? notes,
    String? G__typename,
  }) {
    return GRunNoteDetailsData(
      id: id ?? this.id,
      stayId: stayId != null || stayIdIsSet ? stayId : this.stayId,
      spanId: spanId ?? this.spanId,
      title: title ?? this.title,
      notes: notes ?? this.notes,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRunNoteDetailsData &&
            id == other.id &&
            stayId == other.stayId &&
            spanId == other.spanId &&
            title == other.title &&
            notes == other.notes &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, stayId, spanId, title, notes, G__typename);
  }

  @override
  String toString() {
    return 'GRunNoteDetailsData(id: $id, stayId: $stayId, spanId: $spanId, title: $title, notes: $notes, G__typename: $G__typename)';
  }
}

class GRunNotesData {
  const GRunNotesData({
    required this.runNotes,
    this.G__typename = 'Query',
  });

  factory GRunNotesData.fromJson(Map<String, dynamic> json) {
    return GRunNotesData(
      runNotes: (json['runNotes'] as List<dynamic>)
          .map((_$e) =>
              GRunNoteDetailsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<GRunNoteDetailsData> runNotes;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['runNotes'] = this.runNotes.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GRunNotesData copyWith({
    List<GRunNoteDetailsData>? runNotes,
    String? G__typename,
  }) {
    return GRunNotesData(
      runNotes: runNotes ?? this.runNotes,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRunNotesData &&
            _gqlUtils.listEquals(runNotes, other.runNotes) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(runNotes), G__typename);
  }

  @override
  String toString() {
    return 'GRunNotesData(runNotes: $runNotes, G__typename: $G__typename)';
  }
}

class GSetRunNoteData {
  const GSetRunNoteData({
    this.setRunNote,
    this.G__typename = 'Mutation',
  });

  factory GSetRunNoteData.fromJson(Map<String, dynamic> json) {
    return GSetRunNoteData(
      setRunNote: json['setRunNote'] == null
          ? null
          : GRunNoteDetailsData.fromJson(
              (json['setRunNote'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GRunNoteDetailsData? setRunNote;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$setRunNoteValue = this.setRunNote;
    _$result['setRunNote'] =
        _$setRunNoteValue == null ? null : _$setRunNoteValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSetRunNoteData copyWith({
    GRunNoteDetailsData? setRunNote,
    bool setRunNoteIsSet = false,
    String? G__typename,
  }) {
    return GSetRunNoteData(
      setRunNote:
          setRunNote != null || setRunNoteIsSet ? setRunNote : this.setRunNote,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSetRunNoteData &&
            setRunNote == other.setRunNote &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, setRunNote, G__typename);
  }

  @override
  String toString() {
    return 'GSetRunNoteData(setRunNote: $setRunNote, G__typename: $G__typename)';
  }
}
