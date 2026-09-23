// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/stored_file/data/graphql/__generated__/file_storage_fields.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/trip/data/graphql/__generated__/trip_fields.data.gql.dart'
    as _i1;
import 'package:vamos_cartographie/waypoint/data/graphql/__generated__/waypoint_fields.data.gql.dart'
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
              GGetAllTripsData_trips.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<GGetAllTripsData_trips> trips;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['trips'] = this.trips.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetAllTripsData copyWith({
    List<GGetAllTripsData_trips>? trips,
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

class GGetAllTripsData_trips implements _i1.GTripFields {
  const GGetAllTripsData_trips({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    required this.files,
    this.G__typename = 'TripType',
    required this.topology,
  });

  factory GGetAllTripsData_trips.fromJson(Map<String, dynamic> json) {
    return GGetAllTripsData_trips(
      id: (json['id'] as String),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      files: (json['files'] as List<dynamic>)
          .map((_$e) =>
              _i2.GFileAttachmentData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
      topology: _i1.GTopologyFieldsData.fromJson(
          (json['topology'] as Map<String, dynamic>)),
    );
  }

  final String id;

  final String title;

  final String? date;

  final String description;

  final List<_i2.GFileAttachmentData> files;

  final String G__typename;

  final _i1.GTopologyFieldsData topology;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['title'] = this.title;
    final _$dateValue = this.date;
    _$result['date'] = _$dateValue == null ? null : _$dateValue;
    _$result['description'] = this.description;
    _$result['files'] = this.files.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    _$result['topology'] = this.topology.toJson();
    return _$result;
  }

  GGetAllTripsData_trips copyWith({
    String? id,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    List<_i2.GFileAttachmentData>? files,
    String? G__typename,
    _i1.GTopologyFieldsData? topology,
  }) {
    return GGetAllTripsData_trips(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date != null || dateIsSet ? date : this.date,
      description: description ?? this.description,
      files: files ?? this.files,
      G__typename: G__typename ?? this.G__typename,
      topology: topology ?? this.topology,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetAllTripsData_trips &&
            id == other.id &&
            title == other.title &&
            date == other.date &&
            description == other.description &&
            _gqlUtils.listEquals(files, other.files) &&
            G__typename == other.G__typename &&
            topology == other.topology);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, title, date, description,
        _gqlUtils.listHash(files), G__typename, topology);
  }

  @override
  String toString() {
    return 'GGetAllTripsData_trips(id: $id, title: $title, date: $date, description: $description, files: $files, G__typename: $G__typename, topology: $topology)';
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
    required this.files,
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
      files: (json['files'] as List<dynamic>)
          .map((_$e) =>
              _i2.GFileAttachmentData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
      waypoints: (json['waypoints'] as List<dynamic>)
          .map((_$e) =>
              _i3.GWaypointFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      topology: _i1.GTopologyFieldsData.fromJson(
          (json['topology'] as Map<String, dynamic>)),
    );
  }

  final String id;

  final String title;

  final String? date;

  final String description;

  final List<_i2.GFileAttachmentData> files;

  final String G__typename;

  final List<_i3.GWaypointFieldsData> waypoints;

  final _i1.GTopologyFieldsData topology;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['title'] = this.title;
    final _$dateValue = this.date;
    _$result['date'] = _$dateValue == null ? null : _$dateValue;
    _$result['description'] = this.description;
    _$result['files'] = this.files.map((_$e) => _$e.toJson()).toList();
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
    List<_i2.GFileAttachmentData>? files,
    String? G__typename,
    List<_i3.GWaypointFieldsData>? waypoints,
    _i1.GTopologyFieldsData? topology,
  }) {
    return GGetTripDetailsData_trip(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date != null || dateIsSet ? date : this.date,
      description: description ?? this.description,
      files: files ?? this.files,
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
            _gqlUtils.listEquals(files, other.files) &&
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
        _gqlUtils.listHash(files),
        G__typename,
        _gqlUtils.listHash(waypoints),
        topology);
  }

  @override
  String toString() {
    return 'GGetTripDetailsData_trip(id: $id, title: $title, date: $date, description: $description, files: $files, G__typename: $G__typename, waypoints: $waypoints, topology: $topology)';
  }
}
