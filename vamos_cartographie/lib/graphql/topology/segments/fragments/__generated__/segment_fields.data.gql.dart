// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/graphql/topology/vertex/__generated__/vertex_fields.data.gql.dart'
    as _i2;

abstract class GSegmentFields {
  int get id;
  _i1.GSegmentTypeEnum get type;
  _i2.GVertexFields get startVertex;
  _i2.GVertexFields get endVertex;
  List<GSegmentFields_geometry> get geometry;
  String get G__typename;
}

abstract class GSegmentFields_geometry {
  double get lat;
  double get lng;
  String get G__typename;
}

class GSegmentFieldsData implements GSegmentFields {
  const GSegmentFieldsData({
    required this.id,
    required this.type,
    required this.startVertex,
    required this.endVertex,
    required this.geometry,
    this.G__typename = 'SegmentType',
  });

  factory GSegmentFieldsData.fromJson(Map<String, dynamic> json) {
    return GSegmentFieldsData(
      id: (json['id'] as int),
      type: _i1.GSegmentTypeEnum.fromJson((json['type'] as String)),
      startVertex: _i2.GVertexFieldsData.fromJson(
          (json['startVertex'] as Map<String, dynamic>)),
      endVertex: _i2.GVertexFieldsData.fromJson(
          (json['endVertex'] as Map<String, dynamic>)),
      geometry: (json['geometry'] as List<dynamic>)
          .map((_$e) => GSegmentFieldsData_geometry.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final int id;

  final _i1.GSegmentTypeEnum type;

  final _i2.GVertexFieldsData startVertex;

  final _i2.GVertexFieldsData endVertex;

  final List<GSegmentFieldsData_geometry> geometry;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['type'] = this.type.toJson();
    _$result['startVertex'] = this.startVertex.toJson();
    _$result['endVertex'] = this.endVertex.toJson();
    _$result['geometry'] = this.geometry.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSegmentFieldsData copyWith({
    int? id,
    _i1.GSegmentTypeEnum? type,
    _i2.GVertexFieldsData? startVertex,
    _i2.GVertexFieldsData? endVertex,
    List<GSegmentFieldsData_geometry>? geometry,
    String? G__typename,
  }) {
    return GSegmentFieldsData(
      id: id ?? this.id,
      type: type ?? this.type,
      startVertex: startVertex ?? this.startVertex,
      endVertex: endVertex ?? this.endVertex,
      geometry: geometry ?? this.geometry,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentFieldsData &&
            id == other.id &&
            type == other.type &&
            startVertex == other.startVertex &&
            endVertex == other.endVertex &&
            _gqlUtils.listEquals(geometry, other.geometry) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, type, startVertex, endVertex,
        _gqlUtils.listHash(geometry), G__typename);
  }

  @override
  String toString() {
    return 'GSegmentFieldsData(id: $id, type: $type, startVertex: $startVertex, endVertex: $endVertex, geometry: $geometry, G__typename: $G__typename)';
  }
}

class GSegmentFieldsData_geometry implements GSegmentFields_geometry {
  const GSegmentFieldsData_geometry({
    required this.lat,
    required this.lng,
    this.G__typename = 'LatLngType',
  });

  factory GSegmentFieldsData_geometry.fromJson(Map<String, dynamic> json) {
    return GSegmentFieldsData_geometry(
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

  GSegmentFieldsData_geometry copyWith({
    double? lat,
    double? lng,
    String? G__typename,
  }) {
    return GSegmentFieldsData_geometry(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentFieldsData_geometry &&
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
    return 'GSegmentFieldsData_geometry(lat: $lat, lng: $lng, G__typename: $G__typename)';
  }
}
