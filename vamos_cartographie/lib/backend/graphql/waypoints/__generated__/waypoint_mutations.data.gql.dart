// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/backend/graphql/waypoints/__generated__/waypoint_fields.data.gql.dart'
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

class GCreateWaypointData {
  const GCreateWaypointData({
    required this.createWaypoint,
    this.G__typename = 'Mutation',
  });

  factory GCreateWaypointData.fromJson(Map<String, dynamic> json) {
    return GCreateWaypointData(
      createWaypoint: _i1.GCreateWaypointPayloadFieldsData.fromJson(
          (json['createWaypoint'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GCreateWaypointPayloadFieldsData createWaypoint;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['createWaypoint'] = this.createWaypoint.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateWaypointData copyWith({
    _i1.GCreateWaypointPayloadFieldsData? createWaypoint,
    String? G__typename,
  }) {
    return GCreateWaypointData(
      createWaypoint: createWaypoint ?? this.createWaypoint,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateWaypointData &&
            createWaypoint == other.createWaypoint &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, createWaypoint, G__typename);
  }

  @override
  String toString() {
    return 'GCreateWaypointData(createWaypoint: $createWaypoint, G__typename: $G__typename)';
  }
}

class GDeleteWaypointData {
  const GDeleteWaypointData({
    required this.deleteWaypoint,
    this.G__typename = 'Mutation',
  });

  factory GDeleteWaypointData.fromJson(Map<String, dynamic> json) {
    return GDeleteWaypointData(
      deleteWaypoint: (json['deleteWaypoint'] as bool),
      G__typename: (json['__typename'] as String),
    );
  }

  final bool deleteWaypoint;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['deleteWaypoint'] = this.deleteWaypoint;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDeleteWaypointData copyWith({
    bool? deleteWaypoint,
    String? G__typename,
  }) {
    return GDeleteWaypointData(
      deleteWaypoint: deleteWaypoint ?? this.deleteWaypoint,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteWaypointData &&
            deleteWaypoint == other.deleteWaypoint &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, deleteWaypoint, G__typename);
  }

  @override
  String toString() {
    return 'GDeleteWaypointData(deleteWaypoint: $deleteWaypoint, G__typename: $G__typename)';
  }
}
