// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/core/graphql/media/__generated__/image_fields.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/core/graphql/topology/fields/__generated__/segment_fields.data.gql.dart'
    as _i5;
import 'package:vamos_cartographie/core/graphql/topology/fields/__generated__/vertex_fields.data.gql.dart'
    as _i4;
import 'package:vamos_cartographie/core/graphql/trips/__generated__/trip_fields.data.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/waypoints/__generated__/waypoint_fields.data.gql.dart'
    as _i3;

class GGetAllTripsData {
  const GGetAllTripsData({
    required this.trips,
    this.G__typename = 'Query',
  });

  factory GGetAllTripsData.fromJson(Map<String, dynamic> json) {
    return GGetAllTripsData(
      trips: (json['trips'] as List<dynamic>)
          .map((_$e) =>
              _i1.GTripFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<_i1.GTripFieldsData> trips;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['trips'] = this.trips.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetAllTripsData copyWith({
    List<_i1.GTripFieldsData>? trips,
    String? G__typename,
  }) {
    return GGetAllTripsData(
      trips: trips ?? this.trips,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetAllTripsData &&
            _gqlUtils.listEquals(trips, other.trips) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(trips), G__typename);
  }

  @override
  String toString() {
    return 'GGetAllTripsData(trips: $trips, G__typename: $G__typename)';
  }
}

class GGetTripData {
  const GGetTripData({
    required this.trip,
    this.G__typename = 'Query',
  });

  factory GGetTripData.fromJson(Map<String, dynamic> json) {
    return GGetTripData(
      trip:
          _i1.GTripFieldsData.fromJson((json['trip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GTripFieldsData trip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['trip'] = this.trip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetTripData copyWith({
    _i1.GTripFieldsData? trip,
    String? G__typename,
  }) {
    return GGetTripData(
      trip: trip ?? this.trip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripData &&
            trip == other.trip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, trip, G__typename);
  }

  @override
  String toString() {
    return 'GGetTripData(trip: $trip, G__typename: $G__typename)';
  }
}

class GGetTripDetailsData {
  const GGetTripDetailsData({
    required this.trip,
    this.G__typename = 'Query',
  });

  factory GGetTripDetailsData.fromJson(Map<String, dynamic> json) {
    return GGetTripDetailsData(
      trip: GGetTripDetailsData_trip.fromJson(
          (json['trip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GGetTripDetailsData_trip trip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['trip'] = this.trip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetTripDetailsData copyWith({
    GGetTripDetailsData_trip? trip,
    String? G__typename,
  }) {
    return GGetTripDetailsData(
      trip: trip ?? this.trip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripDetailsData &&
            trip == other.trip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, trip, G__typename);
  }

  @override
  String toString() {
    return 'GGetTripDetailsData(trip: $trip, G__typename: $G__typename)';
  }
}

class GGetTripDetailsData_trip implements _i1.GTripFields {
  const GGetTripDetailsData_trip({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    required this.images,
    this.G__typename = 'TripType',
    required this.waypoints,
    required this.topology,
  });

  factory GGetTripDetailsData_trip.fromJson(Map<String, dynamic> json) {
    return GGetTripDetailsData_trip(
      id: (json['id'] as String),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      images: (json['images'] as List<dynamic>)
          .map((_$e) =>
              _i2.GImageFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
      waypoints: (json['waypoints'] as List<dynamic>)
          .map((_$e) =>
              _i3.GWaypointFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      topology: GGetTripDetailsData_trip_topology.fromJson(
          (json['topology'] as Map<String, dynamic>)),
    );
  }

  final String id;

  final String title;

  final String? date;

  final String description;

  final List<_i2.GImageFieldsData> images;

  final String G__typename;

  final List<_i3.GWaypointFieldsData> waypoints;

  final GGetTripDetailsData_trip_topology topology;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['title'] = this.title;
    final _$dateValue = this.date;
    _$result['date'] = _$dateValue == null ? null : _$dateValue;
    _$result['description'] = this.description;
    _$result['images'] = this.images.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    _$result['waypoints'] = this.waypoints.map((_$e) => _$e.toJson()).toList();
    _$result['topology'] = this.topology.toJson();
    return _$result;
  }

  GGetTripDetailsData_trip copyWith({
    String? id,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    List<_i2.GImageFieldsData>? images,
    String? G__typename,
    List<_i3.GWaypointFieldsData>? waypoints,
    GGetTripDetailsData_trip_topology? topology,
  }) {
    return GGetTripDetailsData_trip(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date != null || dateIsSet ? date : this.date,
      description: description ?? this.description,
      images: images ?? this.images,
      G__typename: G__typename ?? this.G__typename,
      waypoints: waypoints ?? this.waypoints,
      topology: topology ?? this.topology,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripDetailsData_trip &&
            id == other.id &&
            title == other.title &&
            date == other.date &&
            description == other.description &&
            _gqlUtils.listEquals(images, other.images) &&
            G__typename == other.G__typename &&
            _gqlUtils.listEquals(waypoints, other.waypoints) &&
            topology == other.topology);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        title,
        date,
        description,
        _gqlUtils.listHash(images),
        G__typename,
        _gqlUtils.listHash(waypoints),
        topology);
  }

  @override
  String toString() {
    return 'GGetTripDetailsData_trip(id: $id, title: $title, date: $date, description: $description, images: $images, G__typename: $G__typename, waypoints: $waypoints, topology: $topology)';
  }
}

class GGetTripDetailsData_trip_topology {
  const GGetTripDetailsData_trip_topology({
    required this.vertices,
    required this.segments,
    this.G__typename = 'TopologyType',
  });

  factory GGetTripDetailsData_trip_topology.fromJson(
      Map<String, dynamic> json) {
    return GGetTripDetailsData_trip_topology(
      vertices: (json['vertices'] as List<dynamic>)
          .map((_$e) =>
              _i4.GVertexFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      segments: (json['segments'] as List<dynamic>)
          .map((_$e) =>
              _i5.GSegmentFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<_i4.GVertexFieldsData> vertices;

  final List<_i5.GSegmentFieldsData> segments;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['vertices'] = this.vertices.map((_$e) => _$e.toJson()).toList();
    _$result['segments'] = this.segments.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetTripDetailsData_trip_topology copyWith({
    List<_i4.GVertexFieldsData>? vertices,
    List<_i5.GSegmentFieldsData>? segments,
    String? G__typename,
  }) {
    return GGetTripDetailsData_trip_topology(
      vertices: vertices ?? this.vertices,
      segments: segments ?? this.segments,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripDetailsData_trip_topology &&
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
    return 'GGetTripDetailsData_trip_topology(vertices: $vertices, segments: $segments, G__typename: $G__typename)';
  }
}
