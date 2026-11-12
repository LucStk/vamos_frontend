// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/geo_fields.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/stored_file/data/graphql/__generated__/file_storage_fields.data.gql.dart'
    as _i3;

abstract class GWaypointDetails {
  String get id;
  double get anchorPosition;
  _i1.GPoiCategory get poiCategory;
  String get title;
  String get description;
  _i2.GLatLng get location;
  List<_i3.GFileAttachment> get files;
  String get G__typename;
}

class GWaypointDetailsData implements GWaypointDetails {
  const GWaypointDetailsData({
    required this.id,
    required this.anchorPosition,
    required this.poiCategory,
    required this.title,
    required this.description,
    required this.location,
    required this.files,
    this.G__typename = 'WaypointType',
  });

  factory GWaypointDetailsData.fromJson(Map<String, dynamic> json) {
    return GWaypointDetailsData(
      id: (json['id'] as String),
      anchorPosition: (json['anchorPosition'] as num).toDouble(),
      poiCategory: _i1.GPoiCategory.fromJson((json['poiCategory'] as String)),
      title: (json['title'] as String),
      description: (json['description'] as String),
      location:
          _i2.GLatLngData.fromJson((json['location'] as Map<String, dynamic>)),
      files: (json['files'] as List<dynamic>)
          .map((_$e) =>
              _i3.GFileAttachmentData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final double anchorPosition;

  final _i1.GPoiCategory poiCategory;

  final String title;

  final String description;

  final _i2.GLatLngData location;

  final List<_i3.GFileAttachmentData> files;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['anchorPosition'] = this.anchorPosition;
    _$result['poiCategory'] = this.poiCategory.toJson();
    _$result['title'] = this.title;
    _$result['description'] = this.description;
    _$result['location'] = this.location.toJson();
    _$result['files'] = this.files.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GWaypointDetailsData copyWith({
    String? id,
    double? anchorPosition,
    _i1.GPoiCategory? poiCategory,
    String? title,
    String? description,
    _i2.GLatLngData? location,
    List<_i3.GFileAttachmentData>? files,
    String? G__typename,
  }) {
    return GWaypointDetailsData(
      id: id ?? this.id,
      anchorPosition: anchorPosition ?? this.anchorPosition,
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
        (other is GWaypointDetailsData &&
            id == other.id &&
            anchorPosition == other.anchorPosition &&
            poiCategory == other.poiCategory &&
            title == other.title &&
            description == other.description &&
            location == other.location &&
            _gqlUtils.listEquals(files, other.files) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, anchorPosition, poiCategory, title,
        description, location, _gqlUtils.listHash(files), G__typename);
  }

  @override
  String toString() {
    return 'GWaypointDetailsData(id: $id, anchorPosition: $anchorPosition, poiCategory: $poiCategory, title: $title, description: $description, location: $location, files: $files, G__typename: $G__typename)';
  }
}
