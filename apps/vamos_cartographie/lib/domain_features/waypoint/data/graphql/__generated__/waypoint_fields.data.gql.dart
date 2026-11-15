// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/geo_fields.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/stored_file/data/graphql/__generated__/file_storage_fields.data.gql.dart'
    as _i3;

abstract class GDayNoteDetails {
  String get id;
  int get offset;
  String get title;
  String get notes;
  String? get stayId;
  String get G__typename;
}

class GDayNoteDetailsData implements GDayNoteDetails {
  const GDayNoteDetailsData({
    required this.id,
    required this.offset,
    required this.title,
    required this.notes,
    this.stayId,
    this.G__typename = 'DayNoteType',
  });

  factory GDayNoteDetailsData.fromJson(Map<String, dynamic> json) {
    return GDayNoteDetailsData(
      id: (json['id'] as String),
      offset: (json['offset'] as int),
      title: (json['title'] as String),
      notes: (json['notes'] as String),
      stayId: json['stayId'] == null ? null : (json['stayId'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final int offset;

  final String title;

  final String notes;

  final String? stayId;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['offset'] = this.offset;
    _$result['title'] = this.title;
    _$result['notes'] = this.notes;
    final _$stayIdValue = this.stayId;
    _$result['stayId'] = _$stayIdValue == null ? null : _$stayIdValue;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDayNoteDetailsData copyWith({
    String? id,
    int? offset,
    String? title,
    String? notes,
    String? stayId,
    bool stayIdIsSet = false,
    String? G__typename,
  }) {
    return GDayNoteDetailsData(
      id: id ?? this.id,
      offset: offset ?? this.offset,
      title: title ?? this.title,
      notes: notes ?? this.notes,
      stayId: stayId != null || stayIdIsSet ? stayId : this.stayId,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDayNoteDetailsData &&
            id == other.id &&
            offset == other.offset &&
            title == other.title &&
            notes == other.notes &&
            stayId == other.stayId &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, offset, title, notes, stayId, G__typename);
  }

  @override
  String toString() {
    return 'GDayNoteDetailsData(id: $id, offset: $offset, title: $title, notes: $notes, stayId: $stayId, G__typename: $G__typename)';
  }
}

abstract class GStayDetails {
  String get id;
  int get nights;
  List<GDayNoteDetails> get dayNotes;
  String get G__typename;
}

class GStayDetailsData implements GStayDetails {
  const GStayDetailsData({
    required this.id,
    required this.nights,
    required this.dayNotes,
    this.G__typename = 'StayType',
  });

  factory GStayDetailsData.fromJson(Map<String, dynamic> json) {
    return GStayDetailsData(
      id: (json['id'] as String),
      nights: (json['nights'] as int),
      dayNotes: (json['dayNotes'] as List<dynamic>)
          .map((_$e) =>
              GDayNoteDetailsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final int nights;

  final List<GDayNoteDetailsData> dayNotes;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['nights'] = this.nights;
    _$result['dayNotes'] = this.dayNotes.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GStayDetailsData copyWith({
    String? id,
    int? nights,
    List<GDayNoteDetailsData>? dayNotes,
    String? G__typename,
  }) {
    return GStayDetailsData(
      id: id ?? this.id,
      nights: nights ?? this.nights,
      dayNotes: dayNotes ?? this.dayNotes,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GStayDetailsData &&
            id == other.id &&
            nights == other.nights &&
            _gqlUtils.listEquals(dayNotes, other.dayNotes) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, nights, _gqlUtils.listHash(dayNotes), G__typename);
  }

  @override
  String toString() {
    return 'GStayDetailsData(id: $id, nights: $nights, dayNotes: $dayNotes, G__typename: $G__typename)';
  }
}

abstract class GWaypointDetails {
  String get id;
  double get anchorPosition;
  double? get distanceAlongRouteM;
  _i1.GWaypointKind get kind;
  String get title;
  String get description;
  _i2.GLatLng get location;
  List<_i3.GFileAttachment> get files;
  GStayDetails? get stay;
  String get G__typename;
}

class GWaypointDetailsData implements GWaypointDetails {
  const GWaypointDetailsData({
    required this.id,
    required this.anchorPosition,
    this.distanceAlongRouteM,
    required this.kind,
    required this.title,
    required this.description,
    required this.location,
    required this.files,
    this.stay,
    this.G__typename = 'WaypointType',
  });

  factory GWaypointDetailsData.fromJson(Map<String, dynamic> json) {
    return GWaypointDetailsData(
      id: (json['id'] as String),
      anchorPosition: (json['anchorPosition'] as num).toDouble(),
      distanceAlongRouteM: json['distanceAlongRouteM'] == null
          ? null
          : (json['distanceAlongRouteM'] as num).toDouble(),
      kind: _i1.GWaypointKind.fromJson((json['kind'] as String)),
      title: (json['title'] as String),
      description: (json['description'] as String),
      location:
          _i2.GLatLngData.fromJson((json['location'] as Map<String, dynamic>)),
      files: (json['files'] as List<dynamic>)
          .map((_$e) =>
              _i3.GFileAttachmentData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      stay: json['stay'] == null
          ? null
          : GStayDetailsData.fromJson((json['stay'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final double anchorPosition;

  final double? distanceAlongRouteM;

  final _i1.GWaypointKind kind;

  final String title;

  final String description;

  final _i2.GLatLngData location;

  final List<_i3.GFileAttachmentData> files;

  final GStayDetailsData? stay;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['anchorPosition'] = this.anchorPosition;
    final _$distanceAlongRouteMValue = this.distanceAlongRouteM;
    _$result['distanceAlongRouteM'] =
        _$distanceAlongRouteMValue == null ? null : _$distanceAlongRouteMValue;
    _$result['kind'] = this.kind.toJson();
    _$result['title'] = this.title;
    _$result['description'] = this.description;
    _$result['location'] = this.location.toJson();
    _$result['files'] = this.files.map((_$e) => _$e.toJson()).toList();
    final _$stayValue = this.stay;
    _$result['stay'] = _$stayValue == null ? null : _$stayValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GWaypointDetailsData copyWith({
    String? id,
    double? anchorPosition,
    double? distanceAlongRouteM,
    bool distanceAlongRouteMIsSet = false,
    _i1.GWaypointKind? kind,
    String? title,
    String? description,
    _i2.GLatLngData? location,
    List<_i3.GFileAttachmentData>? files,
    GStayDetailsData? stay,
    bool stayIsSet = false,
    String? G__typename,
  }) {
    return GWaypointDetailsData(
      id: id ?? this.id,
      anchorPosition: anchorPosition ?? this.anchorPosition,
      distanceAlongRouteM:
          distanceAlongRouteM != null || distanceAlongRouteMIsSet
              ? distanceAlongRouteM
              : this.distanceAlongRouteM,
      kind: kind ?? this.kind,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      files: files ?? this.files,
      stay: stay != null || stayIsSet ? stay : this.stay,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GWaypointDetailsData &&
            id == other.id &&
            anchorPosition == other.anchorPosition &&
            distanceAlongRouteM == other.distanceAlongRouteM &&
            kind == other.kind &&
            title == other.title &&
            description == other.description &&
            location == other.location &&
            _gqlUtils.listEquals(files, other.files) &&
            stay == other.stay &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        anchorPosition,
        distanceAlongRouteM,
        kind,
        title,
        description,
        location,
        _gqlUtils.listHash(files),
        stay,
        G__typename);
  }

  @override
  String toString() {
    return 'GWaypointDetailsData(id: $id, anchorPosition: $anchorPosition, distanceAlongRouteM: $distanceAlongRouteM, kind: $kind, title: $title, description: $description, location: $location, files: $files, stay: $stay, G__typename: $G__typename)';
  }
}
