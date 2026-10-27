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
