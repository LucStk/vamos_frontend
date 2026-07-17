// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/stored_file/data/graphql/__generated__/file_storage_fields.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/topology/data/graphql/fields/__generated__/vertex_fields.data.gql.dart'
    as _i3;

abstract class GWaypointFields {
  String get id;
  _i1.GPoiCategory get poiCategory;
  String get title;
  String get description;
  List<_i2.GFileAttachment> get files;
  _i3.GVertexFields get vertex;
  String get G__typename;
}

class GWaypointFieldsData implements GWaypointFields {
  const GWaypointFieldsData({
    required this.id,
    required this.poiCategory,
    required this.title,
    required this.description,
    required this.files,
    required this.vertex,
    this.G__typename = 'WaypointType',
  });

  factory GWaypointFieldsData.fromJson(Map<String, dynamic> json) {
    return GWaypointFieldsData(
      id: (json['id'] as String),
      poiCategory: _i1.GPoiCategory.fromJson((json['poiCategory'] as String)),
      title: (json['title'] as String),
      description: (json['description'] as String),
      files: (json['files'] as List<dynamic>)
          .map((_$e) =>
              _i2.GFileAttachmentData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      vertex: _i3.GVertexFieldsData.fromJson(
          (json['vertex'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final _i1.GPoiCategory poiCategory;

  final String title;

  final String description;

  final List<_i2.GFileAttachmentData> files;

  final _i3.GVertexFieldsData vertex;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['poiCategory'] = this.poiCategory.toJson();
    _$result['title'] = this.title;
    _$result['description'] = this.description;
    _$result['files'] = this.files.map((_$e) => _$e.toJson()).toList();
    _$result['vertex'] = this.vertex.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GWaypointFieldsData copyWith({
    String? id,
    _i1.GPoiCategory? poiCategory,
    String? title,
    String? description,
    List<_i2.GFileAttachmentData>? files,
    _i3.GVertexFieldsData? vertex,
    String? G__typename,
  }) {
    return GWaypointFieldsData(
      id: id ?? this.id,
      poiCategory: poiCategory ?? this.poiCategory,
      title: title ?? this.title,
      description: description ?? this.description,
      files: files ?? this.files,
      vertex: vertex ?? this.vertex,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GWaypointFieldsData &&
            id == other.id &&
            poiCategory == other.poiCategory &&
            title == other.title &&
            description == other.description &&
            _gqlUtils.listEquals(files, other.files) &&
            vertex == other.vertex &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, poiCategory, title, description,
        _gqlUtils.listHash(files), vertex, G__typename);
  }

  @override
  String toString() {
    return 'GWaypointFieldsData(id: $id, poiCategory: $poiCategory, title: $title, description: $description, files: $files, vertex: $vertex, G__typename: $G__typename)';
  }
}

abstract class GCreateWaypointPayloadFields {
  GWaypointFields get waypoint;
  _i3.GVertexFields get vertex;
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
          (json['waypoint'] as Map<String, dynamic>)),
      vertex: _i3.GVertexFieldsData.fromJson(
          (json['vertex'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GWaypointFieldsData waypoint;

  final _i3.GVertexFieldsData vertex;

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
    _i3.GVertexFieldsData? vertex,
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
