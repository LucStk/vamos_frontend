// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/src/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:api_client/src/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

abstract class GTripFields {
  int get id;
  String get title;
  String? get date;
  String get description;
  List<GTripFields_images> get images;
  String get G__typename;
}

abstract class GTripFields_images {
  GImageFields get image;
  String get G__typename;
}

class GTripFieldsData implements GTripFields {
  const GTripFieldsData({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    required this.images,
    this.G__typename = 'TripType',
  });

  factory GTripFieldsData.fromJson(Map<String, dynamic> json) {
    return GTripFieldsData(
      id: (json['id'] as int),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      images: (json['images'] as List<dynamic>)
          .map((_$e) =>
              GTripFieldsData_images.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final int id;

  final String title;

  final String? date;

  final String description;

  final List<GTripFieldsData_images> images;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['title'] = this.title;
    final _$dateValue = this.date;
    _$result['date'] = _$dateValue == null ? null : _$dateValue;
    _$result['description'] = this.description;
    _$result['images'] = this.images.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GTripFieldsData copyWith({
    int? id,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    List<GTripFieldsData_images>? images,
    String? G__typename,
  }) {
    return GTripFieldsData(
      id: id ?? this.id,
      title: title ?? this.title,
      date: dateIsSet ? date : this.date,
      description: description ?? this.description,
      images: images ?? this.images,
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

class GTripFieldsData_images implements GTripFields_images {
  const GTripFieldsData_images({
    required this.image,
    this.G__typename = 'TripImageType',
  });

  factory GTripFieldsData_images.fromJson(Map<String, dynamic> json) {
    return GTripFieldsData_images(
      image: GImageFieldsData.fromJson((json['image'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GImageFieldsData image;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['image'] = this.image.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GTripFieldsData_images copyWith({
    GImageFieldsData? image,
    String? G__typename,
  }) {
    return GTripFieldsData_images(
      image: image ?? this.image,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GTripFieldsData_images &&
            image == other.image &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, image, G__typename);
  }

  @override
  String toString() {
    return 'GTripFieldsData_images(image: $image, G__typename: $G__typename)';
  }
}

abstract class GImageFields {
  String get url;
  String get fileKey;
  String get G__typename;
}

class GImageFieldsData implements GImageFields {
  const GImageFieldsData({
    required this.url,
    required this.fileKey,
    this.G__typename = 'ImageType',
  });

  factory GImageFieldsData.fromJson(Map<String, dynamic> json) {
    return GImageFieldsData(
      url: (json['url'] as String),
      fileKey: (json['fileKey'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String url;

  final String fileKey;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['url'] = this.url;
    _$result['fileKey'] = this.fileKey;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GImageFieldsData copyWith({
    String? url,
    String? fileKey,
    String? G__typename,
  }) {
    return GImageFieldsData(
      url: url ?? this.url,
      fileKey: fileKey ?? this.fileKey,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GImageFieldsData &&
            url == other.url &&
            fileKey == other.fileKey &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, url, fileKey, G__typename);
  }

  @override
  String toString() {
    return 'GImageFieldsData(url: $url, fileKey: $fileKey, G__typename: $G__typename)';
  }
}

abstract class GSegmentFields {
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
    required this.type,
    required this.intermediatePoints,
    this.G__typename = 'SegmentType',
  });

  factory GSegmentFieldsData.fromJson(Map<String, dynamic> json) {
    return GSegmentFieldsData(
      type: _i1.GSegmentTypeEnum.fromJson((json['type'] as String)),
      intermediatePoints: (json['intermediatePoints'] as List<dynamic>)
          .map((_$e) => GSegmentFieldsData_intermediatePoints.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GSegmentTypeEnum type;

  final List<GSegmentFieldsData_intermediatePoints> intermediatePoints;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['type'] = this.type.toJson();
    _$result['intermediatePoints'] =
        this.intermediatePoints.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSegmentFieldsData copyWith({
    _i1.GSegmentTypeEnum? type,
    List<GSegmentFieldsData_intermediatePoints>? intermediatePoints,
    String? G__typename,
  }) {
    return GSegmentFieldsData(
      type: type ?? this.type,
      intermediatePoints: intermediatePoints ?? this.intermediatePoints,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentFieldsData &&
            type == other.type &&
            _gqlUtils.listEquals(
                intermediatePoints, other.intermediatePoints) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, type, _gqlUtils.listHash(intermediatePoints), G__typename);
  }

  @override
  String toString() {
    return 'GSegmentFieldsData(type: $type, intermediatePoints: $intermediatePoints, G__typename: $G__typename)';
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
  int get id;
  double get lat;
  double get lng;
  _i1.GWaypointEnum get type;
  String get title;
  String get description;
  List<GWaypointFields_images> get images;
  String get G__typename;
}

abstract class GWaypointFields_images {
  GImageFields get image;
  String get G__typename;
}

class GWaypointFieldsData implements GWaypointFields {
  const GWaypointFieldsData({
    required this.id,
    required this.lat,
    required this.lng,
    required this.type,
    required this.title,
    required this.description,
    required this.images,
    this.G__typename = 'WaypointType',
  });

  factory GWaypointFieldsData.fromJson(Map<String, dynamic> json) {
    return GWaypointFieldsData(
      id: (json['id'] as int),
      lat: (json['lat'] as double),
      lng: (json['lng'] as double),
      type: _i1.GWaypointEnum.fromJson((json['type'] as String)),
      title: (json['title'] as String),
      description: (json['description'] as String),
      images: (json['images'] as List<dynamic>)
          .map((_$e) => GWaypointFieldsData_images.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final int id;

  final double lat;

  final double lng;

  final _i1.GWaypointEnum type;

  final String title;

  final String description;

  final List<GWaypointFieldsData_images> images;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['lat'] = this.lat;
    _$result['lng'] = this.lng;
    _$result['type'] = this.type.toJson();
    _$result['title'] = this.title;
    _$result['description'] = this.description;
    _$result['images'] = this.images.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GWaypointFieldsData copyWith({
    int? id,
    double? lat,
    double? lng,
    _i1.GWaypointEnum? type,
    String? title,
    String? description,
    List<GWaypointFieldsData_images>? images,
    String? G__typename,
  }) {
    return GWaypointFieldsData(
      id: id ?? this.id,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      type: type ?? this.type,
      title: title ?? this.title,
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
            title == other.title &&
            description == other.description &&
            _gqlUtils.listEquals(images, other.images) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, lat, lng, type, title, description,
        _gqlUtils.listHash(images), G__typename);
  }

  @override
  String toString() {
    return 'GWaypointFieldsData(id: $id, lat: $lat, lng: $lng, type: $type, title: $title, description: $description, images: $images, G__typename: $G__typename)';
  }
}

class GWaypointFieldsData_images implements GWaypointFields_images {
  const GWaypointFieldsData_images({
    required this.image,
    this.G__typename = 'WaypointImageType',
  });

  factory GWaypointFieldsData_images.fromJson(Map<String, dynamic> json) {
    return GWaypointFieldsData_images(
      image: GImageFieldsData.fromJson((json['image'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GImageFieldsData image;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['image'] = this.image.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GWaypointFieldsData_images copyWith({
    GImageFieldsData? image,
    String? G__typename,
  }) {
    return GWaypointFieldsData_images(
      image: image ?? this.image,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GWaypointFieldsData_images &&
            image == other.image &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, image, G__typename);
  }

  @override
  String toString() {
    return 'GWaypointFieldsData_images(image: $image, G__typename: $G__typename)';
  }
}
