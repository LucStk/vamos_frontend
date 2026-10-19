// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/stored_file/data/graphql/__generated__/file_storage_fields.data.gql.dart'
    as _i2;

abstract class GWaypointFields {
  String get id;
  int? get anchorEdge;
  double get anchorOffset;
  _i1.GPoiCategory get poiCategory;
  String get title;
  String get description;
  Object get location;
  List<_i2.GFileAttachment> get files;
  String get G__typename;
}

class GWaypointFieldsData implements GWaypointFields {
  const GWaypointFieldsData({
    required this.id,
    this.anchorEdge,
    required this.anchorOffset,
    required this.poiCategory,
    required this.title,
    required this.description,
    required this.location,
    required this.files,
    this.G__typename = 'WaypointType',
  });

  factory GWaypointFieldsData.fromJson(Map<String, dynamic> json) {
    return GWaypointFieldsData(
      id: (json['id'] as String),
      anchorEdge:
          json['anchorEdge'] == null ? null : (json['anchorEdge'] as int),
      anchorOffset: (json['anchorOffset'] as num).toDouble(),
      poiCategory: _i1.GPoiCategory.fromJson((json['poiCategory'] as String)),
      title: (json['title'] as String),
      description: (json['description'] as String),
      location: (json['location'] as Object),
      files: (json['files'] as List<dynamic>)
          .map((_$e) =>
              _i2.GFileAttachmentData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final int? anchorEdge;

  final double anchorOffset;

  final _i1.GPoiCategory poiCategory;

  final String title;

  final String description;

  final Object location;

  final List<_i2.GFileAttachmentData> files;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    final _$anchorEdgeValue = this.anchorEdge;
    _$result['anchorEdge'] =
        _$anchorEdgeValue == null ? null : _$anchorEdgeValue;
    _$result['anchorOffset'] = this.anchorOffset;
    _$result['poiCategory'] = this.poiCategory.toJson();
    _$result['title'] = this.title;
    _$result['description'] = this.description;
    _$result['location'] = this.location;
    _$result['files'] = this.files.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GWaypointFieldsData copyWith({
    String? id,
    int? anchorEdge,
    bool anchorEdgeIsSet = false,
    double? anchorOffset,
    _i1.GPoiCategory? poiCategory,
    String? title,
    String? description,
    Object? location,
    List<_i2.GFileAttachmentData>? files,
    String? G__typename,
  }) {
    return GWaypointFieldsData(
      id: id ?? this.id,
      anchorEdge:
          anchorEdge != null || anchorEdgeIsSet ? anchorEdge : this.anchorEdge,
      anchorOffset: anchorOffset ?? this.anchorOffset,
      poiCategory: poiCategory ?? this.poiCategory,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      files: files ?? this.files,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GWaypointFieldsData &&
            id == other.id &&
            anchorEdge == other.anchorEdge &&
            anchorOffset == other.anchorOffset &&
            poiCategory == other.poiCategory &&
            title == other.title &&
            description == other.description &&
            location == other.location &&
            _gqlUtils.listEquals(files, other.files) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, anchorEdge, anchorOffset, poiCategory,
        title, description, location, _gqlUtils.listHash(files), G__typename);
  }

  @override
  String toString() {
    return 'GWaypointFieldsData(id: $id, anchorEdge: $anchorEdge, anchorOffset: $anchorOffset, poiCategory: $poiCategory, title: $title, description: $description, location: $location, files: $files, G__typename: $G__typename)';
  }
}
