// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/domain_features/route/data/graphql/__generated__/route_fields.data.gql.dart'
    as _i1;

class GEditRouteData {
  const GEditRouteData({
    required this.editRoute,
    this.G__typename = 'Mutation',
  });

  factory GEditRouteData.fromJson(Map<String, dynamic> json) {
    return GEditRouteData(
      editRoute: _i1.GEditRouteResultData.fromJson(
          (json['editRoute'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEditRouteResultData editRoute;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['editRoute'] = this.editRoute.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GEditRouteData copyWith({
    _i1.GEditRouteResultData? editRoute,
    String? G__typename,
  }) {
    return GEditRouteData(
      editRoute: editRoute ?? this.editRoute,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GEditRouteData &&
            editRoute == other.editRoute &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, editRoute, G__typename);
  }

  @override
  String toString() {
    return 'GEditRouteData(editRoute: $editRoute, G__typename: $G__typename)';
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

class GDeleteRouteData {
  const GDeleteRouteData({
    required this.deleteRoute,
    this.G__typename = 'Mutation',
  });

  factory GDeleteRouteData.fromJson(Map<String, dynamic> json) {
    return GDeleteRouteData(
      deleteRoute: _i1.GEditRouteResultData.fromJson(
          (json['deleteRoute'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEditRouteResultData deleteRoute;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['deleteRoute'] = this.deleteRoute.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDeleteRouteData copyWith({
    _i1.GEditRouteResultData? deleteRoute,
    String? G__typename,
  }) {
    return GDeleteRouteData(
      deleteRoute: deleteRoute ?? this.deleteRoute,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteRouteData &&
            deleteRoute == other.deleteRoute &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, deleteRoute, G__typename);
  }

  @override
  String toString() {
    return 'GDeleteRouteData(deleteRoute: $deleteRoute, G__typename: $G__typename)';
  }
}
