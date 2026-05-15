// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/src/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:api_client/src/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

abstract class GTripFields {
  String get id;
  String get title;
  String? get date;
  String get description;
  List<String>? get images;
  String get G__typename;
}

class GTripFieldsData implements GTripFields {
  const GTripFieldsData({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    this.images,
    this.G__typename = 'TripType',
  });

  factory GTripFieldsData.fromJson(Map<String, dynamic> json) {
    return GTripFieldsData(
      id: (json['id'] as String),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      images: json['images'] == null
          ? null
          : List<String>.from((json['images'] as List<dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String title;

  final String? date;

  final String description;

  final List<String>? images;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['title'] = this.title;
    final _$dateValue = this.date;
    _$result['date'] = _$dateValue == null ? null : _$dateValue;
    _$result['description'] = this.description;
    final _$imagesValue = this.images;
    _$result['images'] =
        _$imagesValue == null ? null : _$imagesValue.map((_$e) => _$e).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GTripFieldsData copyWith({
    String? id,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    List<String>? images,
    bool imagesIsSet = false,
    String? G__typename,
  }) {
    return GTripFieldsData(
      id: id ?? this.id,
      title: title ?? this.title,
      date: dateIsSet ? date : this.date,
      description: description ?? this.description,
      images: imagesIsSet ? images : this.images,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GTripFieldsData &&
            id == other.id &&
            title == other.title &&
            date == other.date &&
            description == other.description &&
            _gqlUtils.listEquals(images, other.images) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, title, date, description,
        _gqlUtils.listHash(images), G__typename);
  }

  @override
  String toString() {
    return 'GTripFieldsData(id: $id, title: $title, date: $date, description: $description, images: $images, G__typename: $G__typename)';
  }
}

abstract class GSegmentFields {
  String get id;
  _i1.GSegmentTypeEnum get type;
  List<GSegmentFields_intermediatePoints> get intermediatePoints;
  String get G__typename;
}

abstract class GSegmentFields_intermediatePoints {
  double get lat;
  double get lng;
  String get G__typename;
}

class GSegmentFieldsData implements GSegmentFields {
  const GSegmentFieldsData({
    required this.id,
    required this.type,
    required this.intermediatePoints,
    this.G__typename = 'SegmentType',
  });

  factory GSegmentFieldsData.fromJson(Map<String, dynamic> json) {
    return GSegmentFieldsData(
      id: (json['id'] as String),
      type: _i1.GSegmentTypeEnum.fromJson((json['type'] as String)),
      intermediatePoints: (json['intermediatePoints'] as List<dynamic>)
          .map((_$e) => GSegmentFieldsData_intermediatePoints.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final _i1.GSegmentTypeEnum type;

  final List<GSegmentFieldsData_intermediatePoints> intermediatePoints;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['type'] = this.type.toJson();
    _$result['intermediatePoints'] =
        this.intermediatePoints.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSegmentFieldsData copyWith({
    String? id,
    _i1.GSegmentTypeEnum? type,
    List<GSegmentFieldsData_intermediatePoints>? intermediatePoints,
    String? G__typename,
  }) {
    return GSegmentFieldsData(
      id: id ?? this.id,
      type: type ?? this.type,
      intermediatePoints: intermediatePoints ?? this.intermediatePoints,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentFieldsData &&
            id == other.id &&
            type == other.type &&
            _gqlUtils.listEquals(
                intermediatePoints, other.intermediatePoints) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, type,
        _gqlUtils.listHash(intermediatePoints), G__typename);
  }

  @override
  String toString() {
    return 'GSegmentFieldsData(id: $id, type: $type, intermediatePoints: $intermediatePoints, G__typename: $G__typename)';
  }
}

class GSegmentFieldsData_intermediatePoints
    implements GSegmentFields_intermediatePoints {
  const GSegmentFieldsData_intermediatePoints({
    required this.lat,
    required this.lng,
    this.G__typename = 'LatLngType',
  });

  factory GSegmentFieldsData_intermediatePoints.fromJson(
      Map<String, dynamic> json) {
    return GSegmentFieldsData_intermediatePoints(
      lat: (json['lat'] as double),
      lng: (json['lng'] as double),
      G__typename: (json['__typename'] as String),
    );
  }

  final double lat;

  final double lng;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['lat'] = this.lat;
    _$result['lng'] = this.lng;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSegmentFieldsData_intermediatePoints copyWith({
    double? lat,
    double? lng,
    String? G__typename,
  }) {
    return GSegmentFieldsData_intermediatePoints(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentFieldsData_intermediatePoints &&
            lat == other.lat &&
            lng == other.lng &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, lat, lng, G__typename);
  }

  @override
  String toString() {
    return 'GSegmentFieldsData_intermediatePoints(lat: $lat, lng: $lng, G__typename: $G__typename)';
  }
}

abstract class GWaypointFields {
  String get id;
  double get lat;
  double get lng;
  _i1.GWaypointTypeEnum get type;
  String get description;
  List<String> get images;
  String get G__typename;
}

class GWaypointFieldsData implements GWaypointFields {
  const GWaypointFieldsData({
    required this.id,
    required this.lat,
    required this.lng,
    required this.type,
    required this.description,
    required this.images,
    this.G__typename = 'WaypointType',
  });

  factory GWaypointFieldsData.fromJson(Map<String, dynamic> json) {
    return GWaypointFieldsData(
      id: (json['id'] as String),
      lat: (json['lat'] as double),
      lng: (json['lng'] as double),
      type: _i1.GWaypointTypeEnum.fromJson((json['type'] as String)),
      description: (json['description'] as String),
      images: List<String>.from((json['images'] as List<dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final double lat;

  final double lng;

  final _i1.GWaypointTypeEnum type;

  final String description;

  final List<String> images;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['lat'] = this.lat;
    _$result['lng'] = this.lng;
    _$result['type'] = this.type.toJson();
    _$result['description'] = this.description;
    _$result['images'] = this.images.map((_$e) => _$e).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GWaypointFieldsData copyWith({
    String? id,
    double? lat,
    double? lng,
    _i1.GWaypointTypeEnum? type,
    String? description,
    List<String>? images,
    String? G__typename,
  }) {
    return GWaypointFieldsData(
      id: id ?? this.id,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      type: type ?? this.type,
      description: description ?? this.description,
      images: images ?? this.images,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GWaypointFieldsData &&
            id == other.id &&
            lat == other.lat &&
            lng == other.lng &&
            type == other.type &&
            description == other.description &&
            _gqlUtils.listEquals(images, other.images) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, lat, lng, type, description,
        _gqlUtils.listHash(images), G__typename);
  }

  @override
  String toString() {
    return 'GWaypointFieldsData(id: $id, lat: $lat, lng: $lng, type: $type, description: $description, images: $images, G__typename: $G__typename)';
  }
}
