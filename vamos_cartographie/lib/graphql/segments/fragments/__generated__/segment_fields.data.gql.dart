// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

abstract class GSegmentFields {
  _i1.GSegmentTypeEnum get type;
  List<GSegmentFields_intermediatePoints> get intermediatePoints;
  String get G__typename;
}

abstract class GSegmentFields_intermediatePoints {
  double get lat;
  double get lng;
  String get G__typename;
}

class GSegmentFieldsData implements GSegmentFields {
  const GSegmentFieldsData({
    required this.type,
    required this.intermediatePoints,
    this.G__typename = 'SegmentType',
  });

  factory GSegmentFieldsData.fromJson(Map<String, dynamic> json) {
    return GSegmentFieldsData(
      type: _i1.GSegmentTypeEnum.fromJson((json['type'] as String)),
      intermediatePoints: (json['intermediatePoints'] as List<dynamic>)
          .map((_$e) => GSegmentFieldsData_intermediatePoints.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GSegmentTypeEnum type;

  final List<GSegmentFieldsData_intermediatePoints> intermediatePoints;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['type'] = this.type.toJson();
    _$result['intermediatePoints'] =
        this.intermediatePoints.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSegmentFieldsData copyWith({
    _i1.GSegmentTypeEnum? type,
    List<GSegmentFieldsData_intermediatePoints>? intermediatePoints,
    String? G__typename,
  }) {
    return GSegmentFieldsData(
      type: type ?? this.type,
      intermediatePoints: intermediatePoints ?? this.intermediatePoints,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentFieldsData &&
            type == other.type &&
            _gqlUtils.listEquals(
                intermediatePoints, other.intermediatePoints) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, type, _gqlUtils.listHash(intermediatePoints), G__typename);
  }

  @override
  String toString() {
    return 'GSegmentFieldsData(type: $type, intermediatePoints: $intermediatePoints, G__typename: $G__typename)';
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
