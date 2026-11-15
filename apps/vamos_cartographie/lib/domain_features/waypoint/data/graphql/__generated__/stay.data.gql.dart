// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/domain_features/waypoint/data/graphql/__generated__/waypoint_fields.data.gql.dart'
    as _i1;

class GSetStayData {
  const GSetStayData({
    required this.setStay,
    this.G__typename = 'Mutation',
  });

  factory GSetStayData.fromJson(Map<String, dynamic> json) {
    return GSetStayData(
      setStay: _i1.GWaypointDetailsData.fromJson(
          (json['setStay'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GWaypointDetailsData setStay;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['setStay'] = this.setStay.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSetStayData copyWith({
    _i1.GWaypointDetailsData? setStay,
    String? G__typename,
  }) {
    return GSetStayData(
      setStay: setStay ?? this.setStay,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSetStayData &&
            setStay == other.setStay &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, setStay, G__typename);
  }

  @override
  String toString() {
    return 'GSetStayData(setStay: $setStay, G__typename: $G__typename)';
  }
}

class GClearStayData {
  const GClearStayData({
    required this.clearStay,
    this.G__typename = 'Mutation',
  });

  factory GClearStayData.fromJson(Map<String, dynamic> json) {
    return GClearStayData(
      clearStay: _i1.GWaypointDetailsData.fromJson(
          (json['clearStay'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GWaypointDetailsData clearStay;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['clearStay'] = this.clearStay.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GClearStayData copyWith({
    _i1.GWaypointDetailsData? clearStay,
    String? G__typename,
  }) {
    return GClearStayData(
      clearStay: clearStay ?? this.clearStay,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GClearStayData &&
            clearStay == other.clearStay &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, clearStay, G__typename);
  }

  @override
  String toString() {
    return 'GClearStayData(clearStay: $clearStay, G__typename: $G__typename)';
  }
}

class GSetDayNoteData {
  const GSetDayNoteData({
    this.setDayNote,
    this.G__typename = 'Mutation',
  });

  factory GSetDayNoteData.fromJson(Map<String, dynamic> json) {
    return GSetDayNoteData(
      setDayNote: json['setDayNote'] == null
          ? null
          : _i1.GDayNoteDetailsData.fromJson(
              (json['setDayNote'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GDayNoteDetailsData? setDayNote;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$setDayNoteValue = this.setDayNote;
    _$result['setDayNote'] =
        _$setDayNoteValue == null ? null : _$setDayNoteValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSetDayNoteData copyWith({
    _i1.GDayNoteDetailsData? setDayNote,
    bool setDayNoteIsSet = false,
    String? G__typename,
  }) {
    return GSetDayNoteData(
      setDayNote:
          setDayNote != null || setDayNoteIsSet ? setDayNote : this.setDayNote,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSetDayNoteData &&
            setDayNote == other.setDayNote &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, setDayNote, G__typename);
  }

  @override
  String toString() {
    return 'GSetDayNoteData(setDayNote: $setDayNote, G__typename: $G__typename)';
  }
}

class GFinalDayNoteData {
  const GFinalDayNoteData({
    this.finalDayNote,
    this.G__typename = 'Query',
  });

  factory GFinalDayNoteData.fromJson(Map<String, dynamic> json) {
    return GFinalDayNoteData(
      finalDayNote: json['finalDayNote'] == null
          ? null
          : _i1.GDayNoteDetailsData.fromJson(
              (json['finalDayNote'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GDayNoteDetailsData? finalDayNote;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$finalDayNoteValue = this.finalDayNote;
    _$result['finalDayNote'] =
        _$finalDayNoteValue == null ? null : _$finalDayNoteValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GFinalDayNoteData copyWith({
    _i1.GDayNoteDetailsData? finalDayNote,
    bool finalDayNoteIsSet = false,
    String? G__typename,
  }) {
    return GFinalDayNoteData(
      finalDayNote: finalDayNote != null || finalDayNoteIsSet
          ? finalDayNote
          : this.finalDayNote,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFinalDayNoteData &&
            finalDayNote == other.finalDayNote &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, finalDayNote, G__typename);
  }

  @override
  String toString() {
    return 'GFinalDayNoteData(finalDayNote: $finalDayNote, G__typename: $G__typename)';
  }
}
