// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/stored_file/data/graphql/__generated__/file_storage_fields.data.gql.dart'
    as _i1;
import 'package:vamos_cartographie/domain_features/topology/data/graphql/fields/__generated__/segment_fields.data.gql.dart'
    as _i3;
import 'package:vamos_cartographie/domain_features/topology/data/graphql/fields/__generated__/vertex_fields.data.gql.dart'
    as _i2;

abstract class GTripFields {
  String get id;
  String get title;
  String? get date;
  String get description;
  List<_i1.GFileAttachment> get files;
  String get G__typename;
}

class GTripFieldsData implements GTripFields {
  const GTripFieldsData({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    required this.files,
    this.G__typename = 'TripType',
  });

  factory GTripFieldsData.fromJson(Map<String, dynamic> json) {
    return GTripFieldsData(
      id: (json['id'] as String),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      files: (json['files'] as List<dynamic>)
          .map((_$e) =>
              _i1.GFileAttachmentData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String title;

  final String? date;

  final String description;

  final List<_i1.GFileAttachmentData> files;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['title'] = this.title;
    final _$dateValue = this.date;
    _$result['date'] = _$dateValue == null ? null : _$dateValue;
    _$result['description'] = this.description;
    _$result['files'] = this.files.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GTripFieldsData copyWith({
    String? id,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    List<_i1.GFileAttachmentData>? files,
    String? G__typename,
  }) {
    return GTripFieldsData(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date != null || dateIsSet ? date : this.date,
      description: description ?? this.description,
      files: files ?? this.files,
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
            _gqlUtils.listEquals(files, other.files) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, title, date, description,
        _gqlUtils.listHash(files), G__typename);
  }

  @override
  String toString() {
    return 'GTripFieldsData(id: $id, title: $title, date: $date, description: $description, files: $files, G__typename: $G__typename)';
  }
}

abstract class GTopologyFields {
  List<_i2.GVertexFields> get vertices;
  List<_i3.GSegmentFields> get segments;
  String get G__typename;
}

class GTopologyFieldsData implements GTopologyFields {
  const GTopologyFieldsData({
    required this.vertices,
    required this.segments,
    this.G__typename = 'TopologyType',
  });

  factory GTopologyFieldsData.fromJson(Map<String, dynamic> json) {
    return GTopologyFieldsData(
      vertices: (json['vertices'] as List<dynamic>)
          .map((_$e) =>
              _i2.GVertexFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      segments: (json['segments'] as List<dynamic>)
          .map((_$e) =>
              _i3.GSegmentFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<_i2.GVertexFieldsData> vertices;

  final List<_i3.GSegmentFieldsData> segments;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['vertices'] = this.vertices.map((_$e) => _$e.toJson()).toList();
    _$result['segments'] = this.segments.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GTopologyFieldsData copyWith({
    List<_i2.GVertexFieldsData>? vertices,
    List<_i3.GSegmentFieldsData>? segments,
    String? G__typename,
  }) {
    return GTopologyFieldsData(
      vertices: vertices ?? this.vertices,
      segments: segments ?? this.segments,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GTopologyFieldsData &&
            _gqlUtils.listEquals(vertices, other.vertices) &&
            _gqlUtils.listEquals(segments, other.segments) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(vertices),
        _gqlUtils.listHash(segments), G__typename);
  }

  @override
  String toString() {
    return 'GTopologyFieldsData(vertices: $vertices, segments: $segments, G__typename: $G__typename)';
  }
}
