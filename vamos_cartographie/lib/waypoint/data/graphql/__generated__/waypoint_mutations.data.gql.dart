// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/core/graphql/waypoints/__generated__/waypoint_fields.data.gql.dart'
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

class GCreateBlankWaypointFromPositionData {
  const GCreateBlankWaypointFromPositionData({
    required this.createBlankWaypointFromPosition,
    this.G__typename = 'Mutation',
  });

  factory GCreateBlankWaypointFromPositionData.fromJson(
      Map<String, dynamic> json) {
    return GCreateBlankWaypointFromPositionData(
      createBlankWaypointFromPosition:
          _i1.GCreateWaypointPayloadFieldsData.fromJson(
              (json['createBlankWaypointFromPosition']
                  as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GCreateWaypointPayloadFieldsData createBlankWaypointFromPosition;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['createBlankWaypointFromPosition'] =
        this.createBlankWaypointFromPosition.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateBlankWaypointFromPositionData copyWith({
    _i1.GCreateWaypointPayloadFieldsData? createBlankWaypointFromPosition,
    String? G__typename,
  }) {
    return GCreateBlankWaypointFromPositionData(
      createBlankWaypointFromPosition: createBlankWaypointFromPosition ??
          this.createBlankWaypointFromPosition,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateBlankWaypointFromPositionData &&
            createBlankWaypointFromPosition ==
                other.createBlankWaypointFromPosition &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, createBlankWaypointFromPosition, G__typename);
  }

  @override
  String toString() {
    return 'GCreateBlankWaypointFromPositionData(createBlankWaypointFromPosition: $createBlankWaypointFromPosition, G__typename: $G__typename)';
  }
}

class GCreateBlankWaypointFromVertexData {
  const GCreateBlankWaypointFromVertexData({
    required this.createBlankWaypointFromVertex,
    this.G__typename = 'Mutation',
  });

  factory GCreateBlankWaypointFromVertexData.fromJson(
      Map<String, dynamic> json) {
    return GCreateBlankWaypointFromVertexData(
      createBlankWaypointFromVertex:
          _i1.GCreateWaypointPayloadFieldsData.fromJson(
              (json['createBlankWaypointFromVertex'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GCreateWaypointPayloadFieldsData createBlankWaypointFromVertex;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['createBlankWaypointFromVertex'] =
        this.createBlankWaypointFromVertex.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateBlankWaypointFromVertexData copyWith({
    _i1.GCreateWaypointPayloadFieldsData? createBlankWaypointFromVertex,
    String? G__typename,
  }) {
    return GCreateBlankWaypointFromVertexData(
      createBlankWaypointFromVertex:
          createBlankWaypointFromVertex ?? this.createBlankWaypointFromVertex,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateBlankWaypointFromVertexData &&
            createBlankWaypointFromVertex ==
                other.createBlankWaypointFromVertex &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, createBlankWaypointFromVertex, G__typename);
  }

  @override
  String toString() {
    return 'GCreateBlankWaypointFromVertexData(createBlankWaypointFromVertex: $createBlankWaypointFromVertex, G__typename: $G__typename)';
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
