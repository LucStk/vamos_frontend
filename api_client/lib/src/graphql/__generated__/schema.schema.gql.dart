// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/src/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:gql_tristate_value/gql_tristate_value.dart';

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

class GTripInput {
  const GTripInput({
    required this.title,
    required this.description,
    this.date = const Value.absent(),
    this.imageUrls = const Value.absent(),
    this.waypoints = const Value.absent(),
    this.segments = const Value.absent(),
  });

  factory GTripInput.fromJson(Map<String, dynamic> json) {
    return GTripInput(
      title: (json['title'] as String),
      description: (json['description'] as String),
      date: json.containsKey('date')
          ? Value.present(
              json['date'] == null ? null : (json['date'] as String))
          : Value.absent(),
      imageUrls: json.containsKey('imageUrls')
          ? Value.present(json['imageUrls'] == null
              ? null
              : (json['imageUrls'] as List<dynamic>)
                  .map((_$e) => (_$e as String))
                  .toList())
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

  final String description;

  final Value<String> date;

  final Value<List<String>> imageUrls;

  final Value<List<GWaypointInput>> waypoints;

  final Value<List<GSegmentInput>> segments;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$titleValue = this.title;
    _$result['title'] = _$titleValue;
    final _$descriptionValue = this.description;
    _$result['description'] = _$descriptionValue;
    final _$dateValue = this.date;
    if (_$dateValue.isPresent) {
      final _$dateRequired = _$dateValue.requireValue;
      _$result['date'] = _$dateRequired == null ? null : _$dateRequired;
    }
    final _$imageUrlsValue = this.imageUrls;
    if (_$imageUrlsValue.isPresent) {
      final _$imageUrlsRequired = _$imageUrlsValue.requireValue;
      _$result['imageUrls'] = _$imageUrlsRequired == null
          ? null
          : _$imageUrlsRequired.map((_$e) => _$e).toList();
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
    String? description,
    Value<String>? date,
    Value<List<String>>? imageUrls,
    Value<List<GWaypointInput>>? waypoints,
    Value<List<GSegmentInput>>? segments,
  }) {
    return GTripInput(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      imageUrls: imageUrls ?? this.imageUrls,
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
    return 'GTripInput(title: $title, description: $description, date: $date, imageUrls: $imageUrls, waypoints: $waypoints, segments: $segments)';
  }
}

class GWaypointInput {
  const GWaypointInput({
    required this.lat,
    required this.lng,
    required this.type,
    this.description = const Value.absent(),
    this.imageUrls = const Value.absent(),
  });

  factory GWaypointInput.fromJson(Map<String, dynamic> json) {
    return GWaypointInput(
      lat: (json['lat'] as double),
      lng: (json['lng'] as double),
      type: GWaypointTypeEnum.fromJson((json['type'] as String)),
      description: json.containsKey('description')
          ? Value.present(json['description'] == null
              ? null
              : (json['description'] as String))
          : Value.absent(),
      imageUrls: json.containsKey('imageUrls')
          ? Value.present(json['imageUrls'] == null
              ? null
              : (json['imageUrls'] as List<dynamic>)
                  .map((_$e) => (_$e as String))
                  .toList())
          : Value.absent(),
    );
  }

  final double lat;

  final double lng;

  final GWaypointTypeEnum type;

  final Value<String> description;

  final Value<List<String>> imageUrls;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$latValue = this.lat;
    _$result['lat'] = _$latValue;
    final _$lngValue = this.lng;
    _$result['lng'] = _$lngValue;
    final _$typeValue = this.type;
    _$result['type'] = _$typeValue.toJson();
    final _$descriptionValue = this.description;
    if (_$descriptionValue.isPresent) {
      final _$descriptionRequired = _$descriptionValue.requireValue;
      _$result['description'] =
          _$descriptionRequired == null ? null : _$descriptionRequired;
    }
    final _$imageUrlsValue = this.imageUrls;
    if (_$imageUrlsValue.isPresent) {
      final _$imageUrlsRequired = _$imageUrlsValue.requireValue;
      _$result['imageUrls'] = _$imageUrlsRequired == null
          ? null
          : _$imageUrlsRequired.map((_$e) => _$e).toList();
    }
    return _$result;
  }

  GWaypointInput copyWith({
    double? lat,
    double? lng,
    GWaypointTypeEnum? type,
    Value<String>? description,
    Value<List<String>>? imageUrls,
  }) {
    return GWaypointInput(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      type: type ?? this.type,
      description: description ?? this.description,
      imageUrls: imageUrls ?? this.imageUrls,
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
    return 'GWaypointInput(lat: $lat, lng: $lng, type: $type, description: $description, imageUrls: $imageUrls)';
  }
}

enum GWaypointTypeEnum {
  start,
  end,
  waypoint,
  water,
  food,
  repair,
  shelter,
  camping,
  viewpoint,
  historic,
  beach,
  boat,
  warning,
  gUnknownEnumValue;

  static GWaypointTypeEnum fromJson(String value) {
    switch (value) {
      case r'start':
        return GWaypointTypeEnum.start;
      case r'end':
        return GWaypointTypeEnum.end;
      case r'waypoint':
        return GWaypointTypeEnum.waypoint;
      case r'water':
        return GWaypointTypeEnum.water;
      case r'food':
        return GWaypointTypeEnum.food;
      case r'repair':
        return GWaypointTypeEnum.repair;
      case r'shelter':
        return GWaypointTypeEnum.shelter;
      case r'camping':
        return GWaypointTypeEnum.camping;
      case r'viewpoint':
        return GWaypointTypeEnum.viewpoint;
      case r'historic':
        return GWaypointTypeEnum.historic;
      case r'beach':
        return GWaypointTypeEnum.beach;
      case r'boat':
        return GWaypointTypeEnum.boat;
      case r'warning':
        return GWaypointTypeEnum.warning;
      default:
        return GWaypointTypeEnum.gUnknownEnumValue;
    }
  }

  String toJson() {
    switch (this) {
      case GWaypointTypeEnum.start:
        return r'start';
      case GWaypointTypeEnum.end:
        return r'end';
      case GWaypointTypeEnum.waypoint:
        return r'waypoint';
      case GWaypointTypeEnum.water:
        return r'water';
      case GWaypointTypeEnum.food:
        return r'food';
      case GWaypointTypeEnum.repair:
        return r'repair';
      case GWaypointTypeEnum.shelter:
        return r'shelter';
      case GWaypointTypeEnum.camping:
        return r'camping';
      case GWaypointTypeEnum.viewpoint:
        return r'viewpoint';
      case GWaypointTypeEnum.historic:
        return r'historic';
      case GWaypointTypeEnum.beach:
        return r'beach';
      case GWaypointTypeEnum.boat:
        return r'boat';
      case GWaypointTypeEnum.warning:
        return r'warning';
      case GWaypointTypeEnum.gUnknownEnumValue:
        return r'gUnknownEnumValue';
    }
  }
}

const Map<String, Set<String>> possibleTypesMap = {};
