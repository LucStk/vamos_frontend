// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GRefineSectionVars {
  const GRefineSectionVars({
    required this.tripId,
    required this.sectionId,
  });

  factory GRefineSectionVars.fromJson(Map<String, dynamic> json) {
    return GRefineSectionVars(
      tripId: (json['tripId'] as String),
      sectionId: (json['sectionId'] as String),
    );
  }

  final String tripId;

  final String sectionId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$sectionIdValue = this.sectionId;
    _$result['sectionId'] = _$sectionIdValue;
    return _$result;
  }

  GRefineSectionVars copyWith({
    String? tripId,
    String? sectionId,
  }) {
    return GRefineSectionVars(
      tripId: tripId ?? this.tripId,
      sectionId: sectionId ?? this.sectionId,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRefineSectionVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GRefineSectionVars(tripId: $tripId, sectionId: $sectionId)';
  }
}

class GSetSectionMobilityVars {
  const GSetSectionMobilityVars({
    required this.tripId,
    required this.sectionId,
    required this.mobilityType,
  });

  factory GSetSectionMobilityVars.fromJson(Map<String, dynamic> json) {
    return GSetSectionMobilityVars(
      tripId: (json['tripId'] as String),
      sectionId: (json['sectionId'] as String),
      mobilityType:
          _i1.GMobilityType.fromJson((json['mobilityType'] as String)),
    );
  }

  final String tripId;

  final String sectionId;

  final _i1.GMobilityType mobilityType;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$sectionIdValue = this.sectionId;
    _$result['sectionId'] = _$sectionIdValue;
    final _$mobilityTypeValue = this.mobilityType;
    _$result['mobilityType'] = _$mobilityTypeValue.toJson();
    return _$result;
  }

  GSetSectionMobilityVars copyWith({
    String? tripId,
    String? sectionId,
    _i1.GMobilityType? mobilityType,
  }) {
    return GSetSectionMobilityVars(
      tripId: tripId ?? this.tripId,
      sectionId: sectionId ?? this.sectionId,
      mobilityType: mobilityType ?? this.mobilityType,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSetSectionMobilityVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GSetSectionMobilityVars(tripId: $tripId, sectionId: $sectionId, mobilityType: $mobilityType)';
  }
}
