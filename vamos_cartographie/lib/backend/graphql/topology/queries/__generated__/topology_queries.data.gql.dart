// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/backend/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/backend/graphql/topology/fields/__generated__/segment_fields.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/backend/graphql/topology/fields/__generated__/vertex_fields.data.gql.dart'
    as _i1;

class GGetTopologyData {
  const GGetTopologyData({
    required this.trip,
    this.G__typename = 'Query',
  });

  factory GGetTopologyData.fromJson(Map<String, dynamic> json) {
    return GGetTopologyData(
      trip: GGetTopologyData_trip.fromJson(
          (json['trip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GGetTopologyData_trip trip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['trip'] = this.trip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetTopologyData copyWith({
    GGetTopologyData_trip? trip,
    String? G__typename,
  }) {
    return GGetTopologyData(
      trip: trip ?? this.trip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTopologyData &&
            trip == other.trip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, trip, G__typename);
  }

  @override
  String toString() {
    return 'GGetTopologyData(trip: $trip, G__typename: $G__typename)';
  }
}

class GGetTopologyData_trip {
  const GGetTopologyData_trip({
    required this.id,
    required this.topology,
    this.G__typename = 'TripType',
  });

  factory GGetTopologyData_trip.fromJson(Map<String, dynamic> json) {
    return GGetTopologyData_trip(
      id: (json['id'] as int),
      topology: GGetTopologyData_trip_topology.fromJson(
          (json['topology'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final int id;

  final GGetTopologyData_trip_topology topology;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['topology'] = this.topology.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetTopologyData_trip copyWith({
    int? id,
    GGetTopologyData_trip_topology? topology,
    String? G__typename,
  }) {
    return GGetTopologyData_trip(
      id: id ?? this.id,
      topology: topology ?? this.topology,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTopologyData_trip &&
            id == other.id &&
            topology == other.topology &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, topology, G__typename);
  }

  @override
  String toString() {
    return 'GGetTopologyData_trip(id: $id, topology: $topology, G__typename: $G__typename)';
  }
}

class GGetTopologyData_trip_topology {
  const GGetTopologyData_trip_topology({
    required this.vertices,
    required this.segments,
    this.G__typename = 'TopologyType',
  });

  factory GGetTopologyData_trip_topology.fromJson(Map<String, dynamic> json) {
    return GGetTopologyData_trip_topology(
      vertices: (json['vertices'] as List<dynamic>)
          .map((_$e) =>
              _i1.GVertexFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      segments: (json['segments'] as List<dynamic>)
          .map((_$e) =>
              _i2.GSegmentFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<_i1.GVertexFieldsData> vertices;

  final List<_i2.GSegmentFieldsData> segments;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['vertices'] = this.vertices.map((_$e) => _$e.toJson()).toList();
    _$result['segments'] = this.segments.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetTopologyData_trip_topology copyWith({
    List<_i1.GVertexFieldsData>? vertices,
    List<_i2.GSegmentFieldsData>? segments,
    String? G__typename,
  }) {
    return GGetTopologyData_trip_topology(
      vertices: vertices ?? this.vertices,
      segments: segments ?? this.segments,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTopologyData_trip_topology &&
            _gqlUtils.listEquals(vertices, other.vertices) &&
            _gqlUtils.listEquals(segments, other.segments) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(vertices),
        _gqlUtils.listHash(segments), G__typename);
  }

  @override
  String toString() {
    return 'GGetTopologyData_trip_topology(vertices: $vertices, segments: $segments, G__typename: $G__typename)';
  }
}
