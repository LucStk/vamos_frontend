// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/src/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:api_client/src/graphql/fragments/__generated__/trip.data.gql.dart'
    as _i1;

class GCreateTripData {
  const GCreateTripData({
    required this.createTrip,
    this.G__typename = 'Mutation',
  });

  factory GCreateTripData.fromJson(Map<String, dynamic> json) {
    return GCreateTripData(
      createTrip: GCreateTripData_createTrip.fromJson(
          (json['createTrip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GCreateTripData_createTrip createTrip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['createTrip'] = this.createTrip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateTripData copyWith({
    GCreateTripData_createTrip? createTrip,
    String? G__typename,
  }) {
    return GCreateTripData(
      createTrip: createTrip ?? this.createTrip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateTripData &&
            createTrip == other.createTrip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, createTrip, G__typename);
  }

  @override
  String toString() {
    return 'GCreateTripData(createTrip: $createTrip, G__typename: $G__typename)';
  }
}

class GCreateTripData_createTrip implements _i1.GTripFields {
  const GCreateTripData_createTrip({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    required this.imageUrls,
    this.G__typename = 'TripType',
    required this.waypoints,
    required this.segments,
  });

  factory GCreateTripData_createTrip.fromJson(Map<String, dynamic> json) {
    return GCreateTripData_createTrip(
      id: (json['id'] as String),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      imageUrls: List<String>.from((json['imageUrls'] as List<dynamic>)),
      G__typename: (json['__typename'] as String),
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

  final String id;

  final String title;

  final String? date;

  final String description;

  final List<String> imageUrls;

  final String G__typename;

  final List<_i1.GWaypointFieldsData> waypoints;

  final List<_i1.GSegmentFieldsData> segments;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['title'] = this.title;
    final _$dateValue = this.date;
    _$result['date'] = _$dateValue == null ? null : _$dateValue;
    _$result['description'] = this.description;
    _$result['imageUrls'] = this.imageUrls.map((_$e) => _$e).toList();
    _$result['__typename'] = this.G__typename;
    _$result['waypoints'] = this.waypoints.map((_$e) => _$e.toJson()).toList();
    _$result['segments'] = this.segments.map((_$e) => _$e.toJson()).toList();
    return _$result;
  }

  GCreateTripData_createTrip copyWith({
    String? id,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    List<String>? imageUrls,
    String? G__typename,
    List<_i1.GWaypointFieldsData>? waypoints,
    List<_i1.GSegmentFieldsData>? segments,
  }) {
    return GCreateTripData_createTrip(
      id: id ?? this.id,
      title: title ?? this.title,
      date: dateIsSet ? date : this.date,
      description: description ?? this.description,
      imageUrls: imageUrls ?? this.imageUrls,
      G__typename: G__typename ?? this.G__typename,
      waypoints: waypoints ?? this.waypoints,
      segments: segments ?? this.segments,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateTripData_createTrip &&
            id == other.id &&
            title == other.title &&
            date == other.date &&
            description == other.description &&
            _gqlUtils.listEquals(imageUrls, other.imageUrls) &&
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
        _gqlUtils.listHash(imageUrls),
        G__typename,
        _gqlUtils.listHash(waypoints),
        _gqlUtils.listHash(segments));
  }

  @override
  String toString() {
    return 'GCreateTripData_createTrip(id: $id, title: $title, date: $date, description: $description, imageUrls: $imageUrls, G__typename: $G__typename, waypoints: $waypoints, segments: $segments)';
  }
}

class GUpdateTripData {
  const GUpdateTripData({
    required this.updateTrip,
    this.G__typename = 'Mutation',
  });

  factory GUpdateTripData.fromJson(Map<String, dynamic> json) {
    return GUpdateTripData(
      updateTrip: GUpdateTripData_updateTrip.fromJson(
          (json['updateTrip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GUpdateTripData_updateTrip updateTrip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['updateTrip'] = this.updateTrip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUpdateTripData copyWith({
    GUpdateTripData_updateTrip? updateTrip,
    String? G__typename,
  }) {
    return GUpdateTripData(
      updateTrip: updateTrip ?? this.updateTrip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUpdateTripData &&
            updateTrip == other.updateTrip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, updateTrip, G__typename);
  }

  @override
  String toString() {
    return 'GUpdateTripData(updateTrip: $updateTrip, G__typename: $G__typename)';
  }
}

class GUpdateTripData_updateTrip implements _i1.GTripFields {
  const GUpdateTripData_updateTrip({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    required this.imageUrls,
    this.G__typename = 'TripType',
    required this.waypoints,
    required this.segments,
  });

  factory GUpdateTripData_updateTrip.fromJson(Map<String, dynamic> json) {
    return GUpdateTripData_updateTrip(
      id: (json['id'] as String),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      imageUrls: List<String>.from((json['imageUrls'] as List<dynamic>)),
      G__typename: (json['__typename'] as String),
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

  final String id;

  final String title;

  final String? date;

  final String description;

  final List<String> imageUrls;

  final String G__typename;

  final List<_i1.GWaypointFieldsData> waypoints;

  final List<_i1.GSegmentFieldsData> segments;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['title'] = this.title;
    final _$dateValue = this.date;
    _$result['date'] = _$dateValue == null ? null : _$dateValue;
    _$result['description'] = this.description;
    _$result['imageUrls'] = this.imageUrls.map((_$e) => _$e).toList();
    _$result['__typename'] = this.G__typename;
    _$result['waypoints'] = this.waypoints.map((_$e) => _$e.toJson()).toList();
    _$result['segments'] = this.segments.map((_$e) => _$e.toJson()).toList();
    return _$result;
  }

  GUpdateTripData_updateTrip copyWith({
    String? id,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    List<String>? imageUrls,
    String? G__typename,
    List<_i1.GWaypointFieldsData>? waypoints,
    List<_i1.GSegmentFieldsData>? segments,
  }) {
    return GUpdateTripData_updateTrip(
      id: id ?? this.id,
      title: title ?? this.title,
      date: dateIsSet ? date : this.date,
      description: description ?? this.description,
      imageUrls: imageUrls ?? this.imageUrls,
      G__typename: G__typename ?? this.G__typename,
      waypoints: waypoints ?? this.waypoints,
      segments: segments ?? this.segments,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUpdateTripData_updateTrip &&
            id == other.id &&
            title == other.title &&
            date == other.date &&
            description == other.description &&
            _gqlUtils.listEquals(imageUrls, other.imageUrls) &&
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
        _gqlUtils.listHash(imageUrls),
        G__typename,
        _gqlUtils.listHash(waypoints),
        _gqlUtils.listHash(segments));
  }

  @override
  String toString() {
    return 'GUpdateTripData_updateTrip(id: $id, title: $title, date: $date, description: $description, imageUrls: $imageUrls, G__typename: $G__typename, waypoints: $waypoints, segments: $segments)';
  }
}

class GDeleteTripData {
  const GDeleteTripData({
    required this.deleteTrip,
    this.G__typename = 'Mutation',
  });

  factory GDeleteTripData.fromJson(Map<String, dynamic> json) {
    return GDeleteTripData(
      deleteTrip: (json['deleteTrip'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String deleteTrip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['deleteTrip'] = this.deleteTrip;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDeleteTripData copyWith({
    String? deleteTrip,
    String? G__typename,
  }) {
    return GDeleteTripData(
      deleteTrip: deleteTrip ?? this.deleteTrip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteTripData &&
            deleteTrip == other.deleteTrip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, deleteTrip, G__typename);
  }

  @override
  String toString() {
    return 'GDeleteTripData(deleteTrip: $deleteTrip, G__typename: $G__typename)';
  }
}
