// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/backend/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/backend/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GUpdateWaypointVars {
  const GUpdateWaypointVars({
    required this.id,
    required this.waypoint,
  });

  factory GUpdateWaypointVars.fromJson(Map<String, dynamic> json) {
    return GUpdateWaypointVars(
      id: (json['id'] as int),
      waypoint: _i1.GWaypointUpdateInput.fromJson(
          (json['waypoint'] as Map<String, dynamic>)),
    );
  }

  final int id;

  final _i1.GWaypointUpdateInput waypoint;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    final _$waypointValue = this.waypoint;
    _$result['waypoint'] = _$waypointValue.toJson();
    return _$result;
  }

  GUpdateWaypointVars copyWith({
    int? id,
    _i1.GWaypointUpdateInput? waypoint,
  }) {
    return GUpdateWaypointVars(
      id: id ?? this.id,
      waypoint: waypoint ?? this.waypoint,
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
    return 'GUpdateWaypointVars(id: $id, waypoint: $waypoint)';
  }
}

class GCreateBlankWaypointFromPositionVars {
  const GCreateBlankWaypointFromPositionVars({
    required this.tripId,
    required this.latLng,
  });

  factory GCreateBlankWaypointFromPositionVars.fromJson(
      Map<String, dynamic> json) {
    return GCreateBlankWaypointFromPositionVars(
      tripId: (json['tripId'] as int),
      latLng:
          _i1.GLatLngInput.fromJson((json['latLng'] as Map<String, dynamic>)),
    );
  }

  final int tripId;

  final _i1.GLatLngInput latLng;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$latLngValue = this.latLng;
    _$result['latLng'] = _$latLngValue.toJson();
    return _$result;
  }

  GCreateBlankWaypointFromPositionVars copyWith({
    int? tripId,
    _i1.GLatLngInput? latLng,
  }) {
    return GCreateBlankWaypointFromPositionVars(
      tripId: tripId ?? this.tripId,
      latLng: latLng ?? this.latLng,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateBlankWaypointFromPositionVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GCreateBlankWaypointFromPositionVars(tripId: $tripId, latLng: $latLng)';
  }
}

class GCreateBlankWaypointFromVertexVars {
  const GCreateBlankWaypointFromVertexVars({
    required this.tripId,
    required this.vertexId,
  });

  factory GCreateBlankWaypointFromVertexVars.fromJson(
      Map<String, dynamic> json) {
    return GCreateBlankWaypointFromVertexVars(
      tripId: (json['tripId'] as int),
      vertexId: (json['vertexId'] as int),
    );
  }

  final int tripId;

  final int vertexId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$vertexIdValue = this.vertexId;
    _$result['vertexId'] = _$vertexIdValue;
    return _$result;
  }

  GCreateBlankWaypointFromVertexVars copyWith({
    int? tripId,
    int? vertexId,
  }) {
    return GCreateBlankWaypointFromVertexVars(
      tripId: tripId ?? this.tripId,
      vertexId: vertexId ?? this.vertexId,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateBlankWaypointFromVertexVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GCreateBlankWaypointFromVertexVars(tripId: $tripId, vertexId: $vertexId)';
  }
}

class GDeleteWaypointVars {
  const GDeleteWaypointVars({required this.waypointId});

  factory GDeleteWaypointVars.fromJson(Map<String, dynamic> json) {
    return GDeleteWaypointVars(waypointId: (json['waypointId'] as int));
  }

  final int waypointId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$waypointIdValue = this.waypointId;
    _$result['waypointId'] = _$waypointIdValue;
    return _$result;
  }

  GDeleteWaypointVars copyWith({int? waypointId}) {
    return GDeleteWaypointVars(waypointId: waypointId ?? this.waypointId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteWaypointVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GDeleteWaypointVars(waypointId: $waypointId)';
  }
}
