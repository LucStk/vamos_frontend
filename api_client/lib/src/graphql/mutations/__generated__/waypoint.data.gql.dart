// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/src/graphql/fragments/__generated__/trip.data.gql.dart'
    as _i1;

class GUpdateWaypointData {
  const GUpdateWaypointData({
    required this.updateWaypoint,
    this.G__typename = 'Mutation',
  });

  factory GUpdateWaypointData.fromJson(Map<String, dynamic> json) {
    return GUpdateWaypointData(
      updateWaypoint: _i1.GWaypointFieldsData.fromJson(
          (json['updateWaypoint'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GWaypointFieldsData updateWaypoint;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['updateWaypoint'] = this.updateWaypoint.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUpdateWaypointData copyWith({
    _i1.GWaypointFieldsData? updateWaypoint,
    String? G__typename,
  }) {
    return GUpdateWaypointData(
      updateWaypoint: updateWaypoint ?? this.updateWaypoint,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUpdateWaypointData &&
            updateWaypoint == other.updateWaypoint &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, updateWaypoint, G__typename);
  }

  @override
  String toString() {
    return 'GUpdateWaypointData(updateWaypoint: $updateWaypoint, G__typename: $G__typename)';
  }
}
