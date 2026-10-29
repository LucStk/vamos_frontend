// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GAttachFileInput {
  const GAttachFileInput({
    required this.targetType,
    required this.targetId,
    required this.fileId,
  });

  factory GAttachFileInput.fromJson(Map<String, dynamic> json) {
    return GAttachFileInput(
      targetType: GFileTargetTypeEnum.fromJson((json['targetType'] as String)),
      targetId: (json['targetId'] as String),
      fileId: (json['fileId'] as String),
    );
  }

  final GFileTargetTypeEnum targetType;

  final String targetId;

  final String fileId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$targetTypeValue = this.targetType;
    _$result['targetType'] = _$targetTypeValue.toJson();
    final _$targetIdValue = this.targetId;
    _$result['targetId'] = _$targetIdValue;
    final _$fileIdValue = this.fileId;
    _$result['fileId'] = _$fileIdValue;
    return _$result;
  }

  GAttachFileInput copyWith({
    GFileTargetTypeEnum? targetType,
    String? targetId,
    String? fileId,
  }) {
    return GAttachFileInput(
      targetType: targetType ?? this.targetType,
      targetId: targetId ?? this.targetId,
      fileId: fileId ?? this.fileId,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAttachFileInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GAttachFileInput(targetType: $targetType, targetId: $targetId, fileId: $fileId)';
  }
}

enum GCreateProfileErrorCode {
  USERNAME_ALREADY_TAKEN,
  INVALID_USERNAME,
  gUnknownEnumValue;

  static GCreateProfileErrorCode fromJson(String value) {
    switch (value) {
      case r'USERNAME_ALREADY_TAKEN':
        return GCreateProfileErrorCode.USERNAME_ALREADY_TAKEN;
      case r'INVALID_USERNAME':
        return GCreateProfileErrorCode.INVALID_USERNAME;
      default:
        return GCreateProfileErrorCode.gUnknownEnumValue;
    }
  }

  String toJson() {
    switch (this) {
      case GCreateProfileErrorCode.USERNAME_ALREADY_TAKEN:
        return r'USERNAME_ALREADY_TAKEN';
      case GCreateProfileErrorCode.INVALID_USERNAME:
        return r'INVALID_USERNAME';
      case GCreateProfileErrorCode.gUnknownEnumValue:
        return r'gUnknownEnumValue';
    }
  }
}

class GEditRouteInput {
  const GEditRouteInput({
    required this.points,
    this.start = const Value.absent(),
    this.end = const Value.absent(),
    this.mobilityType = const Value.absent(),
    required this.autoRoute,
    this.basedOn = const Value.absent(),
  });

  factory GEditRouteInput.fromJson(Map<String, dynamic> json) {
    return GEditRouteInput(
      points: (json['points'] as List<dynamic>)
          .map((_$e) => GLatLngInput.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      start: json.containsKey('start')
          ? Value.present(json['start'] == null
              ? null
              : GRouteAnchorInput.fromJson(
                  (json['start'] as Map<String, dynamic>)))
          : Value.absent(),
      end: json.containsKey('end')
          ? Value.present(json['end'] == null
              ? null
              : GRouteAnchorInput.fromJson(
                  (json['end'] as Map<String, dynamic>)))
          : Value.absent(),
      mobilityType: json.containsKey('mobilityType')
          ? Value.present(json['mobilityType'] == null
              ? null
              : GMobilityType.fromJson((json['mobilityType'] as String)))
          : Value.absent(),
      autoRoute: (json['autoRoute'] as bool),
      basedOn: json.containsKey('basedOn')
          ? Value.present(
              json['basedOn'] == null ? null : (json['basedOn'] as String))
          : Value.absent(),
    );
  }

  final List<GLatLngInput> points;

  final Value<GRouteAnchorInput> start;

  final Value<GRouteAnchorInput> end;

  final Value<GMobilityType> mobilityType;

  final bool autoRoute;

  final Value<String> basedOn;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$pointsValue = this.points;
    _$result['points'] = _$pointsValue.map((_$e) => _$e.toJson()).toList();
    final _$startValue = this.start;
    if (_$startValue.isPresent) {
      final _$startRequired = _$startValue.requireValue;
      _$result['start'] =
          _$startRequired == null ? null : _$startRequired.toJson();
    }
    final _$endValue = this.end;
    if (_$endValue.isPresent) {
      final _$endRequired = _$endValue.requireValue;
      _$result['end'] = _$endRequired == null ? null : _$endRequired.toJson();
    }
    final _$mobilityTypeValue = this.mobilityType;
    if (_$mobilityTypeValue.isPresent) {
      final _$mobilityTypeRequired = _$mobilityTypeValue.requireValue;
      _$result['mobilityType'] = _$mobilityTypeRequired == null
          ? null
          : _$mobilityTypeRequired.toJson();
    }
    final _$autoRouteValue = this.autoRoute;
    _$result['autoRoute'] = _$autoRouteValue;
    final _$basedOnValue = this.basedOn;
    if (_$basedOnValue.isPresent) {
      final _$basedOnRequired = _$basedOnValue.requireValue;
      _$result['basedOn'] =
          _$basedOnRequired == null ? null : _$basedOnRequired;
    }
    return _$result;
  }

  GEditRouteInput copyWith({
    List<GLatLngInput>? points,
    Value<GRouteAnchorInput>? start,
    Value<GRouteAnchorInput>? end,
    Value<GMobilityType>? mobilityType,
    bool? autoRoute,
    Value<String>? basedOn,
  }) {
    return GEditRouteInput(
      points: points ?? this.points,
      start: start ?? this.start,
      end: end ?? this.end,
      mobilityType: mobilityType ?? this.mobilityType,
      autoRoute: autoRoute ?? this.autoRoute,
      basedOn: basedOn ?? this.basedOn,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GEditRouteInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GEditRouteInput(points: $points, start: $start, end: $end, mobilityType: $mobilityType, autoRoute: $autoRoute, basedOn: $basedOn)';
  }
}

enum GFileTargetTypeEnum {
  TRIP,
  WAYPOINT,
  gUnknownEnumValue;

  static GFileTargetTypeEnum fromJson(String value) {
    switch (value) {
      case r'TRIP':
        return GFileTargetTypeEnum.TRIP;
      case r'WAYPOINT':
        return GFileTargetTypeEnum.WAYPOINT;
      default:
        return GFileTargetTypeEnum.gUnknownEnumValue;
    }
  }

  String toJson() {
    switch (this) {
      case GFileTargetTypeEnum.TRIP:
        return r'TRIP';
      case GFileTargetTypeEnum.WAYPOINT:
        return r'WAYPOINT';
      case GFileTargetTypeEnum.gUnknownEnumValue:
        return r'gUnknownEnumValue';
    }
  }
}

enum GGeometrySource {
  COMPUTED,
  DRAWN,
  gUnknownEnumValue;

  static GGeometrySource fromJson(String value) {
    switch (value) {
      case r'COMPUTED':
        return GGeometrySource.COMPUTED;
      case r'DRAWN':
        return GGeometrySource.DRAWN;
      default:
        return GGeometrySource.gUnknownEnumValue;
    }
  }

  String toJson() {
    switch (this) {
      case GGeometrySource.COMPUTED:
        return r'COMPUTED';
      case GGeometrySource.DRAWN:
        return r'DRAWN';
      case GGeometrySource.gUnknownEnumValue:
        return r'gUnknownEnumValue';
    }
  }
}

class GImageUploadRequest {
  const GImageUploadRequest({
    required this.filename,
    required this.mimeType,
    required this.size,
  });

  factory GImageUploadRequest.fromJson(Map<String, dynamic> json) {
    return GImageUploadRequest(
      filename: (json['filename'] as String),
      mimeType: (json['mimeType'] as String),
      size: (json['size'] as int),
    );
  }

  final String filename;

  final String mimeType;

  final int size;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$filenameValue = this.filename;
    _$result['filename'] = _$filenameValue;
    final _$mimeTypeValue = this.mimeType;
    _$result['mimeType'] = _$mimeTypeValue;
    final _$sizeValue = this.size;
    _$result['size'] = _$sizeValue;
    return _$result;
  }

  GImageUploadRequest copyWith({
    String? filename,
    String? mimeType,
    int? size,
  }) {
    return GImageUploadRequest(
      filename: filename ?? this.filename,
      mimeType: mimeType ?? this.mimeType,
      size: size ?? this.size,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GImageUploadRequest &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GImageUploadRequest(filename: $filename, mimeType: $mimeType, size: $size)';
  }
}

class GLatLngInput {
  const GLatLngInput({
    required this.lat,
    required this.lng,
  });

  factory GLatLngInput.fromJson(Map<String, dynamic> json) {
    return GLatLngInput(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }

  final double lat;

  final double lng;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$latValue = this.lat;
    _$result['lat'] = _$latValue;
    final _$lngValue = this.lng;
    _$result['lng'] = _$lngValue;
    return _$result;
  }

  GLatLngInput copyWith({
    double? lat,
    double? lng,
  }) {
    return GLatLngInput(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GLatLngInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GLatLngInput(lat: $lat, lng: $lng)';
  }
}

enum GMobilityType {
  BIKE,
  CAR,
  BOAT,
  WALK,
  TRAIN,
  gUnknownEnumValue;

  static GMobilityType fromJson(String value) {
    switch (value) {
      case r'BIKE':
        return GMobilityType.BIKE;
      case r'CAR':
        return GMobilityType.CAR;
      case r'BOAT':
        return GMobilityType.BOAT;
      case r'WALK':
        return GMobilityType.WALK;
      case r'TRAIN':
        return GMobilityType.TRAIN;
      default:
        return GMobilityType.gUnknownEnumValue;
    }
  }

  String toJson() {
    switch (this) {
      case GMobilityType.BIKE:
        return r'BIKE';
      case GMobilityType.CAR:
        return r'CAR';
      case GMobilityType.BOAT:
        return r'BOAT';
      case GMobilityType.WALK:
        return r'WALK';
      case GMobilityType.TRAIN:
        return r'TRAIN';
      case GMobilityType.gUnknownEnumValue:
        return r'gUnknownEnumValue';
    }
  }
}

enum GPoiCategory {
  START,
  END,
  WAYPOINT,
  WATER,
  FOOD,
  REPAIR,
  SHELTER,
  CAMPING,
  VIEWPOINT,
  HISTORIC,
  BEACH,
  BOAT,
  WARNING,
  gUnknownEnumValue;

  static GPoiCategory fromJson(String value) {
    switch (value) {
      case r'START':
        return GPoiCategory.START;
      case r'END':
        return GPoiCategory.END;
      case r'WAYPOINT':
        return GPoiCategory.WAYPOINT;
      case r'WATER':
        return GPoiCategory.WATER;
      case r'FOOD':
        return GPoiCategory.FOOD;
      case r'REPAIR':
        return GPoiCategory.REPAIR;
      case r'SHELTER':
        return GPoiCategory.SHELTER;
      case r'CAMPING':
        return GPoiCategory.CAMPING;
      case r'VIEWPOINT':
        return GPoiCategory.VIEWPOINT;
      case r'HISTORIC':
        return GPoiCategory.HISTORIC;
      case r'BEACH':
        return GPoiCategory.BEACH;
      case r'BOAT':
        return GPoiCategory.BOAT;
      case r'WARNING':
        return GPoiCategory.WARNING;
      default:
        return GPoiCategory.gUnknownEnumValue;
    }
  }

  String toJson() {
    switch (this) {
      case GPoiCategory.START:
        return r'START';
      case GPoiCategory.END:
        return r'END';
      case GPoiCategory.WAYPOINT:
        return r'WAYPOINT';
      case GPoiCategory.WATER:
        return r'WATER';
      case GPoiCategory.FOOD:
        return r'FOOD';
      case GPoiCategory.REPAIR:
        return r'REPAIR';
      case GPoiCategory.SHELTER:
        return r'SHELTER';
      case GPoiCategory.CAMPING:
        return r'CAMPING';
      case GPoiCategory.VIEWPOINT:
        return r'VIEWPOINT';
      case GPoiCategory.HISTORIC:
        return r'HISTORIC';
      case GPoiCategory.BEACH:
        return r'BEACH';
      case GPoiCategory.BOAT:
        return r'BOAT';
      case GPoiCategory.WARNING:
        return r'WARNING';
      case GPoiCategory.gUnknownEnumValue:
        return r'gUnknownEnumValue';
    }
  }
}

enum GRefinementError {
  ROUTER_UNAVAILABLE,
  NO_ROUTE_FOUND,
  EMPTY_ROUTE,
  gUnknownEnumValue;

  static GRefinementError fromJson(String value) {
    switch (value) {
      case r'ROUTER_UNAVAILABLE':
        return GRefinementError.ROUTER_UNAVAILABLE;
      case r'NO_ROUTE_FOUND':
        return GRefinementError.NO_ROUTE_FOUND;
      case r'EMPTY_ROUTE':
        return GRefinementError.EMPTY_ROUTE;
      default:
        return GRefinementError.gUnknownEnumValue;
    }
  }

  String toJson() {
    switch (this) {
      case GRefinementError.ROUTER_UNAVAILABLE:
        return r'ROUTER_UNAVAILABLE';
      case GRefinementError.NO_ROUTE_FOUND:
        return r'NO_ROUTE_FOUND';
      case GRefinementError.EMPTY_ROUTE:
        return r'EMPTY_ROUTE';
      case GRefinementError.gUnknownEnumValue:
        return r'gUnknownEnumValue';
    }
  }
}

class GRouteAnchorInput {
  const GRouteAnchorInput({
    required this.sectionId,
    required this.point,
  });

  factory GRouteAnchorInput.fromJson(Map<String, dynamic> json) {
    return GRouteAnchorInput(
      sectionId: (json['sectionId'] as String),
      point: GLatLngInput.fromJson((json['point'] as Map<String, dynamic>)),
    );
  }

  final String sectionId;

  final GLatLngInput point;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$sectionIdValue = this.sectionId;
    _$result['sectionId'] = _$sectionIdValue;
    final _$pointValue = this.point;
    _$result['point'] = _$pointValue.toJson();
    return _$result;
  }

  GRouteAnchorInput copyWith({
    String? sectionId,
    GLatLngInput? point,
  }) {
    return GRouteAnchorInput(
      sectionId: sectionId ?? this.sectionId,
      point: point ?? this.point,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRouteAnchorInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GRouteAnchorInput(sectionId: $sectionId, point: $point)';
  }
}

enum GRouteEditErrorCode {
  STALE_ROUTE,
  INVALID_ANCHOR,
  INVALID_EDIT,
  TRIP_NOT_FOUND,
  gUnknownEnumValue;

  static GRouteEditErrorCode fromJson(String value) {
    switch (value) {
      case r'STALE_ROUTE':
        return GRouteEditErrorCode.STALE_ROUTE;
      case r'INVALID_ANCHOR':
        return GRouteEditErrorCode.INVALID_ANCHOR;
      case r'INVALID_EDIT':
        return GRouteEditErrorCode.INVALID_EDIT;
      case r'TRIP_NOT_FOUND':
        return GRouteEditErrorCode.TRIP_NOT_FOUND;
      default:
        return GRouteEditErrorCode.gUnknownEnumValue;
    }
  }

  String toJson() {
    switch (this) {
      case GRouteEditErrorCode.STALE_ROUTE:
        return r'STALE_ROUTE';
      case GRouteEditErrorCode.INVALID_ANCHOR:
        return r'INVALID_ANCHOR';
      case GRouteEditErrorCode.INVALID_EDIT:
        return r'INVALID_EDIT';
      case GRouteEditErrorCode.TRIP_NOT_FOUND:
        return r'TRIP_NOT_FOUND';
      case GRouteEditErrorCode.gUnknownEnumValue:
        return r'gUnknownEnumValue';
    }
  }
}

class GTripUpdateInput {
  const GTripUpdateInput({
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.origin = const Value.absent(),
  });

  factory GTripUpdateInput.fromJson(Map<String, dynamic> json) {
    return GTripUpdateInput(
      title: json.containsKey('title')
          ? Value.present(
              json['title'] == null ? null : (json['title'] as String))
          : Value.absent(),
      description: json.containsKey('description')
          ? Value.present(json['description'] == null
              ? null
              : (json['description'] as String))
          : Value.absent(),
      date: json.containsKey('date')
          ? Value.present(
              json['date'] == null ? null : (json['date'] as String))
          : Value.absent(),
      origin: json.containsKey('origin')
          ? Value.present(json['origin'] == null
              ? null
              : GLatLngInput.fromJson((json['origin'] as Map<String, dynamic>)))
          : Value.absent(),
    );
  }

  final Value<String> title;

  final Value<String> description;

  final Value<String> date;

  final Value<GLatLngInput> origin;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$titleValue = this.title;
    if (_$titleValue.isPresent) {
      final _$titleRequired = _$titleValue.requireValue;
      _$result['title'] = _$titleRequired == null ? null : _$titleRequired;
    }
    final _$descriptionValue = this.description;
    if (_$descriptionValue.isPresent) {
      final _$descriptionRequired = _$descriptionValue.requireValue;
      _$result['description'] =
          _$descriptionRequired == null ? null : _$descriptionRequired;
    }
    final _$dateValue = this.date;
    if (_$dateValue.isPresent) {
      final _$dateRequired = _$dateValue.requireValue;
      _$result['date'] = _$dateRequired == null ? null : _$dateRequired;
    }
    final _$originValue = this.origin;
    if (_$originValue.isPresent) {
      final _$originRequired = _$originValue.requireValue;
      _$result['origin'] =
          _$originRequired == null ? null : _$originRequired.toJson();
    }
    return _$result;
  }

  GTripUpdateInput copyWith({
    Value<String>? title,
    Value<String>? description,
    Value<String>? date,
    Value<GLatLngInput>? origin,
  }) {
    return GTripUpdateInput(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      origin: origin ?? this.origin,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GTripUpdateInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GTripUpdateInput(title: $title, description: $description, date: $date, origin: $origin)';
  }
}

class GUpdateUserProfileInput {
  const GUpdateUserProfileInput({
    this.profilePicture = const Value.absent(),
    this.bio = const Value.absent(),
  });

  factory GUpdateUserProfileInput.fromJson(Map<String, dynamic> json) {
    return GUpdateUserProfileInput(
      profilePicture: json.containsKey('profilePicture')
          ? Value.present(json['profilePicture'] == null
              ? null
              : (json['profilePicture'] as String))
          : Value.absent(),
      bio: json.containsKey('bio')
          ? Value.present(json['bio'] == null ? null : (json['bio'] as String))
          : Value.absent(),
    );
  }

  final Value<String> profilePicture;

  final Value<String> bio;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$profilePictureValue = this.profilePicture;
    if (_$profilePictureValue.isPresent) {
      final _$profilePictureRequired = _$profilePictureValue.requireValue;
      _$result['profilePicture'] =
          _$profilePictureRequired == null ? null : _$profilePictureRequired;
    }
    final _$bioValue = this.bio;
    if (_$bioValue.isPresent) {
      final _$bioRequired = _$bioValue.requireValue;
      _$result['bio'] = _$bioRequired == null ? null : _$bioRequired;
    }
    return _$result;
  }

  GUpdateUserProfileInput copyWith({
    Value<String>? profilePicture,
    Value<String>? bio,
  }) {
    return GUpdateUserProfileInput(
      profilePicture: profilePicture ?? this.profilePicture,
      bio: bio ?? this.bio,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUpdateUserProfileInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GUpdateUserProfileInput(profilePicture: $profilePicture, bio: $bio)';
  }
}

class GWaypointUpdateInput {
  const GWaypointUpdateInput({
    this.location = const Value.absent(),
    this.title = const Value.absent(),
    this.poiCategory = const Value.absent(),
    this.vertexId = const Value.absent(),
    this.description = const Value.absent(),
  });

  factory GWaypointUpdateInput.fromJson(Map<String, dynamic> json) {
    return GWaypointUpdateInput(
      location: json.containsKey('location')
          ? Value.present(json['location'] == null
              ? null
              : GLatLngInput.fromJson(
                  (json['location'] as Map<String, dynamic>)))
          : Value.absent(),
      title: json.containsKey('title')
          ? Value.present(
              json['title'] == null ? null : (json['title'] as String))
          : Value.absent(),
      poiCategory: json.containsKey('poiCategory')
          ? Value.present(json['poiCategory'] == null
              ? null
              : GPoiCategory.fromJson((json['poiCategory'] as String)))
          : Value.absent(),
      vertexId: json.containsKey('vertexId')
          ? Value.present(
              json['vertexId'] == null ? null : (json['vertexId'] as int))
          : Value.absent(),
      description: json.containsKey('description')
          ? Value.present(json['description'] == null
              ? null
              : (json['description'] as String))
          : Value.absent(),
    );
  }

  final Value<GLatLngInput> location;

  final Value<String> title;

  final Value<GPoiCategory> poiCategory;

  final Value<int> vertexId;

  final Value<String> description;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$locationValue = this.location;
    if (_$locationValue.isPresent) {
      final _$locationRequired = _$locationValue.requireValue;
      _$result['location'] =
          _$locationRequired == null ? null : _$locationRequired.toJson();
    }
    final _$titleValue = this.title;
    if (_$titleValue.isPresent) {
      final _$titleRequired = _$titleValue.requireValue;
      _$result['title'] = _$titleRequired == null ? null : _$titleRequired;
    }
    final _$poiCategoryValue = this.poiCategory;
    if (_$poiCategoryValue.isPresent) {
      final _$poiCategoryRequired = _$poiCategoryValue.requireValue;
      _$result['poiCategory'] =
          _$poiCategoryRequired == null ? null : _$poiCategoryRequired.toJson();
    }
    final _$vertexIdValue = this.vertexId;
    if (_$vertexIdValue.isPresent) {
      final _$vertexIdRequired = _$vertexIdValue.requireValue;
      _$result['vertexId'] =
          _$vertexIdRequired == null ? null : _$vertexIdRequired;
    }
    final _$descriptionValue = this.description;
    if (_$descriptionValue.isPresent) {
      final _$descriptionRequired = _$descriptionValue.requireValue;
      _$result['description'] =
          _$descriptionRequired == null ? null : _$descriptionRequired;
    }
    return _$result;
  }

  GWaypointUpdateInput copyWith({
    Value<GLatLngInput>? location,
    Value<String>? title,
    Value<GPoiCategory>? poiCategory,
    Value<int>? vertexId,
    Value<String>? description,
  }) {
    return GWaypointUpdateInput(
      location: location ?? this.location,
      title: title ?? this.title,
      poiCategory: poiCategory ?? this.poiCategory,
      vertexId: vertexId ?? this.vertexId,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GWaypointUpdateInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GWaypointUpdateInput(location: $location, title: $title, poiCategory: $poiCategory, vertexId: $vertexId, description: $description)';
  }
}

const Map<String, Set<String>> possibleTypesMap = {
  'CreateProfileResult': {
    'CreateProfileSuccess',
    'CreateProfileError',
  },
  'EditRoutePayload': {
    'EditRouteSuccess',
    'EditRouteError',
  },
};
