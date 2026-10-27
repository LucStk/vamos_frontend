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

abstract class GRouteSection {
  String get id;
  int get startIndex;
  _i1.GMobilityType get mobilityType;
  _i1.GGeometrySource get geometrySource;
  String get G__typename;
}

class GRouteSectionData implements GRouteSection {
  const GRouteSectionData({
    required this.id,
    required this.startIndex,
    required this.mobilityType,
    required this.geometrySource,
    this.G__typename = 'RouteSectionType',
  });

  factory GRouteSectionData.fromJson(Map<String, dynamic> json) {
    return GRouteSectionData(
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

  GRouteSectionData copyWith({
    String? id,
    int? startIndex,
    _i1.GMobilityType? mobilityType,
    _i1.GGeometrySource? geometrySource,
    String? G__typename,
  }) {
    return GRouteSectionData(
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
        (other is GRouteSectionData &&
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
    return 'GRouteSectionData(id: $id, startIndex: $startIndex, mobilityType: $mobilityType, geometrySource: $geometrySource, G__typename: $G__typename)';
  }
}

abstract class GTripRoute {
  String get id;
  String? get routeUpdatedAt;
  GeoPolygonDto? get bounds;
  _i2.GLatLng get startPoint;
  List<_i2.GLatLng> get route;
  List<GRouteSection> get sections;
  String get G__typename;
}

class GTripRouteData implements GTripRoute {
  const GTripRouteData({
    required this.id,
    this.routeUpdatedAt,
    this.bounds,
    required this.startPoint,
    required this.route,
    required this.sections,
    this.G__typename = 'TripType',
  });

  factory GTripRouteData.fromJson(Map<String, dynamic> json) {
    return GTripRouteData(
      id: (json['id'] as String),
      routeUpdatedAt: json['routeUpdatedAt'] == null
          ? null
          : (json['routeUpdatedAt'] as String),
      bounds:
          json['bounds'] == null ? null : geoPolygonDtoFromJson(json['bounds']),
      startPoint: _i2.GLatLngData.fromJson(
          (json['startPoint'] as Map<String, dynamic>)),
      route: (json['route'] as List<dynamic>)
          .map((_$e) => _i2.GLatLngData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      sections: (json['sections'] as List<dynamic>)
          .map((_$e) =>
              GRouteSectionData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String? routeUpdatedAt;

  final GeoPolygonDto? bounds;

  final _i2.GLatLngData startPoint;

  final List<_i2.GLatLngData> route;

  final List<GRouteSectionData> sections;

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
    _$result['startPoint'] = this.startPoint.toJson();
    _$result['route'] = this.route.map((_$e) => _$e.toJson()).toList();
    _$result['sections'] = this.sections.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GTripRouteData copyWith({
    String? id,
    String? routeUpdatedAt,
    bool routeUpdatedAtIsSet = false,
    GeoPolygonDto? bounds,
    bool boundsIsSet = false,
    _i2.GLatLngData? startPoint,
    List<_i2.GLatLngData>? route,
    List<GRouteSectionData>? sections,
    String? G__typename,
  }) {
    return GTripRouteData(
      id: id ?? this.id,
      routeUpdatedAt: routeUpdatedAt != null || routeUpdatedAtIsSet
          ? routeUpdatedAt
          : this.routeUpdatedAt,
      bounds: bounds != null || boundsIsSet ? bounds : this.bounds,
      startPoint: startPoint ?? this.startPoint,
      route: route ?? this.route,
      sections: sections ?? this.sections,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GTripRouteData &&
            id == other.id &&
            routeUpdatedAt == other.routeUpdatedAt &&
            bounds == other.bounds &&
            startPoint == other.startPoint &&
            _gqlUtils.listEquals(route, other.route) &&
            _gqlUtils.listEquals(sections, other.sections) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, routeUpdatedAt, bounds, startPoint,
        _gqlUtils.listHash(route), _gqlUtils.listHash(sections), G__typename);
  }

  @override
  String toString() {
    return 'GTripRouteData(id: $id, routeUpdatedAt: $routeUpdatedAt, bounds: $bounds, startPoint: $startPoint, route: $route, sections: $sections, G__typename: $G__typename)';
  }
}

abstract class GEditRouteResult {
  String get G__typename;
}

abstract class GEditRouteResult__asEditRouteSuccess
    implements GEditRouteResult {
  _i1.GRefinementError? get refinementError;
  GTripRoute get trip;
  String get G__typename;
}

abstract class GEditRouteResult__asEditRouteError implements GEditRouteResult {
  _i1.GRouteEditErrorCode get code;
  String get message;
  String get G__typename;
}

sealed class GEditRouteResultData implements GEditRouteResult {
  const GEditRouteResultData({required this.G__typename});

  factory GEditRouteResultData.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'EditRouteSuccess':
        return GEditRouteResultData__asEditRouteSuccess.fromJson(json);
      case 'EditRouteError':
        return GEditRouteResultData__asEditRouteError.fromJson(json);
      default:
        return GEditRouteResultData__unknown.fromJson(json);
    }
  }

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    return _$result;
  }
}

extension GEditRouteResultDataWhenExtension on GEditRouteResultData {
  _T when<_T>({
    required _T Function(GEditRouteResultData__asEditRouteSuccess)
        editRouteSuccess,
    required _T Function(GEditRouteResultData__asEditRouteError) editRouteError,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'EditRouteSuccess':
        return editRouteSuccess(
            this as GEditRouteResultData__asEditRouteSuccess);
      case 'EditRouteError':
        return editRouteError(this as GEditRouteResultData__asEditRouteError);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GEditRouteResultData__asEditRouteSuccess)? editRouteSuccess,
    _T Function(GEditRouteResultData__asEditRouteError)? editRouteError,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'EditRouteSuccess':
        return editRouteSuccess == null
            ? orElse()
            : editRouteSuccess(
                this as GEditRouteResultData__asEditRouteSuccess);
      case 'EditRouteError':
        return editRouteError == null
            ? orElse()
            : editRouteError(this as GEditRouteResultData__asEditRouteError);
      default:
        return orElse();
    }
  }
}

class GEditRouteResultData__asEditRouteSuccess extends GEditRouteResultData
    implements GEditRouteResult, GEditRouteResult__asEditRouteSuccess {
  GEditRouteResultData__asEditRouteSuccess({
    String G__typename = 'EditRouteSuccess',
    this.refinementError,
    required this.trip,
  }) : super(G__typename: G__typename);

  factory GEditRouteResultData__asEditRouteSuccess.fromJson(
      Map<String, dynamic> json) {
    return GEditRouteResultData__asEditRouteSuccess(
      G__typename: (json['__typename'] as String),
      refinementError: json['refinementError'] == null
          ? null
          : _i1.GRefinementError.fromJson((json['refinementError'] as String)),
      trip: GTripRouteData.fromJson((json['trip'] as Map<String, dynamic>)),
    );
  }

  final _i1.GRefinementError? refinementError;

  final GTripRouteData trip;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    final _$refinementErrorValue = this.refinementError;
    _$result['refinementError'] =
        _$refinementErrorValue == null ? null : _$refinementErrorValue.toJson();
    _$result['trip'] = this.trip.toJson();
    return _$result;
  }

  GEditRouteResultData__asEditRouteSuccess copyWith({
    String? G__typename,
    _i1.GRefinementError? refinementError,
    bool refinementErrorIsSet = false,
    GTripRouteData? trip,
  }) {
    return GEditRouteResultData__asEditRouteSuccess(
      G__typename: G__typename ?? this.G__typename,
      refinementError: refinementError != null || refinementErrorIsSet
          ? refinementError
          : this.refinementError,
      trip: trip ?? this.trip,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GEditRouteResultData__asEditRouteSuccess &&
            G__typename == other.G__typename &&
            refinementError == other.refinementError &&
            trip == other.trip);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, refinementError, trip);
  }

  @override
  String toString() {
    return 'GEditRouteResultData__asEditRouteSuccess(G__typename: $G__typename, refinementError: $refinementError, trip: $trip)';
  }
}

class GEditRouteResultData__asEditRouteError extends GEditRouteResultData
    implements GEditRouteResult, GEditRouteResult__asEditRouteError {
  GEditRouteResultData__asEditRouteError({
    String G__typename = 'EditRouteError',
    required this.code,
    required this.message,
  }) : super(G__typename: G__typename);

  factory GEditRouteResultData__asEditRouteError.fromJson(
      Map<String, dynamic> json) {
    return GEditRouteResultData__asEditRouteError(
      G__typename: (json['__typename'] as String),
      code: _i1.GRouteEditErrorCode.fromJson((json['code'] as String)),
      message: (json['message'] as String),
    );
  }

  final _i1.GRouteEditErrorCode code;

  final String message;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['code'] = this.code.toJson();
    _$result['message'] = this.message;
    return _$result;
  }

  GEditRouteResultData__asEditRouteError copyWith({
    String? G__typename,
    _i1.GRouteEditErrorCode? code,
    String? message,
  }) {
    return GEditRouteResultData__asEditRouteError(
      G__typename: G__typename ?? this.G__typename,
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GEditRouteResultData__asEditRouteError &&
            G__typename == other.G__typename &&
            code == other.code &&
            message == other.message);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, code, message);
  }

  @override
  String toString() {
    return 'GEditRouteResultData__asEditRouteError(G__typename: $G__typename, code: $code, message: $message)';
  }
}

class GEditRouteResultData__unknown extends GEditRouteResultData
    implements GEditRouteResult {
  GEditRouteResultData__unknown({required String G__typename})
      : super(G__typename: G__typename);

  factory GEditRouteResultData__unknown.fromJson(Map<String, dynamic> json) {
    return GEditRouteResultData__unknown(
        G__typename: (json['__typename'] as String));
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GEditRouteResultData__unknown copyWith({String? G__typename}) {
    return GEditRouteResultData__unknown(
        G__typename: G__typename ?? this.G__typename);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GEditRouteResultData__unknown &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename);
  }

  @override
  String toString() {
    return 'GEditRouteResultData__unknown(G__typename: $G__typename)';
  }
}
