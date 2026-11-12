// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GRefineSectionVars {
  const GRefineSectionVars({
    required this.tripId,
    required this.sectionId,
    this.basedOn = const Value.absent(),
  });

  factory GRefineSectionVars.fromJson(Map<String, dynamic> json) {
    return GRefineSectionVars(
      tripId: (json['tripId'] as String),
      sectionId: (json['sectionId'] as String),
      basedOn: json.containsKey('basedOn')
          ? Value.present(
              json['basedOn'] == null ? null : (json['basedOn'] as String))
          : Value.absent(),
    );
  }

  final String tripId;

  final String sectionId;

  final Value<String> basedOn;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$sectionIdValue = this.sectionId;
    _$result['sectionId'] = _$sectionIdValue;
    final _$basedOnValue = this.basedOn;
    if (_$basedOnValue.isPresent) {
      final _$basedOnRequired = _$basedOnValue.requireValue;
      _$result['basedOn'] =
          _$basedOnRequired == null ? null : _$basedOnRequired;
    }
    return _$result;
  }

  GRefineSectionVars copyWith({
    String? tripId,
    String? sectionId,
    Value<String>? basedOn,
  }) {
    return GRefineSectionVars(
      tripId: tripId ?? this.tripId,
      sectionId: sectionId ?? this.sectionId,
      basedOn: basedOn ?? this.basedOn,
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
    return 'GRefineSectionVars(tripId: $tripId, sectionId: $sectionId, basedOn: $basedOn)';
  }
}

class GSetSectionMobilityVars {
  const GSetSectionMobilityVars({
    required this.tripId,
    required this.sectionId,
    required this.mobilityType,
    this.basedOn = const Value.absent(),
  });

  factory GSetSectionMobilityVars.fromJson(Map<String, dynamic> json) {
    return GSetSectionMobilityVars(
      tripId: (json['tripId'] as String),
      sectionId: (json['sectionId'] as String),
      mobilityType:
          _i1.GMobilityType.fromJson((json['mobilityType'] as String)),
      basedOn: json.containsKey('basedOn')
          ? Value.present(
              json['basedOn'] == null ? null : (json['basedOn'] as String))
          : Value.absent(),
    );
  }

  final String tripId;

  final String sectionId;

  final _i1.GMobilityType mobilityType;

  final Value<String> basedOn;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$sectionIdValue = this.sectionId;
    _$result['sectionId'] = _$sectionIdValue;
    final _$mobilityTypeValue = this.mobilityType;
    _$result['mobilityType'] = _$mobilityTypeValue.toJson();
    final _$basedOnValue = this.basedOn;
    if (_$basedOnValue.isPresent) {
      final _$basedOnRequired = _$basedOnValue.requireValue;
      _$result['basedOn'] =
          _$basedOnRequired == null ? null : _$basedOnRequired;
    }
    return _$result;
  }

  GSetSectionMobilityVars copyWith({
    String? tripId,
    String? sectionId,
    _i1.GMobilityType? mobilityType,
    Value<String>? basedOn,
  }) {
    return GSetSectionMobilityVars(
      tripId: tripId ?? this.tripId,
      sectionId: sectionId ?? this.sectionId,
      mobilityType: mobilityType ?? this.mobilityType,
      basedOn: basedOn ?? this.basedOn,
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
    return 'GSetSectionMobilityVars(tripId: $tripId, sectionId: $sectionId, mobilityType: $mobilityType, basedOn: $basedOn)';
  }
}

class GSetRangeMobilityVars {
  const GSetRangeMobilityVars({
    required this.tripId,
    required this.input,
  });

  factory GSetRangeMobilityVars.fromJson(Map<String, dynamic> json) {
    return GSetRangeMobilityVars(
      tripId: (json['tripId'] as String),
      input: _i1.GRangeMobilityInput.fromJson(
          (json['input'] as Map<String, dynamic>)),
    );
  }

  final String tripId;

  final _i1.GRangeMobilityInput input;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$inputValue = this.input;
    _$result['input'] = _$inputValue.toJson();
    return _$result;
  }

  GSetRangeMobilityVars copyWith({
    String? tripId,
    _i1.GRangeMobilityInput? input,
  }) {
    return GSetRangeMobilityVars(
      tripId: tripId ?? this.tripId,
      input: input ?? this.input,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSetRangeMobilityVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GSetRangeMobilityVars(tripId: $tripId, input: $input)';
  }
}

class GMoveMobilityBoundaryVars {
  const GMoveMobilityBoundaryVars({
    required this.tripId,
    required this.input,
  });

  factory GMoveMobilityBoundaryVars.fromJson(Map<String, dynamic> json) {
    return GMoveMobilityBoundaryVars(
      tripId: (json['tripId'] as String),
      input: _i1.GMoveMobilityBoundaryInput.fromJson(
          (json['input'] as Map<String, dynamic>)),
    );
  }

  final String tripId;

  final _i1.GMoveMobilityBoundaryInput input;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$inputValue = this.input;
    _$result['input'] = _$inputValue.toJson();
    return _$result;
  }

  GMoveMobilityBoundaryVars copyWith({
    String? tripId,
    _i1.GMoveMobilityBoundaryInput? input,
  }) {
    return GMoveMobilityBoundaryVars(
      tripId: tripId ?? this.tripId,
      input: input ?? this.input,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GMoveMobilityBoundaryVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GMoveMobilityBoundaryVars(tripId: $tripId, input: $input)';
  }
}
