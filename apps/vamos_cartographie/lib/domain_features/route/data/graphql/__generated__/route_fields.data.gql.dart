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

abstract class GTripRouteFields {
  String get id;
  String? get routeUpdatedAt;
  GeoPolygonDto? get bounds;
  List<_i2.GLatLngFields> get route;
  List<GRouteSectionFields> get sections;
  String get G__typename;
}

class GTripRouteFieldsData implements GTripRouteFields {
  const GTripRouteFieldsData({
    required this.id,
    this.routeUpdatedAt,
    this.bounds,
    required this.route,
    required this.sections,
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
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String? routeUpdatedAt;

  final GeoPolygonDto? bounds;

  final List<_i2.GLatLngFieldsData> route;

  final List<GRouteSectionFieldsData> sections;

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
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, routeUpdatedAt, bounds,
        _gqlUtils.listHash(route), _gqlUtils.listHash(sections), G__typename);
  }

  @override
  String toString() {
    return 'GTripRouteFieldsData(id: $id, routeUpdatedAt: $routeUpdatedAt, bounds: $bounds, route: $route, sections: $sections, G__typename: $G__typename)';
  }
}

abstract class GEditRoutePayloadFragment {
  String get G__typename;
}

abstract class GEditRoutePayloadFragment__asEditRouteSuccess
    implements GEditRoutePayloadFragment {
  _i1.GRefinementError? get refinementError;
  GTripRouteFields get trip;
  String get G__typename;
}

abstract class GEditRoutePayloadFragment__asEditRouteError
    implements GEditRoutePayloadFragment {
  _i1.GRouteEditErrorCode get code;
  String get message;
  String get G__typename;
}

sealed class GEditRoutePayloadFragmentData
    implements GEditRoutePayloadFragment {
  const GEditRoutePayloadFragmentData({required this.G__typename});

  factory GEditRoutePayloadFragmentData.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'EditRouteSuccess':
        return GEditRoutePayloadFragmentData__asEditRouteSuccess.fromJson(json);
      case 'EditRouteError':
        return GEditRoutePayloadFragmentData__asEditRouteError.fromJson(json);
      default:
        return GEditRoutePayloadFragmentData__unknown.fromJson(json);
    }
  }

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    return _$result;
  }
}

extension GEditRoutePayloadFragmentDataWhenExtension
    on GEditRoutePayloadFragmentData {
  _T when<_T>({
    required _T Function(GEditRoutePayloadFragmentData__asEditRouteSuccess)
        editRouteSuccess,
    required _T Function(GEditRoutePayloadFragmentData__asEditRouteError)
        editRouteError,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'EditRouteSuccess':
        return editRouteSuccess(
            this as GEditRoutePayloadFragmentData__asEditRouteSuccess);
      case 'EditRouteError':
        return editRouteError(
            this as GEditRoutePayloadFragmentData__asEditRouteError);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GEditRoutePayloadFragmentData__asEditRouteSuccess)?
        editRouteSuccess,
    _T Function(GEditRoutePayloadFragmentData__asEditRouteError)?
        editRouteError,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'EditRouteSuccess':
        return editRouteSuccess == null
            ? orElse()
            : editRouteSuccess(
                this as GEditRoutePayloadFragmentData__asEditRouteSuccess);
      case 'EditRouteError':
        return editRouteError == null
            ? orElse()
            : editRouteError(
                this as GEditRoutePayloadFragmentData__asEditRouteError);
      default:
        return orElse();
    }
  }
}

class GEditRoutePayloadFragmentData__asEditRouteSuccess
    extends GEditRoutePayloadFragmentData
    implements
        GEditRoutePayloadFragment,
        GEditRoutePayloadFragment__asEditRouteSuccess {
  GEditRoutePayloadFragmentData__asEditRouteSuccess({
    String G__typename = 'EditRouteSuccess',
    this.refinementError,
    required this.trip,
  }) : super(G__typename: G__typename);

  factory GEditRoutePayloadFragmentData__asEditRouteSuccess.fromJson(
      Map<String, dynamic> json) {
    return GEditRoutePayloadFragmentData__asEditRouteSuccess(
      G__typename: (json['__typename'] as String),
      refinementError: json['refinementError'] == null
          ? null
          : _i1.GRefinementError.fromJson((json['refinementError'] as String)),
      trip:
          GTripRouteFieldsData.fromJson((json['trip'] as Map<String, dynamic>)),
    );
  }

  final _i1.GRefinementError? refinementError;

  final GTripRouteFieldsData trip;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    final _$refinementErrorValue = this.refinementError;
    _$result['refinementError'] =
        _$refinementErrorValue == null ? null : _$refinementErrorValue.toJson();
    _$result['trip'] = this.trip.toJson();
    return _$result;
  }

  GEditRoutePayloadFragmentData__asEditRouteSuccess copyWith({
    String? G__typename,
    _i1.GRefinementError? refinementError,
    bool refinementErrorIsSet = false,
    GTripRouteFieldsData? trip,
  }) {
    return GEditRoutePayloadFragmentData__asEditRouteSuccess(
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
        (other is GEditRoutePayloadFragmentData__asEditRouteSuccess &&
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
    return 'GEditRoutePayloadFragmentData__asEditRouteSuccess(G__typename: $G__typename, refinementError: $refinementError, trip: $trip)';
  }
}

class GEditRoutePayloadFragmentData__asEditRouteError
    extends GEditRoutePayloadFragmentData
    implements
        GEditRoutePayloadFragment,
        GEditRoutePayloadFragment__asEditRouteError {
  GEditRoutePayloadFragmentData__asEditRouteError({
    String G__typename = 'EditRouteError',
    required this.code,
    required this.message,
  }) : super(G__typename: G__typename);

  factory GEditRoutePayloadFragmentData__asEditRouteError.fromJson(
      Map<String, dynamic> json) {
    return GEditRoutePayloadFragmentData__asEditRouteError(
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

  GEditRoutePayloadFragmentData__asEditRouteError copyWith({
    String? G__typename,
    _i1.GRouteEditErrorCode? code,
    String? message,
  }) {
    return GEditRoutePayloadFragmentData__asEditRouteError(
      G__typename: G__typename ?? this.G__typename,
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GEditRoutePayloadFragmentData__asEditRouteError &&
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
    return 'GEditRoutePayloadFragmentData__asEditRouteError(G__typename: $G__typename, code: $code, message: $message)';
  }
}

class GEditRoutePayloadFragmentData__unknown
    extends GEditRoutePayloadFragmentData implements GEditRoutePayloadFragment {
  GEditRoutePayloadFragmentData__unknown({required String G__typename})
      : super(G__typename: G__typename);

  factory GEditRoutePayloadFragmentData__unknown.fromJson(
      Map<String, dynamic> json) {
    return GEditRoutePayloadFragmentData__unknown(
        G__typename: (json['__typename'] as String));
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GEditRoutePayloadFragmentData__unknown copyWith({String? G__typename}) {
    return GEditRoutePayloadFragmentData__unknown(
        G__typename: G__typename ?? this.G__typename);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GEditRoutePayloadFragmentData__unknown &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename);
  }

  @override
  String toString() {
    return 'GEditRoutePayloadFragmentData__unknown(G__typename: $G__typename)';
  }
}
