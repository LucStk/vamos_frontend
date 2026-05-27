// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/graphql/media/fragments/__generated__/image_fields.data.gql.dart'
    as _i4;
import 'package:vamos_cartographie/graphql/segments/fragments/__generated__/segment_fields.data.gql.dart'
    as _i3;
import 'package:vamos_cartographie/graphql/trips/fragments/__generated__/trip_fields.data.gql.dart'
    as _i1;
import 'package:vamos_cartographie/graphql/waypoints/fragments/__generated__/waypoint_fields.data.gql.dart'
    as _i2;

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
      trip: GGetTripData_trip.fromJson((json['trip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GGetTripData_trip trip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['trip'] = this.trip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetTripData copyWith({
    GGetTripData_trip? trip,
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

class GGetTripData_trip implements _i1.GTripFields {
  const GGetTripData_trip({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    required this.images,
    this.G__typename = 'TripType',
    required this.waypoints,
    required this.segments,
  });

  factory GGetTripData_trip.fromJson(Map<String, dynamic> json) {
    return GGetTripData_trip(
      id: (json['id'] as int),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      images: (json['images'] as List<dynamic>)
          .map((_$e) =>
              GGetTripData_trip_images.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
      waypoints: (json['waypoints'] as List<dynamic>)
          .map((_$e) =>
              _i2.GWaypointFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      segments: (json['segments'] as List<dynamic>)
          .map((_$e) =>
              _i3.GSegmentFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
    );
  }

  final int id;

  final String title;

  final String? date;

  final String description;

  final List<GGetTripData_trip_images> images;

  final String G__typename;

  final List<_i2.GWaypointFieldsData> waypoints;

  final List<_i3.GSegmentFieldsData> segments;

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
    _$result['segments'] = this.segments.map((_$e) => _$e.toJson()).toList();
    return _$result;
  }

  GGetTripData_trip copyWith({
    int? id,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    List<GGetTripData_trip_images>? images,
    String? G__typename,
    List<_i2.GWaypointFieldsData>? waypoints,
    List<_i3.GSegmentFieldsData>? segments,
  }) {
    return GGetTripData_trip(
      id: id ?? this.id,
      title: title ?? this.title,
      date: dateIsSet ? date : this.date,
      description: description ?? this.description,
      images: images ?? this.images,
      G__typename: G__typename ?? this.G__typename,
      waypoints: waypoints ?? this.waypoints,
      segments: segments ?? this.segments,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripData_trip &&
            id == other.id &&
            title == other.title &&
            date == other.date &&
            description == other.description &&
            _gqlUtils.listEquals(images, other.images) &&
            G__typename == other.G__typename &&
            _gqlUtils.listEquals(waypoints, other.waypoints) &&
            _gqlUtils.listEquals(segments, other.segments));
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
        _gqlUtils.listHash(segments));
  }

  @override
  String toString() {
    return 'GGetTripData_trip(id: $id, title: $title, date: $date, description: $description, images: $images, G__typename: $G__typename, waypoints: $waypoints, segments: $segments)';
  }
}

class GGetTripData_trip_images implements _i1.GTripFields_images {
  const GGetTripData_trip_images({
    required this.image,
    this.G__typename = 'TripImageType',
  });

  factory GGetTripData_trip_images.fromJson(Map<String, dynamic> json) {
    return GGetTripData_trip_images(
      image: _i4.GImageFieldsData.fromJson(
          (json['image'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i4.GImageFieldsData image;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['image'] = this.image.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetTripData_trip_images copyWith({
    _i4.GImageFieldsData? image,
    String? G__typename,
  }) {
    return GGetTripData_trip_images(
      image: image ?? this.image,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripData_trip_images &&
            image == other.image &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, image, G__typename);
  }

  @override
  String toString() {
    return 'GGetTripData_trip_images(image: $image, G__typename: $G__typename)';
  }
}
