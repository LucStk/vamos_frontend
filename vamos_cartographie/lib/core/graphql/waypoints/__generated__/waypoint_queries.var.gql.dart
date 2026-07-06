// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GGetWaypointsVars {
  const GGetWaypointsVars({required this.tripId});

  factory GGetWaypointsVars.fromJson(Map<String, dynamic> json) {
    return GGetWaypointsVars(tripId: (json['tripId'] as String));
  }

  final String tripId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    return _$result;
  }

  GGetWaypointsVars copyWith({String? tripId}) {
    return GGetWaypointsVars(tripId: tripId ?? this.tripId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetWaypointsVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GGetWaypointsVars(tripId: $tripId)';
  }
}
