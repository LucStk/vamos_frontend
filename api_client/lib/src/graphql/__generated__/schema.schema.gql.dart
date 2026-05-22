// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/src/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql_tristate_value/gql_tristate_value.dart';

class GImageInput {
  const GImageInput({required this.fileKey});

  factory GImageInput.fromJson(Map<String, dynamic> json) {
    return GImageInput(fileKey: (json['fileKey'] as String));
  }

  final String fileKey;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$fileKeyValue = this.fileKey;
    _$result['fileKey'] = _$fileKeyValue;
    return _$result;
  }

  GImageInput copyWith({String? fileKey}) {
    return GImageInput(fileKey: fileKey ?? this.fileKey);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GImageInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GImageInput(fileKey: $fileKey)';
  }
}

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

class GSegmentInput {
  const GSegmentInput({
    required this.type,
    required this.intermediatePoints,
  });

  factory GSegmentInput.fromJson(Map<String, dynamic> json) {
    return GSegmentInput(
      type: GSegmentTypeEnum.fromJson((json['type'] as String)),
      intermediatePoints: (json['intermediatePoints'] as List<dynamic>)
          .map((_$e) => GLatLngInput.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
    );
  }

  final GSegmentTypeEnum type;

  final List<GLatLngInput> intermediatePoints;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$typeValue = this.type;
    _$result['type'] = _$typeValue.toJson();
    final _$intermediatePointsValue = this.intermediatePoints;
    _$result['intermediatePoints'] =
        _$intermediatePointsValue.map((_$e) => _$e.toJson()).toList();
    return _$result;
  }

  GSegmentInput copyWith({
    GSegmentTypeEnum? type,
    List<GLatLngInput>? intermediatePoints,
  }) {
    return GSegmentInput(
      type: type ?? this.type,
      intermediatePoints: intermediatePoints ?? this.intermediatePoints,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GSegmentInput(type: $type, intermediatePoints: $intermediatePoints)';
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

class GTripDeleteInput {
  const GTripDeleteInput({required this.id});

  factory GTripDeleteInput.fromJson(Map<String, dynamic> json) {
    return GTripDeleteInput(id: (json['id'] as int));
  }

  final int id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GTripDeleteInput copyWith({int? id}) {
    return GTripDeleteInput(id: id ?? this.id);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GTripDeleteInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GTripDeleteInput(id: $id)';
  }
}

class GTripInput {
  const GTripInput({
    required this.title,
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.waypoints = const Value.absent(),
    this.segments = const Value.absent(),
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
      waypoints: json.containsKey('waypoints')
          ? Value.present(json['waypoints'] == null
              ? null
              : (json['waypoints'] as List<dynamic>)
                  .map((_$e) =>
                      GWaypointInput.fromJson((_$e as Map<String, dynamic>)))
                  .toList())
          : Value.absent(),
      segments: json.containsKey('segments')
          ? Value.present(json['segments'] == null
              ? null
              : (json['segments'] as List<dynamic>)
                  .map((_$e) =>
                      GSegmentInput.fromJson((_$e as Map<String, dynamic>)))
                  .toList())
          : Value.absent(),
    );
  }

  final String title;

  final Value<String> description;

  final Value<String> date;

  final Value<List<GWaypointInput>> waypoints;

  final Value<List<GSegmentInput>> segments;

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
    final _$waypointsValue = this.waypoints;
    if (_$waypointsValue.isPresent) {
      final _$waypointsRequired = _$waypointsValue.requireValue;
      _$result['waypoints'] = _$waypointsRequired == null
          ? null
          : _$waypointsRequired.map((_$e) => _$e.toJson()).toList();
    }
    final _$segmentsValue = this.segments;
    if (_$segmentsValue.isPresent) {
      final _$segmentsRequired = _$segmentsValue.requireValue;
      _$result['segments'] = _$segmentsRequired == null
          ? null
          : _$segmentsRequired.map((_$e) => _$e.toJson()).toList();
    }
    return _$result;
  }

  GTripInput copyWith({
    String? title,
    Value<String>? description,
    Value<String>? date,
    Value<List<GWaypointInput>>? waypoints,
    Value<List<GSegmentInput>>? segments,
  }) {
    return GTripInput(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      waypoints: waypoints ?? this.waypoints,
      segments: segments ?? this.segments,
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
    return 'GTripInput(title: $title, description: $description, date: $date, waypoints: $waypoints, segments: $segments)';
  }
}

class GTripUpdateInput {
  const GTripUpdateInput({
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.waypoints = const Value.absent(),
    this.segments = const Value.absent(),
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
      waypoints: json.containsKey('waypoints')
          ? Value.present(json['waypoints'] == null
              ? null
              : (json['waypoints'] as List<dynamic>)
                  .map((_$e) =>
                      GWaypointInput.fromJson((_$e as Map<String, dynamic>)))
                  .toList())
          : Value.absent(),
      segments: json.containsKey('segments')
          ? Value.present(json['segments'] == null
              ? null
              : (json['segments'] as List<dynamic>)
                  .map((_$e) =>
                      GSegmentInput.fromJson((_$e as Map<String, dynamic>)))
                  .toList())
          : Value.absent(),
    );
  }

  final Value<String> title;

  final Value<String> description;

  final Value<String> date;

  final Value<List<GWaypointInput>> waypoints;

  final Value<List<GSegmentInput>> segments;

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
    final _$waypointsValue = this.waypoints;
    if (_$waypointsValue.isPresent) {
      final _$waypointsRequired = _$waypointsValue.requireValue;
      _$result['waypoints'] = _$waypointsRequired == null
          ? null
          : _$waypointsRequired.map((_$e) => _$e.toJson()).toList();
    }
    final _$segmentsValue = this.segments;
    if (_$segmentsValue.isPresent) {
      final _$segmentsRequired = _$segmentsValue.requireValue;
      _$result['segments'] = _$segmentsRequired == null
          ? null
          : _$segmentsRequired.map((_$e) => _$e.toJson()).toList();
    }
    return _$result;
  }

  GTripUpdateInput copyWith({
    Value<String>? title,
    Value<String>? description,
    Value<String>? date,
    Value<List<GWaypointInput>>? waypoints,
    Value<List<GSegmentInput>>? segments,
  }) {
    return GTripUpdateInput(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      waypoints: waypoints ?? this.waypoints,
      segments: segments ?? this.segments,
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
    return 'GTripUpdateInput(title: $title, description: $description, date: $date, waypoints: $waypoints, segments: $segments)';
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

class GWaypointInput {
  const GWaypointInput({
    required this.lat,
    required this.lng,
    this.title = const Value.absent(),
    required this.type,
    this.description = const Value.absent(),
  });

  factory GWaypointInput.fromJson(Map<String, dynamic> json) {
    return GWaypointInput(
      lat: (json['lat'] as double),
      lng: (json['lng'] as double),
      title: json.containsKey('title')
          ? Value.present(
              json['title'] == null ? null : (json['title'] as String))
          : Value.absent(),
      type: GWaypointEnum.fromJson((json['type'] as String)),
      description: json.containsKey('description')
          ? Value.present(json['description'] == null
              ? null
              : (json['description'] as String))
          : Value.absent(),
    );
  }

  final double lat;

  final double lng;

  final Value<String> title;

  final GWaypointEnum type;

  final Value<String> description;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$latValue = this.lat;
    _$result['lat'] = _$latValue;
    final _$lngValue = this.lng;
    _$result['lng'] = _$lngValue;
    final _$titleValue = this.title;
    if (_$titleValue.isPresent) {
      final _$titleRequired = _$titleValue.requireValue;
      _$result['title'] = _$titleRequired == null ? null : _$titleRequired;
    }
    final _$typeValue = this.type;
    _$result['type'] = _$typeValue.toJson();
    final _$descriptionValue = this.description;
    if (_$descriptionValue.isPresent) {
      final _$descriptionRequired = _$descriptionValue.requireValue;
      _$result['description'] =
          _$descriptionRequired == null ? null : _$descriptionRequired;
    }
    return _$result;
  }

  GWaypointInput copyWith({
    double? lat,
    double? lng,
    Value<String>? title,
    GWaypointEnum? type,
    Value<String>? description,
  }) {
    return GWaypointInput(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      title: title ?? this.title,
      type: type ?? this.type,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GWaypointInput &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GWaypointInput(lat: $lat, lng: $lng, title: $title, type: $type, description: $description)';
  }
}

class GWaypointUpdateInput {
  const GWaypointUpdateInput({
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
  });

  factory GWaypointUpdateInput.fromJson(Map<String, dynamic> json) {
    return GWaypointUpdateInput(
      lat: json.containsKey('lat')
          ? Value.present(json['lat'] == null ? null : (json['lat'] as double))
          : Value.absent(),
      lng: json.containsKey('lng')
          ? Value.present(json['lng'] == null ? null : (json['lng'] as double))
          : Value.absent(),
      title: json.containsKey('title')
          ? Value.present(
              json['title'] == null ? null : (json['title'] as String))
          : Value.absent(),
      type: json.containsKey('type')
          ? Value.present(json['type'] == null
              ? null
              : GWaypointEnum.fromJson((json['type'] as String)))
          : Value.absent(),
      description: json.containsKey('description')
          ? Value.present(json['description'] == null
              ? null
              : (json['description'] as String))
          : Value.absent(),
    );
  }

  final Value<double> lat;

  final Value<double> lng;

  final Value<String> title;

  final Value<GWaypointEnum> type;

  final Value<String> description;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$latValue = this.lat;
    if (_$latValue.isPresent) {
      final _$latRequired = _$latValue.requireValue;
      _$result['lat'] = _$latRequired == null ? null : _$latRequired;
    }
    final _$lngValue = this.lng;
    if (_$lngValue.isPresent) {
      final _$lngRequired = _$lngValue.requireValue;
      _$result['lng'] = _$lngRequired == null ? null : _$lngRequired;
    }
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
    final _$descriptionValue = this.description;
    if (_$descriptionValue.isPresent) {
      final _$descriptionRequired = _$descriptionValue.requireValue;
      _$result['description'] =
          _$descriptionRequired == null ? null : _$descriptionRequired;
    }
    return _$result;
  }

  GWaypointUpdateInput copyWith({
    Value<double>? lat,
    Value<double>? lng,
    Value<String>? title,
    Value<GWaypointEnum>? type,
    Value<String>? description,
  }) {
    return GWaypointUpdateInput(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      title: title ?? this.title,
      type: type ?? this.type,
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
    return 'GWaypointUpdateInput(lat: $lat, lng: $lng, title: $title, type: $type, description: $description)';
  }
}

const Map<String, Set<String>> possibleTypesMap = {};
