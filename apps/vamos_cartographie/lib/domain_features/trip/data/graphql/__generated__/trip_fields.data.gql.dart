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
import 'package:vamos_cartographie/domain_features/waypoint/data/graphql/__generated__/waypoint_fields.data.gql.dart'
    as _i5;

abstract class GTripSummary {
  String get id;
  String get title;
  String? get date;
  String get description;
  List<_i1.GFileAttachment> get files;
  _i2.GUserProfileDetails get owner;
  String get G__typename;
}

class GTripSummaryData implements GTripSummary {
  const GTripSummaryData({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    required this.files,
    required this.owner,
    this.G__typename = 'TripType',
  });

  factory GTripSummaryData.fromJson(Map<String, dynamic> json) {
    return GTripSummaryData(
      id: (json['id'] as String),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      files: (json['files'] as List<dynamic>)
          .map((_$e) =>
              _i1.GFileAttachmentData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      owner: _i2.GUserProfileDetailsData.fromJson(
          (json['owner'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String title;

  final String? date;

  final String description;

  final List<_i1.GFileAttachmentData> files;

  final _i2.GUserProfileDetailsData owner;

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

  GTripSummaryData copyWith({
    String? id,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    List<_i1.GFileAttachmentData>? files,
    _i2.GUserProfileDetailsData? owner,
    String? G__typename,
  }) {
    return GTripSummaryData(
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
        (other is GTripSummaryData &&
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
    return 'GTripSummaryData(id: $id, title: $title, date: $date, description: $description, files: $files, owner: $owner, G__typename: $G__typename)';
  }
}

abstract class GTripFull {
  String get id;
  String get title;
  String? get date;
  String get description;
  List<_i1.GFileAttachment> get files;
  _i2.GUserProfileDetails get owner;
  String get G__typename;
  String? get routeUpdatedAt;
  GeoPolygonDto? get bounds;
  _i3.GLatLng get startPoint;
  List<_i3.GLatLng> get route;
  List<_i4.GRouteSection> get sections;
  List<_i5.GWaypointDetails> get waypoints;
}

class GTripFullData implements GTripFull, GTripSummary, _i4.GTripRoute {
  const GTripFullData({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    required this.files,
    required this.owner,
    this.G__typename = 'TripType',
    this.routeUpdatedAt,
    this.bounds,
    required this.startPoint,
    required this.route,
    required this.sections,
    required this.waypoints,
  });

  factory GTripFullData.fromJson(Map<String, dynamic> json) {
    return GTripFullData(
      id: (json['id'] as String),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      files: (json['files'] as List<dynamic>)
          .map((_$e) =>
              _i1.GFileAttachmentData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      owner: _i2.GUserProfileDetailsData.fromJson(
          (json['owner'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
      routeUpdatedAt: json['routeUpdatedAt'] == null
          ? null
          : (json['routeUpdatedAt'] as String),
      bounds:
          json['bounds'] == null ? null : geoPolygonDtoFromJson(json['bounds']),
      startPoint: _i3.GLatLngData.fromJson(
          (json['startPoint'] as Map<String, dynamic>)),
      route: (json['route'] as List<dynamic>)
          .map((_$e) => _i3.GLatLngData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      sections: (json['sections'] as List<dynamic>)
          .map((_$e) =>
              _i4.GRouteSectionData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      waypoints: (json['waypoints'] as List<dynamic>)
          .map((_$e) =>
              _i5.GWaypointDetailsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
    );
  }

  final String id;

  final String title;

  final String? date;

  final String description;

  final List<_i1.GFileAttachmentData> files;

  final _i2.GUserProfileDetailsData owner;

  final String G__typename;

  final String? routeUpdatedAt;

  final GeoPolygonDto? bounds;

  final _i3.GLatLngData startPoint;

  final List<_i3.GLatLngData> route;

  final List<_i4.GRouteSectionData> sections;

  final List<_i5.GWaypointDetailsData> waypoints;

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
    _$result['startPoint'] = this.startPoint.toJson();
    _$result['route'] = this.route.map((_$e) => _$e.toJson()).toList();
    _$result['sections'] = this.sections.map((_$e) => _$e.toJson()).toList();
    _$result['waypoints'] = this.waypoints.map((_$e) => _$e.toJson()).toList();
    return _$result;
  }

  GTripFullData copyWith({
    String? id,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    List<_i1.GFileAttachmentData>? files,
    _i2.GUserProfileDetailsData? owner,
    String? G__typename,
    String? routeUpdatedAt,
    bool routeUpdatedAtIsSet = false,
    GeoPolygonDto? bounds,
    bool boundsIsSet = false,
    _i3.GLatLngData? startPoint,
    List<_i3.GLatLngData>? route,
    List<_i4.GRouteSectionData>? sections,
    List<_i5.GWaypointDetailsData>? waypoints,
  }) {
    return GTripFullData(
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
      startPoint: startPoint ?? this.startPoint,
      route: route ?? this.route,
      sections: sections ?? this.sections,
      waypoints: waypoints ?? this.waypoints,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GTripFullData &&
            id == other.id &&
            title == other.title &&
            date == other.date &&
            description == other.description &&
            _gqlUtils.listEquals(files, other.files) &&
            owner == other.owner &&
            G__typename == other.G__typename &&
            routeUpdatedAt == other.routeUpdatedAt &&
            bounds == other.bounds &&
            startPoint == other.startPoint &&
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
        startPoint,
        _gqlUtils.listHash(route),
        _gqlUtils.listHash(sections),
        _gqlUtils.listHash(waypoints));
  }

  @override
  String toString() {
    return 'GTripFullData(id: $id, title: $title, date: $date, description: $description, files: $files, owner: $owner, G__typename: $G__typename, routeUpdatedAt: $routeUpdatedAt, bounds: $bounds, startPoint: $startPoint, route: $route, sections: $sections, waypoints: $waypoints)';
  }
}
