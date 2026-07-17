// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GAttachFileTripInput {
  const GAttachFileTripInput({
    required this.tripId,
    required this.fileId,
  });

  factory GAttachFileTripInput.fromJson(Map<String, dynamic> json) {
    return GAttachFileTripInput(
      tripId: (json['tripId'] as String),
      fileId: (json['fileId'] as String),
    );
  }

  final String tripId;

  final String fileId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$fileIdValue = this.fileId;
    _$result['fileId'] = _$fileIdValue;
    return _$result;
  }

  GAttachFileTripInput copyWith({
    String? tripId,
    String? fileId,
  }) {
    return GAttachFileTripInput(
      tripId: tripId ?? this.tripId,
      fileId: fileId ?? this.fileId,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAttachFileTripInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GAttachFileTripInput(tripId: $tripId, fileId: $fileId)';
  }
}

class GAttachFileWaypointInput {
  const GAttachFileWaypointInput({
    required this.waypointId,
    required this.fileId,
  });

  factory GAttachFileWaypointInput.fromJson(Map<String, dynamic> json) {
    return GAttachFileWaypointInput(
      waypointId: (json['waypointId'] as String),
      fileId: (json['fileId'] as String),
    );
  }

  final String waypointId;

  final String fileId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$waypointIdValue = this.waypointId;
    _$result['waypointId'] = _$waypointIdValue;
    final _$fileIdValue = this.fileId;
    _$result['fileId'] = _$fileIdValue;
    return _$result;
  }

  GAttachFileWaypointInput copyWith({
    String? waypointId,
    String? fileId,
  }) {
    return GAttachFileWaypointInput(
      waypointId: waypointId ?? this.waypointId,
      fileId: fileId ?? this.fileId,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAttachFileWaypointInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GAttachFileWaypointInput(waypointId: $waypointId, fileId: $fileId)';
  }
}

class GDetachFileInput {
  const GDetachFileInput({required this.attachmentId});

  factory GDetachFileInput.fromJson(Map<String, dynamic> json) {
    return GDetachFileInput(attachmentId: (json['attachmentId'] as String));
  }

  final String attachmentId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$attachmentIdValue = this.attachmentId;
    _$result['attachmentId'] = _$attachmentIdValue;
    return _$result;
  }

  GDetachFileInput copyWith({String? attachmentId}) {
    return GDetachFileInput(attachmentId: attachmentId ?? this.attachmentId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDetachFileInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GDetachFileInput(attachmentId: $attachmentId)';
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

class GSegmentCreateInput {
  const GSegmentCreateInput({
    this.id = const Value.absent(),
    required this.mobilityType,
    required this.startVertexId,
    required this.endVertexId,
  });

  factory GSegmentCreateInput.fromJson(Map<String, dynamic> json) {
    return GSegmentCreateInput(
      id: json.containsKey('id')
          ? Value.present(json['id'] == null ? null : (json['id'] as String))
          : Value.absent(),
      mobilityType: GMobilityType.fromJson((json['mobilityType'] as String)),
      startVertexId: (json['startVertexId'] as String),
      endVertexId: (json['endVertexId'] as String),
    );
  }

  final Value<String> id;

  final GMobilityType mobilityType;

  final String startVertexId;

  final String endVertexId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    if (_$idValue.isPresent) {
      final _$idRequired = _$idValue.requireValue;
      _$result['id'] = _$idRequired == null ? null : _$idRequired;
    }
    final _$mobilityTypeValue = this.mobilityType;
    _$result['mobilityType'] = _$mobilityTypeValue.toJson();
    final _$startVertexIdValue = this.startVertexId;
    _$result['startVertexId'] = _$startVertexIdValue;
    final _$endVertexIdValue = this.endVertexId;
    _$result['endVertexId'] = _$endVertexIdValue;
    return _$result;
  }

  GSegmentCreateInput copyWith({
    Value<String>? id,
    GMobilityType? mobilityType,
    String? startVertexId,
    String? endVertexId,
  }) {
    return GSegmentCreateInput(
      id: id ?? this.id,
      mobilityType: mobilityType ?? this.mobilityType,
      startVertexId: startVertexId ?? this.startVertexId,
      endVertexId: endVertexId ?? this.endVertexId,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentCreateInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GSegmentCreateInput(id: $id, mobilityType: $mobilityType, startVertexId: $startVertexId, endVertexId: $endVertexId)';
  }
}

class GSegmentUpdateInput {
  const GSegmentUpdateInput({
    this.mobilityType = const Value.absent(),
    this.startVertexId = const Value.absent(),
    this.endVertexId = const Value.absent(),
  });

  factory GSegmentUpdateInput.fromJson(Map<String, dynamic> json) {
    return GSegmentUpdateInput(
      mobilityType: json.containsKey('mobilityType')
          ? Value.present(json['mobilityType'] == null
              ? null
              : GMobilityType.fromJson((json['mobilityType'] as String)))
          : Value.absent(),
      startVertexId: json.containsKey('startVertexId')
          ? Value.present(json['startVertexId'] == null
              ? null
              : (json['startVertexId'] as String))
          : Value.absent(),
      endVertexId: json.containsKey('endVertexId')
          ? Value.present(json['endVertexId'] == null
              ? null
              : (json['endVertexId'] as String))
          : Value.absent(),
    );
  }

  final Value<GMobilityType> mobilityType;

  final Value<String> startVertexId;

  final Value<String> endVertexId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$mobilityTypeValue = this.mobilityType;
    if (_$mobilityTypeValue.isPresent) {
      final _$mobilityTypeRequired = _$mobilityTypeValue.requireValue;
      _$result['mobilityType'] = _$mobilityTypeRequired == null
          ? null
          : _$mobilityTypeRequired.toJson();
    }
    final _$startVertexIdValue = this.startVertexId;
    if (_$startVertexIdValue.isPresent) {
      final _$startVertexIdRequired = _$startVertexIdValue.requireValue;
      _$result['startVertexId'] =
          _$startVertexIdRequired == null ? null : _$startVertexIdRequired;
    }
    final _$endVertexIdValue = this.endVertexId;
    if (_$endVertexIdValue.isPresent) {
      final _$endVertexIdRequired = _$endVertexIdValue.requireValue;
      _$result['endVertexId'] =
          _$endVertexIdRequired == null ? null : _$endVertexIdRequired;
    }
    return _$result;
  }

  GSegmentUpdateInput copyWith({
    Value<GMobilityType>? mobilityType,
    Value<String>? startVertexId,
    Value<String>? endVertexId,
  }) {
    return GSegmentUpdateInput(
      mobilityType: mobilityType ?? this.mobilityType,
      startVertexId: startVertexId ?? this.startVertexId,
      endVertexId: endVertexId ?? this.endVertexId,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentUpdateInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GSegmentUpdateInput(mobilityType: $mobilityType, startVertexId: $startVertexId, endVertexId: $endVertexId)';
  }
}

class GTripUpdateInput {
  const GTripUpdateInput({
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
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
    );
  }

  final Value<String> title;

  final Value<String> description;

  final Value<String> date;

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
    return _$result;
  }

  GTripUpdateInput copyWith({
    Value<String>? title,
    Value<String>? description,
    Value<String>? date,
  }) {
    return GTripUpdateInput(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
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
    return 'GTripUpdateInput(title: $title, description: $description, date: $date)';
  }
}

class GWaypointUpdateInput {
  const GWaypointUpdateInput({
    this.title = const Value.absent(),
    this.poiCategory = const Value.absent(),
    this.vertexId = const Value.absent(),
    this.description = const Value.absent(),
  });

  factory GWaypointUpdateInput.fromJson(Map<String, dynamic> json) {
    return GWaypointUpdateInput(
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

  final Value<String> title;

  final Value<GPoiCategory> poiCategory;

  final Value<int> vertexId;

  final Value<String> description;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
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
    Value<String>? title,
    Value<GPoiCategory>? poiCategory,
    Value<int>? vertexId,
    Value<String>? description,
  }) {
    return GWaypointUpdateInput(
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
    return 'GWaypointUpdateInput(title: $title, poiCategory: $poiCategory, vertexId: $vertexId, description: $description)';
  }
}

const Map<String, Set<String>> possibleTypesMap = {};
