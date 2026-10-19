// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/geometry_mappers/geo_polygon_dto.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/geo_fields.data.gql.dart'
    as _i3;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/route/data/graphql/__generated__/route_fields.data.gql.dart'
    as _i4;
import 'package:vamos_cartographie/domain_features/stored_file/data/graphql/__generated__/file_storage_fields.data.gql.dart'
    as _i1;
import 'package:vamos_cartographie/domain_features/user_profile/data/graphql/__generated__/user_profile_fields.data.gql.dart'
    as _i2;

abstract class GTripFields {
  String get id;
  String get title;
  String? get date;
  String get description;
  List<_i1.GFileAttachment> get files;
  _i2.GUserProfileFields get owner;
  String get G__typename;
}

class GTripFieldsData implements GTripFields {
  const GTripFieldsData({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    required this.files,
    required this.owner,
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
      owner: _i2.GUserProfileFieldsData.fromJson(
          (json['owner'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String title;

  final String? date;

  final String description;

  final List<_i1.GFileAttachmentData> files;

  final _i2.GUserProfileFieldsData owner;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['title'] = this.title;
    final _$dateValue = this.date;
    _$result['date'] = _$dateValue == null ? null : _$dateValue;
    _$result['description'] = this.description;
    _$result['files'] = this.files.map((_$e) => _$e.toJson()).toList();
    _$result['owner'] = this.owner.toJson();
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
    _i2.GUserProfileFieldsData? owner,
    String? G__typename,
  }) {
    return GTripFieldsData(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date != null || dateIsSet ? date : this.date,
      description: description ?? this.description,
      files: files ?? this.files,
      owner: owner ?? this.owner,
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
            owner == other.owner &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, title, date, description,
        _gqlUtils.listHash(files), owner, G__typename);
  }

  @override
  String toString() {
    return 'GTripFieldsData(id: $id, title: $title, date: $date, description: $description, files: $files, owner: $owner, G__typename: $G__typename)';
  }
}

abstract class GTripWithRouteFields {
  String get id;
  String get title;
  String? get date;
  String get description;
  List<_i1.GFileAttachment> get files;
  _i2.GUserProfileFields get owner;
  String get G__typename;
  String? get routeUpdatedAt;
  GeoPolygonDto? get bounds;
  List<_i3.GLatLngFields> get route;
  List<_i4.GRouteSectionFields> get sections;
  List<_i4.GWaypointAnchorFields> get waypoints;
}

class GTripWithRouteFieldsData
    implements GTripWithRouteFields, GTripFields, _i4.GTripRouteFields {
  const GTripWithRouteFieldsData({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    required this.files,
    required this.owner,
    this.G__typename = 'TripType',
    this.routeUpdatedAt,
    this.bounds,
    required this.route,
    required this.sections,
    required this.waypoints,
  });

  factory GTripWithRouteFieldsData.fromJson(Map<String, dynamic> json) {
    return GTripWithRouteFieldsData(
      id: (json['id'] as String),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      files: (json['files'] as List<dynamic>)
          .map((_$e) =>
              _i1.GFileAttachmentData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      owner: _i2.GUserProfileFieldsData.fromJson(
          (json['owner'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
      routeUpdatedAt: json['routeUpdatedAt'] == null
          ? null
          : (json['routeUpdatedAt'] as String),
      bounds:
          json['bounds'] == null ? null : geoPolygonDtoFromJson(json['bounds']),
      route: (json['route'] as List<dynamic>)
          .map((_$e) =>
              _i3.GLatLngFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      sections: (json['sections'] as List<dynamic>)
          .map((_$e) => _i4.GRouteSectionFieldsData.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      waypoints: (json['waypoints'] as List<dynamic>)
          .map((_$e) => _i4.GWaypointAnchorFieldsData.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
    );
  }

  final String id;

  final String title;

  final String? date;

  final String description;

  final List<_i1.GFileAttachmentData> files;

  final _i2.GUserProfileFieldsData owner;

  final String G__typename;

  final String? routeUpdatedAt;

  final GeoPolygonDto? bounds;

  final List<_i3.GLatLngFieldsData> route;

  final List<_i4.GRouteSectionFieldsData> sections;

  final List<_i4.GWaypointAnchorFieldsData> waypoints;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['title'] = this.title;
    final _$dateValue = this.date;
    _$result['date'] = _$dateValue == null ? null : _$dateValue;
    _$result['description'] = this.description;
    _$result['files'] = this.files.map((_$e) => _$e.toJson()).toList();
    _$result['owner'] = this.owner.toJson();
    _$result['__typename'] = this.G__typename;
    final _$routeUpdatedAtValue = this.routeUpdatedAt;
    _$result['routeUpdatedAt'] =
        _$routeUpdatedAtValue == null ? null : _$routeUpdatedAtValue;
    final _$boundsValue = this.bounds;
    _$result['bounds'] =
        _$boundsValue == null ? null : geoPolygonDtoToJson(_$boundsValue);
    _$result['route'] = this.route.map((_$e) => _$e.toJson()).toList();
    _$result['sections'] = this.sections.map((_$e) => _$e.toJson()).toList();
    _$result['waypoints'] = this.waypoints.map((_$e) => _$e.toJson()).toList();
    return _$result;
  }

  GTripWithRouteFieldsData copyWith({
    String? id,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    List<_i1.GFileAttachmentData>? files,
    _i2.GUserProfileFieldsData? owner,
    String? G__typename,
    String? routeUpdatedAt,
    bool routeUpdatedAtIsSet = false,
    GeoPolygonDto? bounds,
    bool boundsIsSet = false,
    List<_i3.GLatLngFieldsData>? route,
    List<_i4.GRouteSectionFieldsData>? sections,
    List<_i4.GWaypointAnchorFieldsData>? waypoints,
  }) {
    return GTripWithRouteFieldsData(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date != null || dateIsSet ? date : this.date,
      description: description ?? this.description,
      files: files ?? this.files,
      owner: owner ?? this.owner,
      G__typename: G__typename ?? this.G__typename,
      routeUpdatedAt: routeUpdatedAt != null || routeUpdatedAtIsSet
          ? routeUpdatedAt
          : this.routeUpdatedAt,
      bounds: bounds != null || boundsIsSet ? bounds : this.bounds,
      route: route ?? this.route,
      sections: sections ?? this.sections,
      waypoints: waypoints ?? this.waypoints,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GTripWithRouteFieldsData &&
            id == other.id &&
            title == other.title &&
            date == other.date &&
            description == other.description &&
            _gqlUtils.listEquals(files, other.files) &&
            owner == other.owner &&
            G__typename == other.G__typename &&
            routeUpdatedAt == other.routeUpdatedAt &&
            bounds == other.bounds &&
            _gqlUtils.listEquals(route, other.route) &&
            _gqlUtils.listEquals(sections, other.sections) &&
            _gqlUtils.listEquals(waypoints, other.waypoints));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        title,
        date,
        description,
        _gqlUtils.listHash(files),
        owner,
        G__typename,
        routeUpdatedAt,
        bounds,
        _gqlUtils.listHash(route),
        _gqlUtils.listHash(sections),
        _gqlUtils.listHash(waypoints));
  }

  @override
  String toString() {
    return 'GTripWithRouteFieldsData(id: $id, title: $title, date: $date, description: $description, files: $files, owner: $owner, G__typename: $G__typename, routeUpdatedAt: $routeUpdatedAt, bounds: $bounds, route: $route, sections: $sections, waypoints: $waypoints)';
  }
}
