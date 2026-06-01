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
    required this.intermediatePoints,
  });

  factory GSegmentCreateInput.fromJson(Map<String, dynamic> json) {
    return GSegmentCreateInput(
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

  GSegmentCreateInput copyWith({
    GSegmentTypeEnum? type,
    List<GLatLngInput>? intermediatePoints,
  }) {
    return GSegmentCreateInput(
      type: type ?? this.type,
      intermediatePoints: intermediatePoints ?? this.intermediatePoints,
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
    return 'GSegmentCreateInput(type: $type, intermediatePoints: $intermediatePoints)';
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
    this.intermediatePoints = const Value.absent(),
  });

  factory GSegmentUpdateInput.fromJson(Map<String, dynamic> json) {
    return GSegmentUpdateInput(
      type: json.containsKey('type')
          ? Value.present(json['type'] == null
              ? null
              : GSegmentTypeEnum.fromJson((json['type'] as String)))
          : Value.absent(),
      intermediatePoints: json.containsKey('intermediatePoints')
          ? Value.present(json['intermediatePoints'] == null
              ? null
              : (json['intermediatePoints'] as List<dynamic>)
                  .map((_$e) =>
                      GLatLngInput.fromJson((_$e as Map<String, dynamic>)))
                  .toList())
          : Value.absent(),
    );
  }

  final Value<GSegmentTypeEnum> type;

  final Value<List<GLatLngInput>> intermediatePoints;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$typeValue = this.type;
    if (_$typeValue.isPresent) {
      final _$typeRequired = _$typeValue.requireValue;
      _$result['type'] =
          _$typeRequired == null ? null : _$typeRequired.toJson();
    }
    final _$intermediatePointsValue = this.intermediatePoints;
    if (_$intermediatePointsValue.isPresent) {
      final _$intermediatePointsRequired =
          _$intermediatePointsValue.requireValue;
      _$result['intermediatePoints'] = _$intermediatePointsRequired == null
          ? null
          : _$intermediatePointsRequired.map((_$e) => _$e.toJson()).toList();
    }
    return _$result;
  }

  GSegmentUpdateInput copyWith({
    Value<GSegmentTypeEnum>? type,
    Value<List<GLatLngInput>>? intermediatePoints,
  }) {
    return GSegmentUpdateInput(
      type: type ?? this.type,
      intermediatePoints: intermediatePoints ?? this.intermediatePoints,
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
    return 'GSegmentUpdateInput(type: $type, intermediatePoints: $intermediatePoints)';
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
    required this.lat,
    required this.lng,
    required this.type,
    this.title = const Value.absent(),
    this.description = const Value.absent(),
  });

  factory GWaypointCreateInput.fromJson(Map<String, dynamic> json) {
    return GWaypointCreateInput(
      lat: (json['lat'] as double),
      lng: (json['lng'] as double),
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

  final double lat;

  final double lng;

  final GWaypointEnum type;

  final Value<String> title;

  final Value<String> description;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$latValue = this.lat;
    _$result['lat'] = _$latValue;
    final _$lngValue = this.lng;
    _$result['lng'] = _$lngValue;
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
    double? lat,
    double? lng,
    GWaypointEnum? type,
    Value<String>? title,
    Value<String>? description,
  }) {
    return GWaypointCreateInput(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
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
    return 'GWaypointCreateInput(lat: $lat, lng: $lng, type: $type, title: $title, description: $description)';
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
