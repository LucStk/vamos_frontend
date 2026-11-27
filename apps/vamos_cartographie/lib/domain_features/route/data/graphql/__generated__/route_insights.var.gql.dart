// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GFetchRouteInsightsVars {
  const GFetchRouteInsightsVars({required this.tripId});

  factory GFetchRouteInsightsVars.fromJson(Map<String, dynamic> json) {
    return GFetchRouteInsightsVars(tripId: (json['tripId'] as String));
  }

  final String tripId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    return _$result;
  }

  GFetchRouteInsightsVars copyWith({String? tripId}) {
    return GFetchRouteInsightsVars(tripId: tripId ?? this.tripId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFetchRouteInsightsVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GFetchRouteInsightsVars(tripId: $tripId)';
  }
}

class GRecomputeRouteInsightsVars {
  const GRecomputeRouteInsightsVars({required this.tripId});

  factory GRecomputeRouteInsightsVars.fromJson(Map<String, dynamic> json) {
    return GRecomputeRouteInsightsVars(tripId: (json['tripId'] as String));
  }

  final String tripId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    return _$result;
  }

  GRecomputeRouteInsightsVars copyWith({String? tripId}) {
    return GRecomputeRouteInsightsVars(tripId: tripId ?? this.tripId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRecomputeRouteInsightsVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GRecomputeRouteInsightsVars(tripId: $tripId)';
  }
}

class GFetchProposalElevationVars {
  const GFetchProposalElevationVars({
    required this.tripId,
    required this.proposalId,
  });

  factory GFetchProposalElevationVars.fromJson(Map<String, dynamic> json) {
    return GFetchProposalElevationVars(
      tripId: (json['tripId'] as String),
      proposalId: (json['proposalId'] as String),
    );
  }

  final String tripId;

  final String proposalId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$proposalIdValue = this.proposalId;
    _$result['proposalId'] = _$proposalIdValue;
    return _$result;
  }

  GFetchProposalElevationVars copyWith({
    String? tripId,
    String? proposalId,
  }) {
    return GFetchProposalElevationVars(
      tripId: tripId ?? this.tripId,
      proposalId: proposalId ?? this.proposalId,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFetchProposalElevationVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GFetchProposalElevationVars(tripId: $tripId, proposalId: $proposalId)';
  }
}

class GFetchProposalWaysVars {
  const GFetchProposalWaysVars({
    required this.tripId,
    required this.proposalId,
  });

  factory GFetchProposalWaysVars.fromJson(Map<String, dynamic> json) {
    return GFetchProposalWaysVars(
      tripId: (json['tripId'] as String),
      proposalId: (json['proposalId'] as String),
    );
  }

  final String tripId;

  final String proposalId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$proposalIdValue = this.proposalId;
    _$result['proposalId'] = _$proposalIdValue;
    return _$result;
  }

  GFetchProposalWaysVars copyWith({
    String? tripId,
    String? proposalId,
  }) {
    return GFetchProposalWaysVars(
      tripId: tripId ?? this.tripId,
      proposalId: proposalId ?? this.proposalId,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFetchProposalWaysVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GFetchProposalWaysVars(tripId: $tripId, proposalId: $proposalId)';
  }
}
