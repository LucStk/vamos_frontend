// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/backend/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/backend/graphql/__generated__/schema.utils.gql.dart'
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
      tripId: (json['tripId'] as int),
      segment: _i1.GSegmentCreateInput.fromJson(
          (json['segment'] as Map<String, dynamic>)),
    );
  }

  final int tripId;

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
    int? tripId,
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
