// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/geometry_mappers/geo_polygon_dto.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/geo_fields.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

abstract class GRouteSectionFields {
  String get id;
  int get startIndex;
  _i1.GMobilityType get mobilityType;
  _i1.GGeometrySource get geometrySource;
  String get G__typename;
}

class GRouteSectionFieldsData implements GRouteSectionFields {
  const GRouteSectionFieldsData({
    required this.id,
    required this.startIndex,
    required this.mobilityType,
    required this.geometrySource,
    this.G__typename = 'RouteSectionType',
  });

  factory GRouteSectionFieldsData.fromJson(Map<String, dynamic> json) {
    return GRouteSectionFieldsData(
      id: (json['id'] as String),
      startIndex: (json['startIndex'] as int),
      mobilityType:
          _i1.GMobilityType.fromJson((json['mobilityType'] as String)),
      geometrySource:
          _i1.GGeometrySource.fromJson((json['geometrySource'] as String)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final int startIndex;

  final _i1.GMobilityType mobilityType;

  final _i1.GGeometrySource geometrySource;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['startIndex'] = this.startIndex;
    _$result['mobilityType'] = this.mobilityType.toJson();
    _$result['geometrySource'] = this.geometrySource.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GRouteSectionFieldsData copyWith({
    String? id,
    int? startIndex,
    _i1.GMobilityType? mobilityType,
    _i1.GGeometrySource? geometrySource,
    String? G__typename,
  }) {
    return GRouteSectionFieldsData(
      id: id ?? this.id,
      startIndex: startIndex ?? this.startIndex,
      mobilityType: mobilityType ?? this.mobilityType,
      geometrySource: geometrySource ?? this.geometrySource,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRouteSectionFieldsData &&
            id == other.id &&
            startIndex == other.startIndex &&
            mobilityType == other.mobilityType &&
            geometrySource == other.geometrySource &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, startIndex, mobilityType, geometrySource, G__typename);
  }

  @override
  String toString() {
    return 'GRouteSectionFieldsData(id: $id, startIndex: $startIndex, mobilityType: $mobilityType, geometrySource: $geometrySource, G__typename: $G__typename)';
  }
}

abstract class GWaypointAnchorFields {
  String get id;
  int? get anchorEdge;
  double get anchorOffset;
  String get G__typename;
}

class GWaypointAnchorFieldsData implements GWaypointAnchorFields {
  const GWaypointAnchorFieldsData({
    required this.id,
    this.anchorEdge,
    required this.anchorOffset,
    this.G__typename = 'WaypointType',
  });

  factory GWaypointAnchorFieldsData.fromJson(Map<String, dynamic> json) {
    return GWaypointAnchorFieldsData(
      id: (json['id'] as String),
      anchorEdge:
          json['anchorEdge'] == null ? null : (json['anchorEdge'] as int),
      anchorOffset: (json['anchorOffset'] as num).toDouble(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final int? anchorEdge;

  final double anchorOffset;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    final _$anchorEdgeValue = this.anchorEdge;
    _$result['anchorEdge'] =
        _$anchorEdgeValue == null ? null : _$anchorEdgeValue;
    _$result['anchorOffset'] = this.anchorOffset;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GWaypointAnchorFieldsData copyWith({
    String? id,
    int? anchorEdge,
    bool anchorEdgeIsSet = false,
    double? anchorOffset,
    String? G__typename,
  }) {
    return GWaypointAnchorFieldsData(
      id: id ?? this.id,
      anchorEdge:
          anchorEdge != null || anchorEdgeIsSet ? anchorEdge : this.anchorEdge,
      anchorOffset: anchorOffset ?? this.anchorOffset,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GWaypointAnchorFieldsData &&
            id == other.id &&
            anchorEdge == other.anchorEdge &&
            anchorOffset == other.anchorOffset &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, anchorEdge, anchorOffset, G__typename);
  }

  @override
  String toString() {
    return 'GWaypointAnchorFieldsData(id: $id, anchorEdge: $anchorEdge, anchorOffset: $anchorOffset, G__typename: $G__typename)';
  }
}

abstract class GTripRouteFields {
  String get id;
  String? get routeUpdatedAt;
  GeoPolygonDto? get bounds;
  List<_i2.GLatLngFields> get route;
  List<GRouteSectionFields> get sections;
  List<GWaypointAnchorFields> get waypoints;
  String get G__typename;
}

class GTripRouteFieldsData implements GTripRouteFields {
  const GTripRouteFieldsData({
    required this.id,
    this.routeUpdatedAt,
    this.bounds,
    required this.route,
    required this.sections,
    required this.waypoints,
    this.G__typename = 'TripType',
  });

  factory GTripRouteFieldsData.fromJson(Map<String, dynamic> json) {
    return GTripRouteFieldsData(
      id: (json['id'] as String),
      routeUpdatedAt: json['routeUpdatedAt'] == null
          ? null
          : (json['routeUpdatedAt'] as String),
      bounds:
          json['bounds'] == null ? null : geoPolygonDtoFromJson(json['bounds']),
      route: (json['route'] as List<dynamic>)
          .map((_$e) =>
              _i2.GLatLngFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      sections: (json['sections'] as List<dynamic>)
          .map((_$e) =>
              GRouteSectionFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      waypoints: (json['waypoints'] as List<dynamic>)
          .map((_$e) =>
              GWaypointAnchorFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String? routeUpdatedAt;

  final GeoPolygonDto? bounds;

  final List<_i2.GLatLngFieldsData> route;

  final List<GRouteSectionFieldsData> sections;

  final List<GWaypointAnchorFieldsData> waypoints;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    final _$routeUpdatedAtValue = this.routeUpdatedAt;
    _$result['routeUpdatedAt'] =
        _$routeUpdatedAtValue == null ? null : _$routeUpdatedAtValue;
    final _$boundsValue = this.bounds;
    _$result['bounds'] =
        _$boundsValue == null ? null : geoPolygonDtoToJson(_$boundsValue);
    _$result['route'] = this.route.map((_$e) => _$e.toJson()).toList();
    _$result['sections'] = this.sections.map((_$e) => _$e.toJson()).toList();
    _$result['waypoints'] = this.waypoints.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GTripRouteFieldsData copyWith({
    String? id,
    String? routeUpdatedAt,
    bool routeUpdatedAtIsSet = false,
    GeoPolygonDto? bounds,
    bool boundsIsSet = false,
    List<_i2.GLatLngFieldsData>? route,
    List<GRouteSectionFieldsData>? sections,
    List<GWaypointAnchorFieldsData>? waypoints,
    String? G__typename,
  }) {
    return GTripRouteFieldsData(
      id: id ?? this.id,
      routeUpdatedAt: routeUpdatedAt != null || routeUpdatedAtIsSet
          ? routeUpdatedAt
          : this.routeUpdatedAt,
      bounds: bounds != null || boundsIsSet ? bounds : this.bounds,
      route: route ?? this.route,
      sections: sections ?? this.sections,
      waypoints: waypoints ?? this.waypoints,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GTripRouteFieldsData &&
            id == other.id &&
            routeUpdatedAt == other.routeUpdatedAt &&
            bounds == other.bounds &&
            _gqlUtils.listEquals(route, other.route) &&
            _gqlUtils.listEquals(sections, other.sections) &&
            _gqlUtils.listEquals(waypoints, other.waypoints) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        routeUpdatedAt,
        bounds,
        _gqlUtils.listHash(route),
        _gqlUtils.listHash(sections),
        _gqlUtils.listHash(waypoints),
        G__typename);
  }

  @override
  String toString() {
    return 'GTripRouteFieldsData(id: $id, routeUpdatedAt: $routeUpdatedAt, bounds: $bounds, route: $route, sections: $sections, waypoints: $waypoints, G__typename: $G__typename)';
  }
}

abstract class GEditRoutePayloadFragment {
  bool get refinementFailed;
  String? get errorMessage;
  GTripRouteFields get trip;
  String get G__typename;
}

class GEditRoutePayloadFragmentData implements GEditRoutePayloadFragment {
  const GEditRoutePayloadFragmentData({
    required this.refinementFailed,
    this.errorMessage,
    required this.trip,
    this.G__typename = 'EditRoutePayload',
  });

  factory GEditRoutePayloadFragmentData.fromJson(Map<String, dynamic> json) {
    return GEditRoutePayloadFragmentData(
      refinementFailed: (json['refinementFailed'] as bool),
      errorMessage: json['errorMessage'] == null
          ? null
          : (json['errorMessage'] as String),
      trip:
          GTripRouteFieldsData.fromJson((json['trip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final bool refinementFailed;

  final String? errorMessage;

  final GTripRouteFieldsData trip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['refinementFailed'] = this.refinementFailed;
    final _$errorMessageValue = this.errorMessage;
    _$result['errorMessage'] =
        _$errorMessageValue == null ? null : _$errorMessageValue;
    _$result['trip'] = this.trip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GEditRoutePayloadFragmentData copyWith({
    bool? refinementFailed,
    String? errorMessage,
    bool errorMessageIsSet = false,
    GTripRouteFieldsData? trip,
    String? G__typename,
  }) {
    return GEditRoutePayloadFragmentData(
      refinementFailed: refinementFailed ?? this.refinementFailed,
      errorMessage: errorMessage != null || errorMessageIsSet
          ? errorMessage
          : this.errorMessage,
      trip: trip ?? this.trip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GEditRoutePayloadFragmentData &&
            refinementFailed == other.refinementFailed &&
            errorMessage == other.errorMessage &&
            trip == other.trip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, refinementFailed, errorMessage, trip, G__typename);
  }

  @override
  String toString() {
    return 'GEditRoutePayloadFragmentData(refinementFailed: $refinementFailed, errorMessage: $errorMessage, trip: $trip, G__typename: $G__typename)';
  }
}
