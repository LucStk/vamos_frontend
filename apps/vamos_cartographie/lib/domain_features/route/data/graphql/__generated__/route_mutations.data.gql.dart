// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/domain_features/route/data/graphql/__generated__/route_fields.data.gql.dart'
    as _i1;

class GExtendRouteData {
  const GExtendRouteData({
    required this.extendRoute,
    this.G__typename = 'Mutation',
  });

  factory GExtendRouteData.fromJson(Map<String, dynamic> json) {
    return GExtendRouteData(
      extendRoute: _i1.GEditRouteResultData.fromJson(
          (json['extendRoute'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEditRouteResultData extendRoute;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['extendRoute'] = this.extendRoute.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GExtendRouteData copyWith({
    _i1.GEditRouteResultData? extendRoute,
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

class GPrependRouteData {
  const GPrependRouteData({
    required this.prependRoute,
    this.G__typename = 'Mutation',
  });

  factory GPrependRouteData.fromJson(Map<String, dynamic> json) {
    return GPrependRouteData(
      prependRoute: _i1.GEditRouteResultData.fromJson(
          (json['prependRoute'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEditRouteResultData prependRoute;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['prependRoute'] = this.prependRoute.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GPrependRouteData copyWith({
    _i1.GEditRouteResultData? prependRoute,
    String? G__typename,
  }) {
    return GPrependRouteData(
      prependRoute: prependRoute ?? this.prependRoute,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPrependRouteData &&
            prependRoute == other.prependRoute &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, prependRoute, G__typename);
  }

  @override
  String toString() {
    return 'GPrependRouteData(prependRoute: $prependRoute, G__typename: $G__typename)';
  }
}

class GRedrawRoutePortionData {
  const GRedrawRoutePortionData({
    required this.redrawRoutePortion,
    this.G__typename = 'Mutation',
  });

  factory GRedrawRoutePortionData.fromJson(Map<String, dynamic> json) {
    return GRedrawRoutePortionData(
      redrawRoutePortion: _i1.GEditRouteResultData.fromJson(
          (json['redrawRoutePortion'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEditRouteResultData redrawRoutePortion;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['redrawRoutePortion'] = this.redrawRoutePortion.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GRedrawRoutePortionData copyWith({
    _i1.GEditRouteResultData? redrawRoutePortion,
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

class GSetTripOriginData {
  const GSetTripOriginData({
    required this.setTripOrigin,
    this.G__typename = 'Mutation',
  });

  factory GSetTripOriginData.fromJson(Map<String, dynamic> json) {
    return GSetTripOriginData(
      setTripOrigin: _i1.GEditRouteResultData.fromJson(
          (json['setTripOrigin'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEditRouteResultData setTripOrigin;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['setTripOrigin'] = this.setTripOrigin.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSetTripOriginData copyWith({
    _i1.GEditRouteResultData? setTripOrigin,
    String? G__typename,
  }) {
    return GSetTripOriginData(
      setTripOrigin: setTripOrigin ?? this.setTripOrigin,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSetTripOriginData &&
            setTripOrigin == other.setTripOrigin &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, setTripOrigin, G__typename);
  }

  @override
  String toString() {
    return 'GSetTripOriginData(setTripOrigin: $setTripOrigin, G__typename: $G__typename)';
  }
}
