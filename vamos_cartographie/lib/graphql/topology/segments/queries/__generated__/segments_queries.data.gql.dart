// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/graphql/topology/segments/fragments/__generated__/segment_fields.data.gql.dart'
    as _i1;

class GGetSegmentsData {
  const GGetSegmentsData({required this.trip, this.G__typename = 'Query'});

  factory GGetSegmentsData.fromJson(Map<String, dynamic> json) {
    return GGetSegmentsData(
      trip: GGetSegmentsData_trip.fromJson(
        (json['trip'] as Map<String, dynamic>),
      ),
      G__typename: (json['__typename'] as String),
    );
  }

  final GGetSegmentsData_trip trip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['trip'] = this.trip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetSegmentsData copyWith({
    GGetSegmentsData_trip? trip,
    String? G__typename,
  }) {
    return GGetSegmentsData(
      trip: trip ?? this.trip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetSegmentsData &&
            trip == other.trip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, trip, G__typename);
  }

  @override
  String toString() {
    return 'GGetSegmentsData(trip: $trip, G__typename: $G__typename)';
  }
}

class GGetSegmentsData_trip {
  const GGetSegmentsData_trip({
    required this.topology,
    this.G__typename = 'TripType',
  });

  factory GGetSegmentsData_trip.fromJson(Map<String, dynamic> json) {
    return GGetSegmentsData_trip(
      topology: GGetSegmentsData_trip_topology.fromJson(
        (json['topology'] as Map<String, dynamic>),
      ),
      G__typename: (json['__typename'] as String),
    );
  }

  final GGetSegmentsData_trip_topology topology;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['topology'] = this.topology.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetSegmentsData_trip copyWith({
    GGetSegmentsData_trip_topology? topology,
    String? G__typename,
  }) {
    return GGetSegmentsData_trip(
      topology: topology ?? this.topology,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetSegmentsData_trip &&
            topology == other.topology &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, topology, G__typename);
  }

  @override
  String toString() {
    return 'GGetSegmentsData_trip(topology: $topology, G__typename: $G__typename)';
  }
}

class GGetSegmentsData_trip_topology {
  const GGetSegmentsData_trip_topology({
    required this.segments,
    this.G__typename = 'TopologyType',
  });

  factory GGetSegmentsData_trip_topology.fromJson(Map<String, dynamic> json) {
    return GGetSegmentsData_trip_topology(
      segments: (json['segments'] as List<dynamic>)
          .map(
            (_$e) =>
                _i1.GSegmentFieldsData.fromJson((_$e as Map<String, dynamic>)),
          )
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<_i1.GSegmentFieldsData> segments;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['segments'] = this.segments.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetSegmentsData_trip_topology copyWith({
    List<_i1.GSegmentFieldsData>? segments,
    String? G__typename,
  }) {
    return GGetSegmentsData_trip_topology(
      segments: segments ?? this.segments,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetSegmentsData_trip_topology &&
            _gqlUtils.listEquals(segments, other.segments) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(segments), G__typename);
  }

  @override
  String toString() {
    return 'GGetSegmentsData_trip_topology(segments: $segments, G__typename: $G__typename)';
  }
}
