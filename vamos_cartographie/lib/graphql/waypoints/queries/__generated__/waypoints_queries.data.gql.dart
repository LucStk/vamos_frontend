// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/graphql/media/fragments/__generated__/image_fields.data.gql.dart'
    as _i3;
import 'package:vamos_cartographie/graphql/trips/fragments/__generated__/trip_fields.data.gql.dart'
    as _i1;
import 'package:vamos_cartographie/graphql/waypoints/fragments/__generated__/waypoint_fields.data.gql.dart'
    as _i2;

class GGetWaypointsData {
  const GGetWaypointsData({required this.trip, this.G__typename = 'Query'});

  factory GGetWaypointsData.fromJson(Map<String, dynamic> json) {
    return GGetWaypointsData(
      trip: GGetWaypointsData_trip.fromJson(
        (json['trip'] as Map<String, dynamic>),
      ),
      G__typename: (json['__typename'] as String),
    );
  }

  final GGetWaypointsData_trip trip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['trip'] = this.trip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetWaypointsData copyWith({
    GGetWaypointsData_trip? trip,
    String? G__typename,
  }) {
    return GGetWaypointsData(
      trip: trip ?? this.trip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetWaypointsData &&
            trip == other.trip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, trip, G__typename);
  }

  @override
  String toString() {
    return 'GGetWaypointsData(trip: $trip, G__typename: $G__typename)';
  }
}

class GGetWaypointsData_trip implements _i1.GTripFields {
  const GGetWaypointsData_trip({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    required this.images,
    this.G__typename = 'TripType',
    required this.waypoints,
  });

  factory GGetWaypointsData_trip.fromJson(Map<String, dynamic> json) {
    return GGetWaypointsData_trip(
      id: (json['id'] as int),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      images: (json['images'] as List<dynamic>)
          .map(
            (_$e) => GGetWaypointsData_trip_images.fromJson(
              (_$e as Map<String, dynamic>),
            ),
          )
          .toList(),
      G__typename: (json['__typename'] as String),
      waypoints: (json['waypoints'] as List<dynamic>)
          .map(
            (_$e) =>
                _i2.GWaypointFieldsData.fromJson((_$e as Map<String, dynamic>)),
          )
          .toList(),
    );
  }

  final int id;

  final String title;

  final String? date;

  final String description;

  final List<GGetWaypointsData_trip_images> images;

  final String G__typename;

  final List<_i2.GWaypointFieldsData> waypoints;

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
    return _$result;
  }

  GGetWaypointsData_trip copyWith({
    int? id,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    List<GGetWaypointsData_trip_images>? images,
    String? G__typename,
    List<_i2.GWaypointFieldsData>? waypoints,
  }) {
    return GGetWaypointsData_trip(
      id: id ?? this.id,
      title: title ?? this.title,
      date: dateIsSet ? date : this.date,
      description: description ?? this.description,
      images: images ?? this.images,
      G__typename: G__typename ?? this.G__typename,
      waypoints: waypoints ?? this.waypoints,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetWaypointsData_trip &&
            id == other.id &&
            title == other.title &&
            date == other.date &&
            description == other.description &&
            _gqlUtils.listEquals(images, other.images) &&
            G__typename == other.G__typename &&
            _gqlUtils.listEquals(waypoints, other.waypoints));
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
    );
  }

  @override
  String toString() {
    return 'GGetWaypointsData_trip(id: $id, title: $title, date: $date, description: $description, images: $images, G__typename: $G__typename, waypoints: $waypoints)';
  }
}

class GGetWaypointsData_trip_images implements _i1.GTripFields_images {
  const GGetWaypointsData_trip_images({
    required this.image,
    this.G__typename = 'TripImageType',
  });

  factory GGetWaypointsData_trip_images.fromJson(Map<String, dynamic> json) {
    return GGetWaypointsData_trip_images(
      image: _i3.GImageFieldsData.fromJson(
        (json['image'] as Map<String, dynamic>),
      ),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i3.GImageFieldsData image;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['image'] = this.image.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetWaypointsData_trip_images copyWith({
    _i3.GImageFieldsData? image,
    String? G__typename,
  }) {
    return GGetWaypointsData_trip_images(
      image: image ?? this.image,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetWaypointsData_trip_images &&
            image == other.image &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, image, G__typename);
  }

  @override
  String toString() {
    return 'GGetWaypointsData_trip_images(image: $image, G__typename: $G__typename)';
  }
}
