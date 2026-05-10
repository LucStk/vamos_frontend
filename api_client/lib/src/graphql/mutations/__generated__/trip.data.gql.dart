// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/src/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:api_client/src/graphql/fragments/__generated__/trip.data.gql.dart'
    as _i1;

class GCreateTripData {
  const GCreateTripData({
    this.createTrip,
    this.G__typename = 'CartoMutation',
  });

  factory GCreateTripData.fromJson(Map<String, dynamic> json) {
    return GCreateTripData(
      createTrip: json['createTrip'] == null
          ? null
          : GCreateTripData_createTrip.fromJson(
              (json['createTrip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GCreateTripData_createTrip? createTrip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$createTripValue = this.createTrip;
    _$result['createTrip'] =
        _$createTripValue == null ? null : _$createTripValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateTripData copyWith({
    GCreateTripData_createTrip? createTrip,
    bool createTripIsSet = false,
    String? G__typename,
  }) {
    return GCreateTripData(
      createTrip: createTripIsSet ? createTrip : this.createTrip,
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

class GCreateTripData_createTrip {
  const GCreateTripData_createTrip({
    this.clientMutationId,
    required this.trip,
    this.G__typename = 'CreateTripPayload',
  });

  factory GCreateTripData_createTrip.fromJson(Map<String, dynamic> json) {
    return GCreateTripData_createTrip(
      clientMutationId: json['clientMutationId'] == null
          ? null
          : (json['clientMutationId'] as String),
      trip: GCreateTripData_createTrip_trip.fromJson(
          (json['trip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String? clientMutationId;

  final GCreateTripData_createTrip_trip trip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$clientMutationIdValue = this.clientMutationId;
    _$result['clientMutationId'] =
        _$clientMutationIdValue == null ? null : _$clientMutationIdValue;
    _$result['trip'] = this.trip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateTripData_createTrip copyWith({
    String? clientMutationId,
    bool clientMutationIdIsSet = false,
    GCreateTripData_createTrip_trip? trip,
    String? G__typename,
  }) {
    return GCreateTripData_createTrip(
      clientMutationId:
          clientMutationIdIsSet ? clientMutationId : this.clientMutationId,
      trip: trip ?? this.trip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateTripData_createTrip &&
            clientMutationId == other.clientMutationId &&
            trip == other.trip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, clientMutationId, trip, G__typename);
  }

  @override
  String toString() {
    return 'GCreateTripData_createTrip(clientMutationId: $clientMutationId, trip: $trip, G__typename: $G__typename)';
  }
}

class GCreateTripData_createTrip_trip implements _i1.GTripFields {
  const GCreateTripData_createTrip_trip({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    required this.imageUrls,
    this.G__typename = 'TripNode',
    required this.waypoints,
    required this.segments,
  });

  factory GCreateTripData_createTrip_trip.fromJson(Map<String, dynamic> json) {
    return GCreateTripData_createTrip_trip(
      id: (json['id'] as String),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      imageUrls: (json['imageUrls'] as Object),
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

  final Object imageUrls;

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
    _$result['imageUrls'] = this.imageUrls;
    _$result['__typename'] = this.G__typename;
    _$result['waypoints'] = this.waypoints.map((_$e) => _$e.toJson()).toList();
    _$result['segments'] = this.segments.map((_$e) => _$e.toJson()).toList();
    return _$result;
  }

  GCreateTripData_createTrip_trip copyWith({
    String? id,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    Object? imageUrls,
    String? G__typename,
    List<_i1.GWaypointFieldsData>? waypoints,
    List<_i1.GSegmentFieldsData>? segments,
  }) {
    return GCreateTripData_createTrip_trip(
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
        (other is GCreateTripData_createTrip_trip &&
            id == other.id &&
            title == other.title &&
            date == other.date &&
            description == other.description &&
            imageUrls == other.imageUrls &&
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
        imageUrls,
        G__typename,
        _gqlUtils.listHash(waypoints),
        _gqlUtils.listHash(segments));
  }

  @override
  String toString() {
    return 'GCreateTripData_createTrip_trip(id: $id, title: $title, date: $date, description: $description, imageUrls: $imageUrls, G__typename: $G__typename, waypoints: $waypoints, segments: $segments)';
  }
}

class GUpdateTripData {
  const GUpdateTripData({
    this.updateTrip,
    this.G__typename = 'CartoMutation',
  });

  factory GUpdateTripData.fromJson(Map<String, dynamic> json) {
    return GUpdateTripData(
      updateTrip: json['updateTrip'] == null
          ? null
          : GUpdateTripData_updateTrip.fromJson(
              (json['updateTrip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GUpdateTripData_updateTrip? updateTrip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$updateTripValue = this.updateTrip;
    _$result['updateTrip'] =
        _$updateTripValue == null ? null : _$updateTripValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUpdateTripData copyWith({
    GUpdateTripData_updateTrip? updateTrip,
    bool updateTripIsSet = false,
    String? G__typename,
  }) {
    return GUpdateTripData(
      updateTrip: updateTripIsSet ? updateTrip : this.updateTrip,
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

class GUpdateTripData_updateTrip {
  const GUpdateTripData_updateTrip({
    this.clientMutationId,
    required this.trip,
    this.G__typename = 'UpdateTripPayload',
  });

  factory GUpdateTripData_updateTrip.fromJson(Map<String, dynamic> json) {
    return GUpdateTripData_updateTrip(
      clientMutationId: json['clientMutationId'] == null
          ? null
          : (json['clientMutationId'] as String),
      trip: GUpdateTripData_updateTrip_trip.fromJson(
          (json['trip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String? clientMutationId;

  final GUpdateTripData_updateTrip_trip trip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$clientMutationIdValue = this.clientMutationId;
    _$result['clientMutationId'] =
        _$clientMutationIdValue == null ? null : _$clientMutationIdValue;
    _$result['trip'] = this.trip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUpdateTripData_updateTrip copyWith({
    String? clientMutationId,
    bool clientMutationIdIsSet = false,
    GUpdateTripData_updateTrip_trip? trip,
    String? G__typename,
  }) {
    return GUpdateTripData_updateTrip(
      clientMutationId:
          clientMutationIdIsSet ? clientMutationId : this.clientMutationId,
      trip: trip ?? this.trip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUpdateTripData_updateTrip &&
            clientMutationId == other.clientMutationId &&
            trip == other.trip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, clientMutationId, trip, G__typename);
  }

  @override
  String toString() {
    return 'GUpdateTripData_updateTrip(clientMutationId: $clientMutationId, trip: $trip, G__typename: $G__typename)';
  }
}

class GUpdateTripData_updateTrip_trip implements _i1.GTripFields {
  const GUpdateTripData_updateTrip_trip({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    required this.imageUrls,
    this.G__typename = 'TripNode',
    required this.waypoints,
    required this.segments,
  });

  factory GUpdateTripData_updateTrip_trip.fromJson(Map<String, dynamic> json) {
    return GUpdateTripData_updateTrip_trip(
      id: (json['id'] as String),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      imageUrls: (json['imageUrls'] as Object),
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

  final Object imageUrls;

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
    _$result['imageUrls'] = this.imageUrls;
    _$result['__typename'] = this.G__typename;
    _$result['waypoints'] = this.waypoints.map((_$e) => _$e.toJson()).toList();
    _$result['segments'] = this.segments.map((_$e) => _$e.toJson()).toList();
    return _$result;
  }

  GUpdateTripData_updateTrip_trip copyWith({
    String? id,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    Object? imageUrls,
    String? G__typename,
    List<_i1.GWaypointFieldsData>? waypoints,
    List<_i1.GSegmentFieldsData>? segments,
  }) {
    return GUpdateTripData_updateTrip_trip(
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
        (other is GUpdateTripData_updateTrip_trip &&
            id == other.id &&
            title == other.title &&
            date == other.date &&
            description == other.description &&
            imageUrls == other.imageUrls &&
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
        imageUrls,
        G__typename,
        _gqlUtils.listHash(waypoints),
        _gqlUtils.listHash(segments));
  }

  @override
  String toString() {
    return 'GUpdateTripData_updateTrip_trip(id: $id, title: $title, date: $date, description: $description, imageUrls: $imageUrls, G__typename: $G__typename, waypoints: $waypoints, segments: $segments)';
  }
}

class GDeleteTripData {
  const GDeleteTripData({
    this.deleteTrip,
    this.G__typename = 'CartoMutation',
  });

  factory GDeleteTripData.fromJson(Map<String, dynamic> json) {
    return GDeleteTripData(
      deleteTrip: json['deleteTrip'] == null
          ? null
          : GDeleteTripData_deleteTrip.fromJson(
              (json['deleteTrip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GDeleteTripData_deleteTrip? deleteTrip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$deleteTripValue = this.deleteTrip;
    _$result['deleteTrip'] =
        _$deleteTripValue == null ? null : _$deleteTripValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDeleteTripData copyWith({
    GDeleteTripData_deleteTrip? deleteTrip,
    bool deleteTripIsSet = false,
    String? G__typename,
  }) {
    return GDeleteTripData(
      deleteTrip: deleteTripIsSet ? deleteTrip : this.deleteTrip,
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

class GDeleteTripData_deleteTrip {
  const GDeleteTripData_deleteTrip({
    this.clientMutationId,
    required this.deletedId,
    this.G__typename = 'DeleteTripPayload',
  });

  factory GDeleteTripData_deleteTrip.fromJson(Map<String, dynamic> json) {
    return GDeleteTripData_deleteTrip(
      clientMutationId: json['clientMutationId'] == null
          ? null
          : (json['clientMutationId'] as String),
      deletedId: (json['deletedId'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String? clientMutationId;

  final String deletedId;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$clientMutationIdValue = this.clientMutationId;
    _$result['clientMutationId'] =
        _$clientMutationIdValue == null ? null : _$clientMutationIdValue;
    _$result['deletedId'] = this.deletedId;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDeleteTripData_deleteTrip copyWith({
    String? clientMutationId,
    bool clientMutationIdIsSet = false,
    String? deletedId,
    String? G__typename,
  }) {
    return GDeleteTripData_deleteTrip(
      clientMutationId:
          clientMutationIdIsSet ? clientMutationId : this.clientMutationId,
      deletedId: deletedId ?? this.deletedId,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteTripData_deleteTrip &&
            clientMutationId == other.clientMutationId &&
            deletedId == other.deletedId &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, clientMutationId, deletedId, G__typename);
  }

  @override
  String toString() {
    return 'GDeleteTripData_deleteTrip(clientMutationId: $clientMutationId, deletedId: $deletedId, G__typename: $G__typename)';
  }
}
