// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/graphql/media/fragments/__generated__/image_fields.data.gql.dart'
    as _i3;
import 'package:vamos_cartographie/graphql/topology/vertex/__generated__/vertex_fields.data.gql.dart'
    as _i2;

abstract class GWaypointFields {
  int get id;
  _i1.GWaypointEnum get type;
  String get title;
  String get description;
  _i2.GVertexFields get vertex;
  List<GWaypointFields_images> get images;
  String get G__typename;
}

abstract class GWaypointFields_images {
  _i3.GImageFields get image;
  String get G__typename;
}

class GWaypointFieldsData implements GWaypointFields {
  const GWaypointFieldsData({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.vertex,
    required this.images,
    this.G__typename = 'WaypointType',
  });

  factory GWaypointFieldsData.fromJson(Map<String, dynamic> json) {
    return GWaypointFieldsData(
      id: (json['id'] as int),
      type: _i1.GWaypointEnum.fromJson((json['type'] as String)),
      title: (json['title'] as String),
      description: (json['description'] as String),
      vertex: _i2.GVertexFieldsData.fromJson(
        (json['vertex'] as Map<String, dynamic>),
      ),
      images: (json['images'] as List<dynamic>)
          .map(
            (_$e) => GWaypointFieldsData_images.fromJson(
              (_$e as Map<String, dynamic>),
            ),
          )
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final int id;

  final _i1.GWaypointEnum type;

  final String title;

  final String description;

  final _i2.GVertexFieldsData vertex;

  final List<GWaypointFieldsData_images> images;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['type'] = this.type.toJson();
    _$result['title'] = this.title;
    _$result['description'] = this.description;
    _$result['vertex'] = this.vertex.toJson();
    _$result['images'] = this.images.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GWaypointFieldsData copyWith({
    int? id,
    _i1.GWaypointEnum? type,
    String? title,
    String? description,
    _i2.GVertexFieldsData? vertex,
    List<GWaypointFieldsData_images>? images,
    String? G__typename,
  }) {
    return GWaypointFieldsData(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      vertex: vertex ?? this.vertex,
      images: images ?? this.images,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GWaypointFieldsData &&
            id == other.id &&
            type == other.type &&
            title == other.title &&
            description == other.description &&
            vertex == other.vertex &&
            _gqlUtils.listEquals(images, other.images) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      id,
      type,
      title,
      description,
      vertex,
      _gqlUtils.listHash(images),
      G__typename,
    );
  }

  @override
  String toString() {
    return 'GWaypointFieldsData(id: $id, type: $type, title: $title, description: $description, vertex: $vertex, images: $images, G__typename: $G__typename)';
  }
}

class GWaypointFieldsData_images implements GWaypointFields_images {
  const GWaypointFieldsData_images({
    required this.image,
    this.G__typename = 'WaypointImageType',
  });

  factory GWaypointFieldsData_images.fromJson(Map<String, dynamic> json) {
    return GWaypointFieldsData_images(
      image: _i3.GImageFieldsData.fromJson(
        (json['image'] as Map<String, dynamic>),
      ),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i3.GImageFieldsData image;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['image'] = this.image.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GWaypointFieldsData_images copyWith({
    _i3.GImageFieldsData? image,
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

abstract class GCreateWaypointPayloadFields {
  GWaypointFields get waypoint;
  _i2.GVertexFields get vertex;
  String get G__typename;
}

class GCreateWaypointPayloadFieldsData implements GCreateWaypointPayloadFields {
  const GCreateWaypointPayloadFieldsData({
    required this.waypoint,
    required this.vertex,
    this.G__typename = 'CreateWaypointPayload',
  });

  factory GCreateWaypointPayloadFieldsData.fromJson(Map<String, dynamic> json) {
    return GCreateWaypointPayloadFieldsData(
      waypoint: GWaypointFieldsData.fromJson(
        (json['waypoint'] as Map<String, dynamic>),
      ),
      vertex: _i2.GVertexFieldsData.fromJson(
        (json['vertex'] as Map<String, dynamic>),
      ),
      G__typename: (json['__typename'] as String),
    );
  }

  final GWaypointFieldsData waypoint;

  final _i2.GVertexFieldsData vertex;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['waypoint'] = this.waypoint.toJson();
    _$result['vertex'] = this.vertex.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateWaypointPayloadFieldsData copyWith({
    GWaypointFieldsData? waypoint,
    _i2.GVertexFieldsData? vertex,
    String? G__typename,
  }) {
    return GCreateWaypointPayloadFieldsData(
      waypoint: waypoint ?? this.waypoint,
      vertex: vertex ?? this.vertex,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateWaypointPayloadFieldsData &&
            waypoint == other.waypoint &&
            vertex == other.vertex &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, waypoint, vertex, G__typename);
  }

  @override
  String toString() {
    return 'GCreateWaypointPayloadFieldsData(waypoint: $waypoint, vertex: $vertex, G__typename: $G__typename)';
  }
}
