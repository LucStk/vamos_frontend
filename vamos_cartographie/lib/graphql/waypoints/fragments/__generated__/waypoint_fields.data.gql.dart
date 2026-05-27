// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/graphql/media/fragments/__generated__/image_fields.data.gql.dart'
    as _i2;

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
  _i2.GImageFields get image;
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
      image: _i2.GImageFieldsData.fromJson(
          (json['image'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i2.GImageFieldsData image;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['image'] = this.image.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GWaypointFieldsData_images copyWith({
    _i2.GImageFieldsData? image,
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
