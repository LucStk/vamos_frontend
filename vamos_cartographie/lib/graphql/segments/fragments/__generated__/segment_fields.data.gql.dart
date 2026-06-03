// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

abstract class GSegmentFields {
  int get id;
  _i1.GSegmentTypeEnum get type;
  List<GSegmentFields_intermediatePoints> get intermediatePoints;
  GSegmentFields_startWaypoint get startWaypoint;
  GSegmentFields_endWaypoint get endWaypoint;
  String get G__typename;
}

abstract class GSegmentFields_intermediatePoints {
  double get lat;
  double get lng;
  String get G__typename;
}

abstract class GSegmentFields_startWaypoint {
  int get id;
  String get G__typename;
}

abstract class GSegmentFields_endWaypoint {
  int get id;
  String get G__typename;
}

class GSegmentFieldsData implements GSegmentFields {
  const GSegmentFieldsData({
    required this.id,
    required this.type,
    required this.intermediatePoints,
    required this.startWaypoint,
    required this.endWaypoint,
    this.G__typename = 'SegmentType',
  });

  factory GSegmentFieldsData.fromJson(Map<String, dynamic> json) {
    return GSegmentFieldsData(
      id: (json['id'] as int),
      type: _i1.GSegmentTypeEnum.fromJson((json['type'] as String)),
      intermediatePoints: (json['intermediatePoints'] as List<dynamic>)
          .map((_$e) => GSegmentFieldsData_intermediatePoints.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      startWaypoint: GSegmentFieldsData_startWaypoint.fromJson(
          (json['startWaypoint'] as Map<String, dynamic>)),
      endWaypoint: GSegmentFieldsData_endWaypoint.fromJson(
          (json['endWaypoint'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final int id;

  final _i1.GSegmentTypeEnum type;

  final List<GSegmentFieldsData_intermediatePoints> intermediatePoints;

  final GSegmentFieldsData_startWaypoint startWaypoint;

  final GSegmentFieldsData_endWaypoint endWaypoint;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['type'] = this.type.toJson();
    _$result['intermediatePoints'] =
        this.intermediatePoints.map((_$e) => _$e.toJson()).toList();
    _$result['startWaypoint'] = this.startWaypoint.toJson();
    _$result['endWaypoint'] = this.endWaypoint.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSegmentFieldsData copyWith({
    int? id,
    _i1.GSegmentTypeEnum? type,
    List<GSegmentFieldsData_intermediatePoints>? intermediatePoints,
    GSegmentFieldsData_startWaypoint? startWaypoint,
    GSegmentFieldsData_endWaypoint? endWaypoint,
    String? G__typename,
  }) {
    return GSegmentFieldsData(
      id: id ?? this.id,
      type: type ?? this.type,
      intermediatePoints: intermediatePoints ?? this.intermediatePoints,
      startWaypoint: startWaypoint ?? this.startWaypoint,
      endWaypoint: endWaypoint ?? this.endWaypoint,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentFieldsData &&
            id == other.id &&
            type == other.type &&
            _gqlUtils.listEquals(
                intermediatePoints, other.intermediatePoints) &&
            startWaypoint == other.startWaypoint &&
            endWaypoint == other.endWaypoint &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        type,
        _gqlUtils.listHash(intermediatePoints),
        startWaypoint,
        endWaypoint,
        G__typename);
  }

  @override
  String toString() {
    return 'GSegmentFieldsData(id: $id, type: $type, intermediatePoints: $intermediatePoints, startWaypoint: $startWaypoint, endWaypoint: $endWaypoint, G__typename: $G__typename)';
  }
}

class GSegmentFieldsData_intermediatePoints
    implements GSegmentFields_intermediatePoints {
  const GSegmentFieldsData_intermediatePoints({
    required this.lat,
    required this.lng,
    this.G__typename = 'LatLngType',
  });

  factory GSegmentFieldsData_intermediatePoints.fromJson(
      Map<String, dynamic> json) {
    return GSegmentFieldsData_intermediatePoints(
      lat: (json['lat'] as double),
      lng: (json['lng'] as double),
      G__typename: (json['__typename'] as String),
    );
  }

  final double lat;

  final double lng;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['lat'] = this.lat;
    _$result['lng'] = this.lng;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSegmentFieldsData_intermediatePoints copyWith({
    double? lat,
    double? lng,
    String? G__typename,
  }) {
    return GSegmentFieldsData_intermediatePoints(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentFieldsData_intermediatePoints &&
            lat == other.lat &&
            lng == other.lng &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, lat, lng, G__typename);
  }

  @override
  String toString() {
    return 'GSegmentFieldsData_intermediatePoints(lat: $lat, lng: $lng, G__typename: $G__typename)';
  }
}

class GSegmentFieldsData_startWaypoint implements GSegmentFields_startWaypoint {
  const GSegmentFieldsData_startWaypoint({
    required this.id,
    this.G__typename = 'WaypointType',
  });

  factory GSegmentFieldsData_startWaypoint.fromJson(Map<String, dynamic> json) {
    return GSegmentFieldsData_startWaypoint(
      id: (json['id'] as int),
      G__typename: (json['__typename'] as String),
    );
  }

  final int id;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSegmentFieldsData_startWaypoint copyWith({
    int? id,
    String? G__typename,
  }) {
    return GSegmentFieldsData_startWaypoint(
      id: id ?? this.id,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentFieldsData_startWaypoint &&
            id == other.id &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, G__typename);
  }

  @override
  String toString() {
    return 'GSegmentFieldsData_startWaypoint(id: $id, G__typename: $G__typename)';
  }
}

class GSegmentFieldsData_endWaypoint implements GSegmentFields_endWaypoint {
  const GSegmentFieldsData_endWaypoint({
    required this.id,
    this.G__typename = 'WaypointType',
  });

  factory GSegmentFieldsData_endWaypoint.fromJson(Map<String, dynamic> json) {
    return GSegmentFieldsData_endWaypoint(
      id: (json['id'] as int),
      G__typename: (json['__typename'] as String),
    );
  }

  final int id;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSegmentFieldsData_endWaypoint copyWith({
    int? id,
    String? G__typename,
  }) {
    return GSegmentFieldsData_endWaypoint(
      id: id ?? this.id,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentFieldsData_endWaypoint &&
            id == other.id &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, G__typename);
  }

  @override
  String toString() {
    return 'GSegmentFieldsData_endWaypoint(id: $id, G__typename: $G__typename)';
  }
}
