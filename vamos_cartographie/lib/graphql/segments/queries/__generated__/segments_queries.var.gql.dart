// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GGetSegmentsVars {
  const GGetSegmentsVars({required this.tripId});

  factory GGetSegmentsVars.fromJson(Map<String, dynamic> json) {
    return GGetSegmentsVars(tripId: (json['tripId'] as int));
  }

  final int tripId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    return _$result;
  }

  GGetSegmentsVars copyWith({int? tripId}) {
    return GGetSegmentsVars(tripId: tripId ?? this.tripId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetSegmentsVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GGetSegmentsVars(tripId: $tripId)';
  }
}
