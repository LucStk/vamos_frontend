// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/core/graphql/topology/fields/__generated__/vertex_fields.data.gql.dart'
    as _i1;

class GGetVerticesData {
  const GGetVerticesData({
    required this.trip,
    this.G__typename = 'Query',
  });

  factory GGetVerticesData.fromJson(Map<String, dynamic> json) {
    return GGetVerticesData(
      trip: GGetVerticesData_trip.fromJson(
          (json['trip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GGetVerticesData_trip trip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['trip'] = this.trip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetVerticesData copyWith({
    GGetVerticesData_trip? trip,
    String? G__typename,
  }) {
    return GGetVerticesData(
      trip: trip ?? this.trip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetVerticesData &&
            trip == other.trip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, trip, G__typename);
  }

  @override
  String toString() {
    return 'GGetVerticesData(trip: $trip, G__typename: $G__typename)';
  }
}

class GGetVerticesData_trip {
  const GGetVerticesData_trip({
    required this.topology,
    this.G__typename = 'TripType',
  });

  factory GGetVerticesData_trip.fromJson(Map<String, dynamic> json) {
    return GGetVerticesData_trip(
      topology: GGetVerticesData_trip_topology.fromJson(
          (json['topology'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GGetVerticesData_trip_topology topology;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['topology'] = this.topology.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetVerticesData_trip copyWith({
    GGetVerticesData_trip_topology? topology,
    String? G__typename,
  }) {
    return GGetVerticesData_trip(
      topology: topology ?? this.topology,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetVerticesData_trip &&
            topology == other.topology &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, topology, G__typename);
  }

  @override
  String toString() {
    return 'GGetVerticesData_trip(topology: $topology, G__typename: $G__typename)';
  }
}

class GGetVerticesData_trip_topology {
  const GGetVerticesData_trip_topology({
    required this.vertices,
    this.G__typename = 'TopologyType',
  });

  factory GGetVerticesData_trip_topology.fromJson(Map<String, dynamic> json) {
    return GGetVerticesData_trip_topology(
      vertices: (json['vertices'] as List<dynamic>)
          .map((_$e) =>
              _i1.GVertexFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<_i1.GVertexFieldsData> vertices;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['vertices'] = this.vertices.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetVerticesData_trip_topology copyWith({
    List<_i1.GVertexFieldsData>? vertices,
    String? G__typename,
  }) {
    return GGetVerticesData_trip_topology(
      vertices: vertices ?? this.vertices,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetVerticesData_trip_topology &&
            _gqlUtils.listEquals(vertices, other.vertices) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(vertices), G__typename);
  }

  @override
  String toString() {
    return 'GGetVerticesData_trip_topology(vertices: $vertices, G__typename: $G__typename)';
  }
}
