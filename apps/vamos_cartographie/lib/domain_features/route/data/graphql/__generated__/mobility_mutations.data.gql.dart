// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/domain_features/route/data/graphql/__generated__/route_fields.data.gql.dart'
    as _i1;

class GRefineSectionData {
  const GRefineSectionData({
    required this.refineSection,
    this.G__typename = 'Mutation',
  });

  factory GRefineSectionData.fromJson(Map<String, dynamic> json) {
    return GRefineSectionData(
      refineSection: _i1.GEditRouteResultData.fromJson(
          (json['refineSection'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEditRouteResultData refineSection;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['refineSection'] = this.refineSection.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GRefineSectionData copyWith({
    _i1.GEditRouteResultData? refineSection,
    String? G__typename,
  }) {
    return GRefineSectionData(
      refineSection: refineSection ?? this.refineSection,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRefineSectionData &&
            refineSection == other.refineSection &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, refineSection, G__typename);
  }

  @override
  String toString() {
    return 'GRefineSectionData(refineSection: $refineSection, G__typename: $G__typename)';
  }
}

class GSetSectionMobilityData {
  const GSetSectionMobilityData({
    required this.setSectionMobility,
    this.G__typename = 'Mutation',
  });

  factory GSetSectionMobilityData.fromJson(Map<String, dynamic> json) {
    return GSetSectionMobilityData(
      setSectionMobility: _i1.GEditRouteResultData.fromJson(
          (json['setSectionMobility'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEditRouteResultData setSectionMobility;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['setSectionMobility'] = this.setSectionMobility.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSetSectionMobilityData copyWith({
    _i1.GEditRouteResultData? setSectionMobility,
    String? G__typename,
  }) {
    return GSetSectionMobilityData(
      setSectionMobility: setSectionMobility ?? this.setSectionMobility,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSetSectionMobilityData &&
            setSectionMobility == other.setSectionMobility &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, setSectionMobility, G__typename);
  }

  @override
  String toString() {
    return 'GSetSectionMobilityData(setSectionMobility: $setSectionMobility, G__typename: $G__typename)';
  }
}

class GSetRangeMobilityData {
  const GSetRangeMobilityData({
    required this.setRangeMobility,
    this.G__typename = 'Mutation',
  });

  factory GSetRangeMobilityData.fromJson(Map<String, dynamic> json) {
    return GSetRangeMobilityData(
      setRangeMobility: _i1.GEditRouteResultData.fromJson(
          (json['setRangeMobility'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEditRouteResultData setRangeMobility;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['setRangeMobility'] = this.setRangeMobility.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSetRangeMobilityData copyWith({
    _i1.GEditRouteResultData? setRangeMobility,
    String? G__typename,
  }) {
    return GSetRangeMobilityData(
      setRangeMobility: setRangeMobility ?? this.setRangeMobility,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSetRangeMobilityData &&
            setRangeMobility == other.setRangeMobility &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, setRangeMobility, G__typename);
  }

  @override
  String toString() {
    return 'GSetRangeMobilityData(setRangeMobility: $setRangeMobility, G__typename: $G__typename)';
  }
}

class GMoveMobilityBoundaryData {
  const GMoveMobilityBoundaryData({
    required this.moveMobilityBoundary,
    this.G__typename = 'Mutation',
  });

  factory GMoveMobilityBoundaryData.fromJson(Map<String, dynamic> json) {
    return GMoveMobilityBoundaryData(
      moveMobilityBoundary: _i1.GEditRouteResultData.fromJson(
          (json['moveMobilityBoundary'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GEditRouteResultData moveMobilityBoundary;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['moveMobilityBoundary'] = this.moveMobilityBoundary.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GMoveMobilityBoundaryData copyWith({
    _i1.GEditRouteResultData? moveMobilityBoundary,
    String? G__typename,
  }) {
    return GMoveMobilityBoundaryData(
      moveMobilityBoundary: moveMobilityBoundary ?? this.moveMobilityBoundary,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GMoveMobilityBoundaryData &&
            moveMobilityBoundary == other.moveMobilityBoundary &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, moveMobilityBoundary, G__typename);
  }

  @override
  String toString() {
    return 'GMoveMobilityBoundaryData(moveMobilityBoundary: $moveMobilityBoundary, G__typename: $G__typename)';
  }
}
