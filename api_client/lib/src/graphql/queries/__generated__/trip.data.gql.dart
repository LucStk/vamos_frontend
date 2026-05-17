// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/src/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:api_client/src/graphql/fragments/__generated__/trip.data.gql.dart'
    as _i1;

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
    required this.node,
    this.G__typename = 'Query',
  });

  factory GGetTripData.fromJson(Map<String, dynamic> json) {
    return GGetTripData(
      node: GGetTripData_node.fromJson((json['node'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GGetTripData_node node;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['node'] = this.node.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetTripData copyWith({
    GGetTripData_node? node,
    String? G__typename,
  }) {
    return GGetTripData(
      node: node ?? this.node,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripData &&
            node == other.node &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, node, G__typename);
  }

  @override
  String toString() {
    return 'GGetTripData(node: $node, G__typename: $G__typename)';
  }
}

sealed class GGetTripData_node {
  const GGetTripData_node({
    required this.id,
    required this.G__typename,
  });

  factory GGetTripData_node.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'TripType':
        return GGetTripData_node__asTripType.fromJson(json);
      default:
        return GGetTripData_node__unknown.fromJson(json);
    }
  }

  final String id;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }
}

extension GGetTripData_nodeWhenExtension on GGetTripData_node {
  _T when<_T>({
    required _T Function(GGetTripData_node__asTripType) tripType,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'TripType':
        return tripType(this as GGetTripData_node__asTripType);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GGetTripData_node__asTripType)? tripType,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'TripType':
        return tripType == null
            ? orElse()
            : tripType(this as GGetTripData_node__asTripType);
      default:
        return orElse();
    }
  }
}

class GGetTripData_node__asTripType extends GGetTripData_node
    implements _i1.GTripFields {
  GGetTripData_node__asTripType({
    required String id,
    String G__typename = 'TripType',
    required this.title,
    this.date,
    required this.description,
    required this.images,
    required this.waypoints,
    required this.segments,
  }) : super(id: id, G__typename: G__typename);

  factory GGetTripData_node__asTripType.fromJson(Map<String, dynamic> json) {
    return GGetTripData_node__asTripType(
      id: (json['id'] as String),
      G__typename: (json['__typename'] as String),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      images: (json['images'] as Object),
      waypoints: (json['waypoints'] as List<dynamic>)
          .map((_$e) =>
              _i1.GWaypointFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      segments: (json['segments'] as List<dynamic>)
          .map((_$e) =>
              _i1.GSegmentFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
    );
  }

  final String title;

  final String? date;

  final String description;

  final Object images;

  final List<_i1.GWaypointFieldsData> waypoints;

  final List<_i1.GSegmentFieldsData> segments;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['title'] = this.title;
    final _$dateValue = this.date;
    _$result['date'] = _$dateValue == null ? null : _$dateValue;
    _$result['description'] = this.description;
    _$result['images'] = this.images;
    _$result['waypoints'] = this.waypoints.map((_$e) => _$e.toJson()).toList();
    _$result['segments'] = this.segments.map((_$e) => _$e.toJson()).toList();
    return _$result;
  }

  GGetTripData_node__asTripType copyWith({
    String? id,
    String? G__typename,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    Object? images,
    List<_i1.GWaypointFieldsData>? waypoints,
    List<_i1.GSegmentFieldsData>? segments,
  }) {
    return GGetTripData_node__asTripType(
      id: id ?? this.id,
      G__typename: G__typename ?? this.G__typename,
      title: title ?? this.title,
      date: dateIsSet ? date : this.date,
      description: description ?? this.description,
      images: images ?? this.images,
      waypoints: waypoints ?? this.waypoints,
      segments: segments ?? this.segments,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripData_node__asTripType &&
            id == other.id &&
            G__typename == other.G__typename &&
            title == other.title &&
            date == other.date &&
            description == other.description &&
            images == other.images &&
            _gqlUtils.listEquals(waypoints, other.waypoints) &&
            _gqlUtils.listEquals(segments, other.segments));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, G__typename, title, date, description,
        images, _gqlUtils.listHash(waypoints), _gqlUtils.listHash(segments));
  }

  @override
  String toString() {
    return 'GGetTripData_node__asTripType(id: $id, G__typename: $G__typename, title: $title, date: $date, description: $description, images: $images, waypoints: $waypoints, segments: $segments)';
  }
}

class GGetTripData_node__unknown extends GGetTripData_node {
  GGetTripData_node__unknown({
    required String id,
    required String G__typename,
  }) : super(id: id, G__typename: G__typename);

  factory GGetTripData_node__unknown.fromJson(Map<String, dynamic> json) {
    return GGetTripData_node__unknown(
      id: (json['id'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GGetTripData_node__unknown copyWith({
    String? id,
    String? G__typename,
  }) {
    return GGetTripData_node__unknown(
      id: id ?? this.id,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripData_node__unknown &&
            id == other.id &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, G__typename);
  }

  @override
  String toString() {
    return 'GGetTripData_node__unknown(id: $id, G__typename: $G__typename)';
  }
}
