// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/src/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:api_client/src/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GUpdateWaypointVars {
  const GUpdateWaypointVars({
    required this.waypoint,
    required this.id,
  });

  factory GUpdateWaypointVars.fromJson(Map<String, dynamic> json) {
    return GUpdateWaypointVars(
      waypoint: _i1.GWaypointInput.fromJson(
          (json['waypoint'] as Map<String, dynamic>)),
      id: (json['id'] as int),
    );
  }

  final _i1.GWaypointInput waypoint;

  final int id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$waypointValue = this.waypoint;
    _$result['waypoint'] = _$waypointValue.toJson();
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GUpdateWaypointVars copyWith({
    _i1.GWaypointInput? waypoint,
    int? id,
  }) {
    return GUpdateWaypointVars(
      waypoint: waypoint ?? this.waypoint,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUpdateWaypointVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GUpdateWaypointVars(waypoint: $waypoint, id: $id)';
  }
}
