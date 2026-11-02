// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/geo_fields.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/core/mappers/geometry_mappers/geo_polygon_dto.dart';

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

abstract class GPreviewSection {
  bool get isNew;
  int get startIndex;
  _i1.GMobilityType get mobilityType;
  _i1.GGeometrySource get geometrySource;
  String get G__typename;
}

class GPreviewSectionData implements GPreviewSection {
  const GPreviewSectionData({
    required this.isNew,
    required this.startIndex,
    required this.mobilityType,
    required this.geometrySource,
    this.G__typename = 'PreviewSectionType',
  });

  factory GPreviewSectionData.fromJson(Map<String, dynamic> json) {
    return GPreviewSectionData(
      isNew: (json['isNew'] as bool),
      startIndex: (json['startIndex'] as int),
      mobilityType:
          _i1.GMobilityType.fromJson((json['mobilityType'] as String)),
      geometrySource:
          _i1.GGeometrySource.fromJson((json['geometrySource'] as String)),
      G__typename: (json['__typename'] as String),
    );
  }

  final bool isNew;

  final int startIndex;

  final _i1.GMobilityType mobilityType;

  final _i1.GGeometrySource geometrySource;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['isNew'] = this.isNew;
    _$result['startIndex'] = this.startIndex;
    _$result['mobilityType'] = this.mobilityType.toJson();
    _$result['geometrySource'] = this.geometrySource.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GPreviewSectionData copyWith({
    bool? isNew,
    int? startIndex,
    _i1.GMobilityType? mobilityType,
    _i1.GGeometrySource? geometrySource,
    String? G__typename,
  }) {
    return GPreviewSectionData(
      isNew: isNew ?? this.isNew,
      startIndex: startIndex ?? this.startIndex,
      mobilityType: mobilityType ?? this.mobilityType,
      geometrySource: geometrySource ?? this.geometrySource,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPreviewSectionData &&
            isNew == other.isNew &&
            startIndex == other.startIndex &&
            mobilityType == other.mobilityType &&
            geometrySource == other.geometrySource &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, isNew, startIndex, mobilityType,
        geometrySource, G__typename);
  }

  @override
  String toString() {
    return 'GPreviewSectionData(isNew: $isNew, startIndex: $startIndex, mobilityType: $mobilityType, geometrySource: $geometrySource, G__typename: $G__typename)';
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
  _i1.GRefinementFailure? get refinementError;
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
          : _i1.GRefinementFailure.fromJson(
              (json['refinementError'] as String)),
      trip: GTripRouteData.fromJson((json['trip'] as Map<String, dynamic>)),
    );
  }

  final _i1.GRefinementFailure? refinementError;

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
    _i1.GRefinementFailure? refinementError,
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

abstract class GRoutePreviewResult {
  String get G__typename;
}

abstract class GRoutePreviewResult__asRoutePreviewSuccess
    implements GRoutePreviewResult {
  String get proposalId;
  List<_i2.GLatLng> get coordinates;
  List<GPreviewSection> get sections;
  _i1.GRefinementFailure? get refinementError;
  String get G__typename;
}

abstract class GRoutePreviewResult__asEditRouteError
    implements GRoutePreviewResult {
  _i1.GRouteEditErrorCode get code;
  String get message;
  String get G__typename;
}

sealed class GRoutePreviewResultData implements GRoutePreviewResult {
  const GRoutePreviewResultData({required this.G__typename});

  factory GRoutePreviewResultData.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'RoutePreviewSuccess':
        return GRoutePreviewResultData__asRoutePreviewSuccess.fromJson(json);
      case 'EditRouteError':
        return GRoutePreviewResultData__asEditRouteError.fromJson(json);
      default:
        return GRoutePreviewResultData__unknown.fromJson(json);
    }
  }

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    return _$result;
  }
}

extension GRoutePreviewResultDataWhenExtension on GRoutePreviewResultData {
  _T when<_T>({
    required _T Function(GRoutePreviewResultData__asRoutePreviewSuccess)
        routePreviewSuccess,
    required _T Function(GRoutePreviewResultData__asEditRouteError)
        editRouteError,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'RoutePreviewSuccess':
        return routePreviewSuccess(
            this as GRoutePreviewResultData__asRoutePreviewSuccess);
      case 'EditRouteError':
        return editRouteError(
            this as GRoutePreviewResultData__asEditRouteError);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GRoutePreviewResultData__asRoutePreviewSuccess)?
        routePreviewSuccess,
    _T Function(GRoutePreviewResultData__asEditRouteError)? editRouteError,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'RoutePreviewSuccess':
        return routePreviewSuccess == null
            ? orElse()
            : routePreviewSuccess(
                this as GRoutePreviewResultData__asRoutePreviewSuccess);
      case 'EditRouteError':
        return editRouteError == null
            ? orElse()
            : editRouteError(this as GRoutePreviewResultData__asEditRouteError);
      default:
        return orElse();
    }
  }
}

class GRoutePreviewResultData__asRoutePreviewSuccess
    extends GRoutePreviewResultData
    implements GRoutePreviewResult, GRoutePreviewResult__asRoutePreviewSuccess {
  GRoutePreviewResultData__asRoutePreviewSuccess({
    String G__typename = 'RoutePreviewSuccess',
    required this.proposalId,
    required this.coordinates,
    required this.sections,
    this.refinementError,
  }) : super(G__typename: G__typename);

  factory GRoutePreviewResultData__asRoutePreviewSuccess.fromJson(
      Map<String, dynamic> json) {
    return GRoutePreviewResultData__asRoutePreviewSuccess(
      G__typename: (json['__typename'] as String),
      proposalId: (json['proposalId'] as String),
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((_$e) => _i2.GLatLngData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      sections: (json['sections'] as List<dynamic>)
          .map((_$e) =>
              GPreviewSectionData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      refinementError: json['refinementError'] == null
          ? null
          : _i1.GRefinementFailure.fromJson(
              (json['refinementError'] as String)),
    );
  }

  final String proposalId;

  final List<_i2.GLatLngData> coordinates;

  final List<GPreviewSectionData> sections;

  final _i1.GRefinementFailure? refinementError;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['proposalId'] = this.proposalId;
    _$result['coordinates'] =
        this.coordinates.map((_$e) => _$e.toJson()).toList();
    _$result['sections'] = this.sections.map((_$e) => _$e.toJson()).toList();
    final _$refinementErrorValue = this.refinementError;
    _$result['refinementError'] =
        _$refinementErrorValue == null ? null : _$refinementErrorValue.toJson();
    return _$result;
  }

  GRoutePreviewResultData__asRoutePreviewSuccess copyWith({
    String? G__typename,
    String? proposalId,
    List<_i2.GLatLngData>? coordinates,
    List<GPreviewSectionData>? sections,
    _i1.GRefinementFailure? refinementError,
    bool refinementErrorIsSet = false,
  }) {
    return GRoutePreviewResultData__asRoutePreviewSuccess(
      G__typename: G__typename ?? this.G__typename,
      proposalId: proposalId ?? this.proposalId,
      coordinates: coordinates ?? this.coordinates,
      sections: sections ?? this.sections,
      refinementError: refinementError != null || refinementErrorIsSet
          ? refinementError
          : this.refinementError,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRoutePreviewResultData__asRoutePreviewSuccess &&
            G__typename == other.G__typename &&
            proposalId == other.proposalId &&
            _gqlUtils.listEquals(coordinates, other.coordinates) &&
            _gqlUtils.listEquals(sections, other.sections) &&
            refinementError == other.refinementError);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        G__typename,
        proposalId,
        _gqlUtils.listHash(coordinates),
        _gqlUtils.listHash(sections),
        refinementError);
  }

  @override
  String toString() {
    return 'GRoutePreviewResultData__asRoutePreviewSuccess(G__typename: $G__typename, proposalId: $proposalId, coordinates: $coordinates, sections: $sections, refinementError: $refinementError)';
  }
}

class GRoutePreviewResultData__asEditRouteError extends GRoutePreviewResultData
    implements GRoutePreviewResult, GRoutePreviewResult__asEditRouteError {
  GRoutePreviewResultData__asEditRouteError({
    String G__typename = 'EditRouteError',
    required this.code,
    required this.message,
  }) : super(G__typename: G__typename);

  factory GRoutePreviewResultData__asEditRouteError.fromJson(
      Map<String, dynamic> json) {
    return GRoutePreviewResultData__asEditRouteError(
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

  GRoutePreviewResultData__asEditRouteError copyWith({
    String? G__typename,
    _i1.GRouteEditErrorCode? code,
    String? message,
  }) {
    return GRoutePreviewResultData__asEditRouteError(
      G__typename: G__typename ?? this.G__typename,
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRoutePreviewResultData__asEditRouteError &&
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
    return 'GRoutePreviewResultData__asEditRouteError(G__typename: $G__typename, code: $code, message: $message)';
  }
}

class GRoutePreviewResultData__unknown extends GRoutePreviewResultData
    implements GRoutePreviewResult {
  GRoutePreviewResultData__unknown({required String G__typename})
      : super(G__typename: G__typename);

  factory GRoutePreviewResultData__unknown.fromJson(Map<String, dynamic> json) {
    return GRoutePreviewResultData__unknown(
        G__typename: (json['__typename'] as String));
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GRoutePreviewResultData__unknown copyWith({String? G__typename}) {
    return GRoutePreviewResultData__unknown(
        G__typename: G__typename ?? this.G__typename);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRoutePreviewResultData__unknown &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename);
  }

  @override
  String toString() {
    return 'GRoutePreviewResultData__unknown(G__typename: $G__typename)';
  }
}
