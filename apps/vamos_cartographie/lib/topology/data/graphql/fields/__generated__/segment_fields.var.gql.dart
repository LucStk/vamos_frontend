// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GMergeSegmentVars {
  const GMergeSegmentVars({
    required this.tripId,
    required this.input,
  });

  factory GMergeSegmentVars.fromJson(Map<String, dynamic> json) {
    return GMergeSegmentVars(
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

  GMergeSegmentVars copyWith({
    String? tripId,
    _i1.GSegmentMergeInput? input,
  }) {
    return GMergeSegmentVars(
      tripId: tripId ?? this.tripId,
      input: input ?? this.input,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GMergeSegmentVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GMergeSegmentVars(tripId: $tripId, input: $input)';
  }
}
