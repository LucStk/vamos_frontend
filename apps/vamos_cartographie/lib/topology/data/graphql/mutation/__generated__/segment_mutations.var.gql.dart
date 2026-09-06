// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GUpdateSegmentVars {
  const GUpdateSegmentVars({
    required this.id,
    required this.segment,
  });

  factory GUpdateSegmentVars.fromJson(Map<String, dynamic> json) {
    return GUpdateSegmentVars(
      id: (json['id'] as String),
      segment: _i1.GSegmentUpdateInput.fromJson(
          (json['segment'] as Map<String, dynamic>)),
    );
  }

  final String id;

  final _i1.GSegmentUpdateInput segment;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    final _$segmentValue = this.segment;
    _$result['segment'] = _$segmentValue.toJson();
    return _$result;
  }

  GUpdateSegmentVars copyWith({
    String? id,
    _i1.GSegmentUpdateInput? segment,
  }) {
    return GUpdateSegmentVars(
      id: id ?? this.id,
      segment: segment ?? this.segment,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUpdateSegmentVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GUpdateSegmentVars(id: $id, segment: $segment)';
  }
}

class GCreateSegmentVars {
  const GCreateSegmentVars({
    required this.tripId,
    required this.segment,
  });

  factory GCreateSegmentVars.fromJson(Map<String, dynamic> json) {
    return GCreateSegmentVars(
      tripId: (json['tripId'] as String),
      segment: _i1.GSegmentCreateInput.fromJson(
          (json['segment'] as Map<String, dynamic>)),
    );
  }

  final String tripId;

  final _i1.GSegmentCreateInput segment;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$segmentValue = this.segment;
    _$result['segment'] = _$segmentValue.toJson();
    return _$result;
  }

  GCreateSegmentVars copyWith({
    String? tripId,
    _i1.GSegmentCreateInput? segment,
  }) {
    return GCreateSegmentVars(
      tripId: tripId ?? this.tripId,
      segment: segment ?? this.segment,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateSegmentVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GCreateSegmentVars(tripId: $tripId, segment: $segment)';
  }
}

class GCorrectSegmentVars {
  const GCorrectSegmentVars({
    required this.segmentId,
    required this.correction,
  });

  factory GCorrectSegmentVars.fromJson(Map<String, dynamic> json) {
    return GCorrectSegmentVars(
      segmentId: (json['segmentId'] as String),
      correction: _i1.GSegmentCorrectionInput.fromJson(
          (json['correction'] as Map<String, dynamic>)),
    );
  }

  final String segmentId;

  final _i1.GSegmentCorrectionInput correction;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$segmentIdValue = this.segmentId;
    _$result['segmentId'] = _$segmentIdValue;
    final _$correctionValue = this.correction;
    _$result['correction'] = _$correctionValue.toJson();
    return _$result;
  }

  GCorrectSegmentVars copyWith({
    String? segmentId,
    _i1.GSegmentCorrectionInput? correction,
  }) {
    return GCorrectSegmentVars(
      segmentId: segmentId ?? this.segmentId,
      correction: correction ?? this.correction,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCorrectSegmentVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GCorrectSegmentVars(segmentId: $segmentId, correction: $correction)';
  }
}

class GmergeSegmentsVars {
  const GmergeSegmentsVars({
    required this.tripId,
    required this.input,
  });

  factory GmergeSegmentsVars.fromJson(Map<String, dynamic> json) {
    return GmergeSegmentsVars(
      tripId: (json['tripId'] as String),
      input: _i1.GSegmentMergeInput.fromJson(
          (json['input'] as Map<String, dynamic>)),
    );
  }

  final String tripId;

  final _i1.GSegmentMergeInput input;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$inputValue = this.input;
    _$result['input'] = _$inputValue.toJson();
    return _$result;
  }

  GmergeSegmentsVars copyWith({
    String? tripId,
    _i1.GSegmentMergeInput? input,
  }) {
    return GmergeSegmentsVars(
      tripId: tripId ?? this.tripId,
      input: input ?? this.input,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GmergeSegmentsVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GmergeSegmentsVars(tripId: $tripId, input: $input)';
  }
}

class GDeleteSegmentVars {
  const GDeleteSegmentVars({required this.segmentId});

  factory GDeleteSegmentVars.fromJson(Map<String, dynamic> json) {
    return GDeleteSegmentVars(segmentId: (json['segmentId'] as String));
  }

  final String segmentId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$segmentIdValue = this.segmentId;
    _$result['segmentId'] = _$segmentIdValue;
    return _$result;
  }

  GDeleteSegmentVars copyWith({String? segmentId}) {
    return GDeleteSegmentVars(segmentId: segmentId ?? this.segmentId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteSegmentVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GDeleteSegmentVars(segmentId: $segmentId)';
  }
}
