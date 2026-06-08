// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GLatLngInput {
  const GLatLngInput({
    required this.lat,
    required this.lng,
  });

  factory GLatLngInput.fromJson(Map<String, dynamic> json) {
    return GLatLngInput(
      lat: (json['lat'] as double),
      lng: (json['lng'] as double),
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

class GMediaImageInput {
  const GMediaImageInput({required this.fileKey});

  factory GMediaImageInput.fromJson(Map<String, dynamic> json) {
    return GMediaImageInput(fileKey: (json['fileKey'] as String));
  }

  final String fileKey;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$fileKeyValue = this.fileKey;
    _$result['fileKey'] = _$fileKeyValue;
    return _$result;
  }

  GMediaImageInput copyWith({String? fileKey}) {
    return GMediaImageInput(fileKey: fileKey ?? this.fileKey);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GMediaImageInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GMediaImageInput(fileKey: $fileKey)';
  }
}

class GSegmentCreateInput {
  const GSegmentCreateInput({
    required this.type,
    required this.startVertexId,
    required this.endVertexId,
  });

  factory GSegmentCreateInput.fromJson(Map<String, dynamic> json) {
    return GSegmentCreateInput(
      type: GSegmentTypeEnum.fromJson((json['type'] as String)),
      startVertexId: (json['startVertexId'] as int),
      endVertexId: (json['endVertexId'] as int),
    );
  }

  final GSegmentTypeEnum type;

  final int startVertexId;

  final int endVertexId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$typeValue = this.type;
    _$result['type'] = _$typeValue.toJson();
    final _$startVertexIdValue = this.startVertexId;
    _$result['startVertexId'] = _$startVertexIdValue;
    final _$endVertexIdValue = this.endVertexId;
    _$result['endVertexId'] = _$endVertexIdValue;
    return _$result;
  }

  GSegmentCreateInput copyWith({
    GSegmentTypeEnum? type,
    int? startVertexId,
    int? endVertexId,
  }) {
    return GSegmentCreateInput(
      type: type ?? this.type,
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
    return 'GSegmentCreateInput(type: $type, startVertexId: $startVertexId, endVertexId: $endVertexId)';
  }
}

enum GSegmentTypeEnum {
  bike,
  car,
  boat,
  walk,
  train,
  gUnknownEnumValue;

  static GSegmentTypeEnum fromJson(String value) {
    switch (value) {
      case r'bike':
        return GSegmentTypeEnum.bike;
      case r'car':
        return GSegmentTypeEnum.car;
      case r'boat':
        return GSegmentTypeEnum.boat;
      case r'walk':
        return GSegmentTypeEnum.walk;
      case r'train':
        return GSegmentTypeEnum.train;
      default:
        return GSegmentTypeEnum.gUnknownEnumValue;
    }
  }

  String toJson() {
    switch (this) {
      case GSegmentTypeEnum.bike:
        return r'bike';
      case GSegmentTypeEnum.car:
        return r'car';
      case GSegmentTypeEnum.boat:
        return r'boat';
      case GSegmentTypeEnum.walk:
        return r'walk';
      case GSegmentTypeEnum.train:
        return r'train';
      case GSegmentTypeEnum.gUnknownEnumValue:
        return r'gUnknownEnumValue';
    }
  }
}

class GSegmentUpdateInput {
  const GSegmentUpdateInput({
    this.type = const Value.absent(),
    this.startVertexId = const Value.absent(),
    this.endVertexId = const Value.absent(),
  });

  factory GSegmentUpdateInput.fromJson(Map<String, dynamic> json) {
    return GSegmentUpdateInput(
      type: json.containsKey('type')
          ? Value.present(json['type'] == null
              ? null
              : GSegmentTypeEnum.fromJson((json['type'] as String)))
          : Value.absent(),
      startVertexId: json.containsKey('startVertexId')
          ? Value.present(json['startVertexId'] == null
              ? null
              : (json['startVertexId'] as int))
          : Value.absent(),
      endVertexId: json.containsKey('endVertexId')
          ? Value.present(
              json['endVertexId'] == null ? null : (json['endVertexId'] as int))
          : Value.absent(),
    );
  }

  final Value<GSegmentTypeEnum> type;

  final Value<int> startVertexId;

  final Value<int> endVertexId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$typeValue = this.type;
    if (_$typeValue.isPresent) {
      final _$typeRequired = _$typeValue.requireValue;
      _$result['type'] =
          _$typeRequired == null ? null : _$typeRequired.toJson();
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
    Value<GSegmentTypeEnum>? type,
    Value<int>? startVertexId,
    Value<int>? endVertexId,
  }) {
    return GSegmentUpdateInput(
      type: type ?? this.type,
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
    return 'GSegmentUpdateInput(type: $type, startVertexId: $startVertexId, endVertexId: $endVertexId)';
  }
}

class GTripInput {
  const GTripInput({
    required this.title,
    this.description = const Value.absent(),
    this.date = const Value.absent(),
  });

  factory GTripInput.fromJson(Map<String, dynamic> json) {
    return GTripInput(
      title: (json['title'] as String),
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

  final String title;

  final Value<String> description;

  final Value<String> date;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$titleValue = this.title;
    _$result['title'] = _$titleValue;
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

  GTripInput copyWith({
    String? title,
    Value<String>? description,
    Value<String>? date,
  }) {
    return GTripInput(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GTripInput && _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GTripInput(title: $title, description: $description, date: $date)';
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

class GWaypointCreateInput {
  const GWaypointCreateInput({
    required this.type,
    this.title = const Value.absent(),
    this.description = const Value.absent(),
  });

  factory GWaypointCreateInput.fromJson(Map<String, dynamic> json) {
    return GWaypointCreateInput(
      type: GWaypointEnum.fromJson((json['type'] as String)),
      title: json.containsKey('title')
          ? Value.present(
              json['title'] == null ? null : (json['title'] as String))
          : Value.absent(),
      description: json.containsKey('description')
          ? Value.present(json['description'] == null
              ? null
              : (json['description'] as String))
          : Value.absent(),
    );
  }

  final GWaypointEnum type;

  final Value<String> title;

  final Value<String> description;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$typeValue = this.type;
    _$result['type'] = _$typeValue.toJson();
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
    return _$result;
  }

  GWaypointCreateInput copyWith({
    GWaypointEnum? type,
    Value<String>? title,
    Value<String>? description,
  }) {
    return GWaypointCreateInput(
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GWaypointCreateInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GWaypointCreateInput(type: $type, title: $title, description: $description)';
  }
}

enum GWaypointEnum {
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

  static GWaypointEnum fromJson(String value) {
    switch (value) {
      case r'START':
        return GWaypointEnum.START;
      case r'END':
        return GWaypointEnum.END;
      case r'WAYPOINT':
        return GWaypointEnum.WAYPOINT;
      case r'WATER':
        return GWaypointEnum.WATER;
      case r'FOOD':
        return GWaypointEnum.FOOD;
      case r'REPAIR':
        return GWaypointEnum.REPAIR;
      case r'SHELTER':
        return GWaypointEnum.SHELTER;
      case r'CAMPING':
        return GWaypointEnum.CAMPING;
      case r'VIEWPOINT':
        return GWaypointEnum.VIEWPOINT;
      case r'HISTORIC':
        return GWaypointEnum.HISTORIC;
      case r'BEACH':
        return GWaypointEnum.BEACH;
      case r'BOAT':
        return GWaypointEnum.BOAT;
      case r'WARNING':
        return GWaypointEnum.WARNING;
      default:
        return GWaypointEnum.gUnknownEnumValue;
    }
  }

  String toJson() {
    switch (this) {
      case GWaypointEnum.START:
        return r'START';
      case GWaypointEnum.END:
        return r'END';
      case GWaypointEnum.WAYPOINT:
        return r'WAYPOINT';
      case GWaypointEnum.WATER:
        return r'WATER';
      case GWaypointEnum.FOOD:
        return r'FOOD';
      case GWaypointEnum.REPAIR:
        return r'REPAIR';
      case GWaypointEnum.SHELTER:
        return r'SHELTER';
      case GWaypointEnum.CAMPING:
        return r'CAMPING';
      case GWaypointEnum.VIEWPOINT:
        return r'VIEWPOINT';
      case GWaypointEnum.HISTORIC:
        return r'HISTORIC';
      case GWaypointEnum.BEACH:
        return r'BEACH';
      case GWaypointEnum.BOAT:
        return r'BOAT';
      case GWaypointEnum.WARNING:
        return r'WARNING';
      case GWaypointEnum.gUnknownEnumValue:
        return r'gUnknownEnumValue';
    }
  }
}

class GWaypointUpdateInput {
  const GWaypointUpdateInput({
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.vertexId = const Value.absent(),
    this.description = const Value.absent(),
  });

  factory GWaypointUpdateInput.fromJson(Map<String, dynamic> json) {
    return GWaypointUpdateInput(
      title: json.containsKey('title')
          ? Value.present(
              json['title'] == null ? null : (json['title'] as String))
          : Value.absent(),
      type: json.containsKey('type')
          ? Value.present(json['type'] == null
              ? null
              : GWaypointEnum.fromJson((json['type'] as String)))
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

  final Value<GWaypointEnum> type;

  final Value<int> vertexId;

  final Value<String> description;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$titleValue = this.title;
    if (_$titleValue.isPresent) {
      final _$titleRequired = _$titleValue.requireValue;
      _$result['title'] = _$titleRequired == null ? null : _$titleRequired;
    }
    final _$typeValue = this.type;
    if (_$typeValue.isPresent) {
      final _$typeRequired = _$typeValue.requireValue;
      _$result['type'] =
          _$typeRequired == null ? null : _$typeRequired.toJson();
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
    Value<GWaypointEnum>? type,
    Value<int>? vertexId,
    Value<String>? description,
  }) {
    return GWaypointUpdateInput(
      title: title ?? this.title,
      type: type ?? this.type,
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
    return 'GWaypointUpdateInput(title: $title, type: $type, vertexId: $vertexId, description: $description)';
  }
}

const Map<String, Set<String>> possibleTypesMap = {};
