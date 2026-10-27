// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/domain_features/route/data/graphql/__generated__/route_fields.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/domain_features/trip/data/graphql/__generated__/trip_fields.data.gql.dart'
    as _i1;

class GUpdateTripData {
  const GUpdateTripData({
    required this.updateTrip,
    this.G__typename = 'Mutation',
  });

  factory GUpdateTripData.fromJson(Map<String, dynamic> json) {
    return GUpdateTripData(
      updateTrip: _i1.GTripSummaryData.fromJson(
          (json['updateTrip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GTripSummaryData updateTrip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['updateTrip'] = this.updateTrip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUpdateTripData copyWith({
    _i1.GTripSummaryData? updateTrip,
    String? G__typename,
  }) {
    return GUpdateTripData(
      updateTrip: updateTrip ?? this.updateTrip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUpdateTripData &&
            updateTrip == other.updateTrip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, updateTrip, G__typename);
  }

  @override
  String toString() {
    return 'GUpdateTripData(updateTrip: $updateTrip, G__typename: $G__typename)';
  }
}

class GCreateBlankTripData {
  const GCreateBlankTripData({
    required this.createBlankTrip,
    this.G__typename = 'Mutation',
  });

  factory GCreateBlankTripData.fromJson(Map<String, dynamic> json) {
    return GCreateBlankTripData(
      createBlankTrip: _i1.GTripSummaryData.fromJson(
          (json['createBlankTrip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GTripSummaryData createBlankTrip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['createBlankTrip'] = this.createBlankTrip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateBlankTripData copyWith({
    _i1.GTripSummaryData? createBlankTrip,
    String? G__typename,
  }) {
    return GCreateBlankTripData(
      createBlankTrip: createBlankTrip ?? this.createBlankTrip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateBlankTripData &&
            createBlankTrip == other.createBlankTrip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, createBlankTrip, G__typename);
  }

  @override
  String toString() {
    return 'GCreateBlankTripData(createBlankTrip: $createBlankTrip, G__typename: $G__typename)';
  }
}

class GDeleteTripData {
  const GDeleteTripData({
    required this.deleteTrip,
    this.G__typename = 'Mutation',
  });

  factory GDeleteTripData.fromJson(Map<String, dynamic> json) {
    return GDeleteTripData(
      deleteTrip: (json['deleteTrip'] as bool),
      G__typename: (json['__typename'] as String),
    );
  }

  final bool deleteTrip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['deleteTrip'] = this.deleteTrip;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDeleteTripData copyWith({
    bool? deleteTrip,
    String? G__typename,
  }) {
    return GDeleteTripData(
      deleteTrip: deleteTrip ?? this.deleteTrip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteTripData &&
            deleteTrip == other.deleteTrip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, deleteTrip, G__typename);
  }

  @override
  String toString() {
    return 'GDeleteTripData(deleteTrip: $deleteTrip, G__typename: $G__typename)';
  }
}

class GSetTripOriginData {
  const GSetTripOriginData({
    required this.setTripOrigin,
    this.G__typename = 'Mutation',
  });

  factory GSetTripOriginData.fromJson(Map<String, dynamic> json) {
    return GSetTripOriginData(
      setTripOrigin: _i2.GEditRouteResultData.fromJson(
          (json['setTripOrigin'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i2.GEditRouteResultData setTripOrigin;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['setTripOrigin'] = this.setTripOrigin.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSetTripOriginData copyWith({
    _i2.GEditRouteResultData? setTripOrigin,
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
