// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/domain_features/route/data/graphql/__generated__/route_fields.data.gql.dart'
    as _i1;

class GDrawRouteData {
  const GDrawRouteData({
    required this.drawRoute,
    this.G__typename = 'Mutation',
  });

  factory GDrawRouteData.fromJson(Map<String, dynamic> json) {
    return GDrawRouteData(
      drawRoute: _i1.GEditRoutePayloadFragmentData.fromJson(
          (json['drawRoute'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEditRoutePayloadFragmentData drawRoute;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['drawRoute'] = this.drawRoute.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDrawRouteData copyWith({
    _i1.GEditRoutePayloadFragmentData? drawRoute,
    String? G__typename,
  }) {
    return GDrawRouteData(
      drawRoute: drawRoute ?? this.drawRoute,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDrawRouteData &&
            drawRoute == other.drawRoute &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, drawRoute, G__typename);
  }

  @override
  String toString() {
    return 'GDrawRouteData(drawRoute: $drawRoute, G__typename: $G__typename)';
  }
}

class GExtendRouteData {
  const GExtendRouteData({
    required this.extendRoute,
    this.G__typename = 'Mutation',
  });

  factory GExtendRouteData.fromJson(Map<String, dynamic> json) {
    return GExtendRouteData(
      extendRoute: _i1.GEditRoutePayloadFragmentData.fromJson(
          (json['extendRoute'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEditRoutePayloadFragmentData extendRoute;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['extendRoute'] = this.extendRoute.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GExtendRouteData copyWith({
    _i1.GEditRoutePayloadFragmentData? extendRoute,
    String? G__typename,
  }) {
    return GExtendRouteData(
      extendRoute: extendRoute ?? this.extendRoute,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GExtendRouteData &&
            extendRoute == other.extendRoute &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, extendRoute, G__typename);
  }

  @override
  String toString() {
    return 'GExtendRouteData(extendRoute: $extendRoute, G__typename: $G__typename)';
  }
}

class GRedrawRoutePortionData {
  const GRedrawRoutePortionData({
    required this.redrawRoutePortion,
    this.G__typename = 'Mutation',
  });

  factory GRedrawRoutePortionData.fromJson(Map<String, dynamic> json) {
    return GRedrawRoutePortionData(
      redrawRoutePortion: _i1.GEditRoutePayloadFragmentData.fromJson(
          (json['redrawRoutePortion'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEditRoutePayloadFragmentData redrawRoutePortion;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['redrawRoutePortion'] = this.redrawRoutePortion.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GRedrawRoutePortionData copyWith({
    _i1.GEditRoutePayloadFragmentData? redrawRoutePortion,
    String? G__typename,
  }) {
    return GRedrawRoutePortionData(
      redrawRoutePortion: redrawRoutePortion ?? this.redrawRoutePortion,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRedrawRoutePortionData &&
            redrawRoutePortion == other.redrawRoutePortion &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, redrawRoutePortion, G__typename);
  }

  @override
  String toString() {
    return 'GRedrawRoutePortionData(redrawRoutePortion: $redrawRoutePortion, G__typename: $G__typename)';
  }
}
