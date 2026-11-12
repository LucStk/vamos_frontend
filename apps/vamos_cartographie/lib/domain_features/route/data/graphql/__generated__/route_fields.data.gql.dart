// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/geo_fields.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

abstract class GMobilitySpan {
  String get id;
  int get startIndex;
  _i1.GMobilityType get mobilityType;
  double? get lengthM;
  String get G__typename;
}

class GMobilitySpanData implements GMobilitySpan {
  const GMobilitySpanData({
    required this.id,
    required this.startIndex,
    required this.mobilityType,
    this.lengthM,
    this.G__typename = 'MobilitySpanType',
  });

  factory GMobilitySpanData.fromJson(Map<String, dynamic> json) {
    return GMobilitySpanData(
      id: (json['id'] as String),
      startIndex: (json['startIndex'] as int),
      mobilityType:
          _i1.GMobilityType.fromJson((json['mobilityType'] as String)),
      lengthM:
          json['lengthM'] == null ? null : (json['lengthM'] as num).toDouble(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final int startIndex;

  final _i1.GMobilityType mobilityType;

  final double? lengthM;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['startIndex'] = this.startIndex;
    _$result['mobilityType'] = this.mobilityType.toJson();
    final _$lengthMValue = this.lengthM;
    _$result['lengthM'] = _$lengthMValue == null ? null : _$lengthMValue;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GMobilitySpanData copyWith({
    String? id,
    int? startIndex,
    _i1.GMobilityType? mobilityType,
    double? lengthM,
    bool lengthMIsSet = false,
    String? G__typename,
  }) {
    return GMobilitySpanData(
      id: id ?? this.id,
      startIndex: startIndex ?? this.startIndex,
      mobilityType: mobilityType ?? this.mobilityType,
      lengthM: lengthM != null || lengthMIsSet ? lengthM : this.lengthM,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GMobilitySpanData &&
            id == other.id &&
            startIndex == other.startIndex &&
            mobilityType == other.mobilityType &&
            lengthM == other.lengthM &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, startIndex, mobilityType, lengthM, G__typename);
  }

  @override
  String toString() {
    return 'GMobilitySpanData(id: $id, startIndex: $startIndex, mobilityType: $mobilityType, lengthM: $lengthM, G__typename: $G__typename)';
  }
}

abstract class GBounds {
  double get minLng;
  double get minLat;
  double get maxLng;
  double get maxLat;
  String get G__typename;
}

class GBoundsData implements GBounds {
  const GBoundsData({
    required this.minLng,
    required this.minLat,
    required this.maxLng,
    required this.maxLat,
    this.G__typename = 'BoundsType',
  });

  factory GBoundsData.fromJson(Map<String, dynamic> json) {
    return GBoundsData(
      minLng: (json['minLng'] as num).toDouble(),
      minLat: (json['minLat'] as num).toDouble(),
      maxLng: (json['maxLng'] as num).toDouble(),
      maxLat: (json['maxLat'] as num).toDouble(),
      G__typename: (json['__typename'] as String),
    );
  }

  final double minLng;

  final double minLat;

  final double maxLng;

  final double maxLat;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['minLng'] = this.minLng;
    _$result['minLat'] = this.minLat;
    _$result['maxLng'] = this.maxLng;
    _$result['maxLat'] = this.maxLat;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GBoundsData copyWith({
    double? minLng,
    double? minLat,
    double? maxLng,
    double? maxLat,
    String? G__typename,
  }) {
    return GBoundsData(
      minLng: minLng ?? this.minLng,
      minLat: minLat ?? this.minLat,
      maxLng: maxLng ?? this.maxLng,
      maxLat: maxLat ?? this.maxLat,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GBoundsData &&
            minLng == other.minLng &&
            minLat == other.minLat &&
            maxLng == other.maxLng &&
            maxLat == other.maxLat &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, minLng, minLat, maxLng, maxLat, G__typename);
  }

  @override
  String toString() {
    return 'GBoundsData(minLng: $minLng, minLat: $minLat, maxLng: $maxLng, maxLat: $maxLat, G__typename: $G__typename)';
  }
}

abstract class GEditSpan {
  String get id;
  int get startIndex;
  String get editId;
  _i1.GGeometrySource get geometrySource;
  double? get lengthM;
  String get G__typename;
}

class GEditSpanData implements GEditSpan {
  const GEditSpanData({
    required this.id,
    required this.startIndex,
    required this.editId,
    required this.geometrySource,
    this.lengthM,
    this.G__typename = 'EditSpanType',
  });

  factory GEditSpanData.fromJson(Map<String, dynamic> json) {
    return GEditSpanData(
      id: (json['id'] as String),
      startIndex: (json['startIndex'] as int),
      editId: (json['editId'] as String),
      geometrySource:
          _i1.GGeometrySource.fromJson((json['geometrySource'] as String)),
      lengthM:
          json['lengthM'] == null ? null : (json['lengthM'] as num).toDouble(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final int startIndex;

  final String editId;

  final _i1.GGeometrySource geometrySource;

  final double? lengthM;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['startIndex'] = this.startIndex;
    _$result['editId'] = this.editId;
    _$result['geometrySource'] = this.geometrySource.toJson();
    final _$lengthMValue = this.lengthM;
    _$result['lengthM'] = _$lengthMValue == null ? null : _$lengthMValue;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GEditSpanData copyWith({
    String? id,
    int? startIndex,
    String? editId,
    _i1.GGeometrySource? geometrySource,
    double? lengthM,
    bool lengthMIsSet = false,
    String? G__typename,
  }) {
    return GEditSpanData(
      id: id ?? this.id,
      startIndex: startIndex ?? this.startIndex,
      editId: editId ?? this.editId,
      geometrySource: geometrySource ?? this.geometrySource,
      lengthM: lengthM != null || lengthMIsSet ? lengthM : this.lengthM,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GEditSpanData &&
            id == other.id &&
            startIndex == other.startIndex &&
            editId == other.editId &&
            geometrySource == other.geometrySource &&
            lengthM == other.lengthM &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, startIndex, editId, geometrySource,
        lengthM, G__typename);
  }

  @override
  String toString() {
    return 'GEditSpanData(id: $id, startIndex: $startIndex, editId: $editId, geometrySource: $geometrySource, lengthM: $lengthM, G__typename: $G__typename)';
  }
}

abstract class GPreviewMobilitySpan {
  String? get id;
  int get startIndex;
  _i1.GMobilityType get mobilityType;
  String get G__typename;
}

class GPreviewMobilitySpanData implements GPreviewMobilitySpan {
  const GPreviewMobilitySpanData({
    this.id,
    required this.startIndex,
    required this.mobilityType,
    this.G__typename = 'PreviewMobilitySpanType',
  });

  factory GPreviewMobilitySpanData.fromJson(Map<String, dynamic> json) {
    return GPreviewMobilitySpanData(
      id: json['id'] == null ? null : (json['id'] as String),
      startIndex: (json['startIndex'] as int),
      mobilityType:
          _i1.GMobilityType.fromJson((json['mobilityType'] as String)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String? id;

  final int startIndex;

  final _i1.GMobilityType mobilityType;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue == null ? null : _$idValue;
    _$result['startIndex'] = this.startIndex;
    _$result['mobilityType'] = this.mobilityType.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GPreviewMobilitySpanData copyWith({
    String? id,
    bool idIsSet = false,
    int? startIndex,
    _i1.GMobilityType? mobilityType,
    String? G__typename,
  }) {
    return GPreviewMobilitySpanData(
      id: id != null || idIsSet ? id : this.id,
      startIndex: startIndex ?? this.startIndex,
      mobilityType: mobilityType ?? this.mobilityType,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPreviewMobilitySpanData &&
            id == other.id &&
            startIndex == other.startIndex &&
            mobilityType == other.mobilityType &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, startIndex, mobilityType, G__typename);
  }

  @override
  String toString() {
    return 'GPreviewMobilitySpanData(id: $id, startIndex: $startIndex, mobilityType: $mobilityType, G__typename: $G__typename)';
  }
}

abstract class GPreviewEditSpan {
  String? get id;
  int get startIndex;
  String get editId;
  _i1.GGeometrySource get geometrySource;
  bool get isNew;
  String get G__typename;
}

class GPreviewEditSpanData implements GPreviewEditSpan {
  const GPreviewEditSpanData({
    this.id,
    required this.startIndex,
    required this.editId,
    required this.geometrySource,
    required this.isNew,
    this.G__typename = 'PreviewEditSpanType',
  });

  factory GPreviewEditSpanData.fromJson(Map<String, dynamic> json) {
    return GPreviewEditSpanData(
      id: json['id'] == null ? null : (json['id'] as String),
      startIndex: (json['startIndex'] as int),
      editId: (json['editId'] as String),
      geometrySource:
          _i1.GGeometrySource.fromJson((json['geometrySource'] as String)),
      isNew: (json['isNew'] as bool),
      G__typename: (json['__typename'] as String),
    );
  }

  final String? id;

  final int startIndex;

  final String editId;

  final _i1.GGeometrySource geometrySource;

  final bool isNew;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue == null ? null : _$idValue;
    _$result['startIndex'] = this.startIndex;
    _$result['editId'] = this.editId;
    _$result['geometrySource'] = this.geometrySource.toJson();
    _$result['isNew'] = this.isNew;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GPreviewEditSpanData copyWith({
    String? id,
    bool idIsSet = false,
    int? startIndex,
    String? editId,
    _i1.GGeometrySource? geometrySource,
    bool? isNew,
    String? G__typename,
  }) {
    return GPreviewEditSpanData(
      id: id != null || idIsSet ? id : this.id,
      startIndex: startIndex ?? this.startIndex,
      editId: editId ?? this.editId,
      geometrySource: geometrySource ?? this.geometrySource,
      isNew: isNew ?? this.isNew,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPreviewEditSpanData &&
            id == other.id &&
            startIndex == other.startIndex &&
            editId == other.editId &&
            geometrySource == other.geometrySource &&
            isNew == other.isNew &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, startIndex, editId, geometrySource,
        isNew, G__typename);
  }

  @override
  String toString() {
    return 'GPreviewEditSpanData(id: $id, startIndex: $startIndex, editId: $editId, geometrySource: $geometrySource, isNew: $isNew, G__typename: $G__typename)';
  }
}

abstract class GTripRoute {
  String get id;
  String? get routeUpdatedAt;
  GBounds? get bounds;
  _i2.GLatLng get startPoint;
  List<_i2.GLatLng> get route;
  List<GMobilitySpan> get mobilitySpans;
  String get G__typename;
}

class GTripRouteData implements GTripRoute {
  const GTripRouteData({
    required this.id,
    this.routeUpdatedAt,
    this.bounds,
    required this.startPoint,
    required this.route,
    required this.mobilitySpans,
    this.G__typename = 'TripType',
  });

  factory GTripRouteData.fromJson(Map<String, dynamic> json) {
    return GTripRouteData(
      id: (json['id'] as String),
      routeUpdatedAt: json['routeUpdatedAt'] == null
          ? null
          : (json['routeUpdatedAt'] as String),
      bounds: json['bounds'] == null
          ? null
          : GBoundsData.fromJson((json['bounds'] as Map<String, dynamic>)),
      startPoint: _i2.GLatLngData.fromJson(
          (json['startPoint'] as Map<String, dynamic>)),
      route: (json['route'] as List<dynamic>)
          .map((_$e) => _i2.GLatLngData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      mobilitySpans: (json['mobilitySpans'] as List<dynamic>)
          .map((_$e) =>
              GMobilitySpanData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String? routeUpdatedAt;

  final GBoundsData? bounds;

  final _i2.GLatLngData startPoint;

  final List<_i2.GLatLngData> route;

  final List<GMobilitySpanData> mobilitySpans;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    final _$routeUpdatedAtValue = this.routeUpdatedAt;
    _$result['routeUpdatedAt'] =
        _$routeUpdatedAtValue == null ? null : _$routeUpdatedAtValue;
    final _$boundsValue = this.bounds;
    _$result['bounds'] = _$boundsValue == null ? null : _$boundsValue.toJson();
    _$result['startPoint'] = this.startPoint.toJson();
    _$result['route'] = this.route.map((_$e) => _$e.toJson()).toList();
    _$result['mobilitySpans'] =
        this.mobilitySpans.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GTripRouteData copyWith({
    String? id,
    String? routeUpdatedAt,
    bool routeUpdatedAtIsSet = false,
    GBoundsData? bounds,
    bool boundsIsSet = false,
    _i2.GLatLngData? startPoint,
    List<_i2.GLatLngData>? route,
    List<GMobilitySpanData>? mobilitySpans,
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
      mobilitySpans: mobilitySpans ?? this.mobilitySpans,
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
            _gqlUtils.listEquals(mobilitySpans, other.mobilitySpans) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        routeUpdatedAt,
        bounds,
        startPoint,
        _gqlUtils.listHash(route),
        _gqlUtils.listHash(mobilitySpans),
        G__typename);
  }

  @override
  String toString() {
    return 'GTripRouteData(id: $id, routeUpdatedAt: $routeUpdatedAt, bounds: $bounds, startPoint: $startPoint, route: $route, mobilitySpans: $mobilitySpans, G__typename: $G__typename)';
  }
}

abstract class GTripRouteEditing {
  String get id;
  String? get routeUpdatedAt;
  GBounds? get bounds;
  _i2.GLatLng get startPoint;
  List<_i2.GLatLng> get route;
  List<GMobilitySpan> get mobilitySpans;
  String get G__typename;
  List<GEditSpan> get editSpans;
}

class GTripRouteEditingData implements GTripRouteEditing, GTripRoute {
  const GTripRouteEditingData({
    required this.id,
    this.routeUpdatedAt,
    this.bounds,
    required this.startPoint,
    required this.route,
    required this.mobilitySpans,
    this.G__typename = 'TripType',
    required this.editSpans,
  });

  factory GTripRouteEditingData.fromJson(Map<String, dynamic> json) {
    return GTripRouteEditingData(
      id: (json['id'] as String),
      routeUpdatedAt: json['routeUpdatedAt'] == null
          ? null
          : (json['routeUpdatedAt'] as String),
      bounds: json['bounds'] == null
          ? null
          : GBoundsData.fromJson((json['bounds'] as Map<String, dynamic>)),
      startPoint: _i2.GLatLngData.fromJson(
          (json['startPoint'] as Map<String, dynamic>)),
      route: (json['route'] as List<dynamic>)
          .map((_$e) => _i2.GLatLngData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      mobilitySpans: (json['mobilitySpans'] as List<dynamic>)
          .map((_$e) =>
              GMobilitySpanData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
      editSpans: (json['editSpans'] as List<dynamic>)
          .map((_$e) => GEditSpanData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
    );
  }

  final String id;

  final String? routeUpdatedAt;

  final GBoundsData? bounds;

  final _i2.GLatLngData startPoint;

  final List<_i2.GLatLngData> route;

  final List<GMobilitySpanData> mobilitySpans;

  final String G__typename;

  final List<GEditSpanData> editSpans;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    final _$routeUpdatedAtValue = this.routeUpdatedAt;
    _$result['routeUpdatedAt'] =
        _$routeUpdatedAtValue == null ? null : _$routeUpdatedAtValue;
    final _$boundsValue = this.bounds;
    _$result['bounds'] = _$boundsValue == null ? null : _$boundsValue.toJson();
    _$result['startPoint'] = this.startPoint.toJson();
    _$result['route'] = this.route.map((_$e) => _$e.toJson()).toList();
    _$result['mobilitySpans'] =
        this.mobilitySpans.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    _$result['editSpans'] = this.editSpans.map((_$e) => _$e.toJson()).toList();
    return _$result;
  }

  GTripRouteEditingData copyWith({
    String? id,
    String? routeUpdatedAt,
    bool routeUpdatedAtIsSet = false,
    GBoundsData? bounds,
    bool boundsIsSet = false,
    _i2.GLatLngData? startPoint,
    List<_i2.GLatLngData>? route,
    List<GMobilitySpanData>? mobilitySpans,
    String? G__typename,
    List<GEditSpanData>? editSpans,
  }) {
    return GTripRouteEditingData(
      id: id ?? this.id,
      routeUpdatedAt: routeUpdatedAt != null || routeUpdatedAtIsSet
          ? routeUpdatedAt
          : this.routeUpdatedAt,
      bounds: bounds != null || boundsIsSet ? bounds : this.bounds,
      startPoint: startPoint ?? this.startPoint,
      route: route ?? this.route,
      mobilitySpans: mobilitySpans ?? this.mobilitySpans,
      G__typename: G__typename ?? this.G__typename,
      editSpans: editSpans ?? this.editSpans,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GTripRouteEditingData &&
            id == other.id &&
            routeUpdatedAt == other.routeUpdatedAt &&
            bounds == other.bounds &&
            startPoint == other.startPoint &&
            _gqlUtils.listEquals(route, other.route) &&
            _gqlUtils.listEquals(mobilitySpans, other.mobilitySpans) &&
            G__typename == other.G__typename &&
            _gqlUtils.listEquals(editSpans, other.editSpans));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        routeUpdatedAt,
        bounds,
        startPoint,
        _gqlUtils.listHash(route),
        _gqlUtils.listHash(mobilitySpans),
        G__typename,
        _gqlUtils.listHash(editSpans));
  }

  @override
  String toString() {
    return 'GTripRouteEditingData(id: $id, routeUpdatedAt: $routeUpdatedAt, bounds: $bounds, startPoint: $startPoint, route: $route, mobilitySpans: $mobilitySpans, G__typename: $G__typename, editSpans: $editSpans)';
  }
}

abstract class GEditRouteResult {
  String get G__typename;
}

abstract class GEditRouteResult__asEditRouteSuccess
    implements GEditRouteResult {
  _i1.GRefinementFailure? get refinementError;
  GTripRouteEditing get trip;
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
      trip: GTripRouteEditingData.fromJson(
          (json['trip'] as Map<String, dynamic>)),
    );
  }

  final _i1.GRefinementFailure? refinementError;

  final GTripRouteEditingData trip;

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
    GTripRouteEditingData? trip,
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
  List<GPreviewMobilitySpan> get mobilitySpans;
  List<GPreviewEditSpan> get editSpans;
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
    required this.mobilitySpans,
    required this.editSpans,
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
      mobilitySpans: (json['mobilitySpans'] as List<dynamic>)
          .map((_$e) =>
              GPreviewMobilitySpanData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      editSpans: (json['editSpans'] as List<dynamic>)
          .map((_$e) =>
              GPreviewEditSpanData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      refinementError: json['refinementError'] == null
          ? null
          : _i1.GRefinementFailure.fromJson(
              (json['refinementError'] as String)),
    );
  }

  final String proposalId;

  final List<_i2.GLatLngData> coordinates;

  final List<GPreviewMobilitySpanData> mobilitySpans;

  final List<GPreviewEditSpanData> editSpans;

  final _i1.GRefinementFailure? refinementError;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['proposalId'] = this.proposalId;
    _$result['coordinates'] =
        this.coordinates.map((_$e) => _$e.toJson()).toList();
    _$result['mobilitySpans'] =
        this.mobilitySpans.map((_$e) => _$e.toJson()).toList();
    _$result['editSpans'] = this.editSpans.map((_$e) => _$e.toJson()).toList();
    final _$refinementErrorValue = this.refinementError;
    _$result['refinementError'] =
        _$refinementErrorValue == null ? null : _$refinementErrorValue.toJson();
    return _$result;
  }

  GRoutePreviewResultData__asRoutePreviewSuccess copyWith({
    String? G__typename,
    String? proposalId,
    List<_i2.GLatLngData>? coordinates,
    List<GPreviewMobilitySpanData>? mobilitySpans,
    List<GPreviewEditSpanData>? editSpans,
    _i1.GRefinementFailure? refinementError,
    bool refinementErrorIsSet = false,
  }) {
    return GRoutePreviewResultData__asRoutePreviewSuccess(
      G__typename: G__typename ?? this.G__typename,
      proposalId: proposalId ?? this.proposalId,
      coordinates: coordinates ?? this.coordinates,
      mobilitySpans: mobilitySpans ?? this.mobilitySpans,
      editSpans: editSpans ?? this.editSpans,
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
            _gqlUtils.listEquals(mobilitySpans, other.mobilitySpans) &&
            _gqlUtils.listEquals(editSpans, other.editSpans) &&
            refinementError == other.refinementError);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        G__typename,
        proposalId,
        _gqlUtils.listHash(coordinates),
        _gqlUtils.listHash(mobilitySpans),
        _gqlUtils.listHash(editSpans),
        refinementError);
  }

  @override
  String toString() {
    return 'GRoutePreviewResultData__asRoutePreviewSuccess(G__typename: $G__typename, proposalId: $proposalId, coordinates: $coordinates, mobilitySpans: $mobilitySpans, editSpans: $editSpans, refinementError: $refinementError)';
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
