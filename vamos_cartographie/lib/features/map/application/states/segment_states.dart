// features/map/presentation/providers/map_state_provider.dart
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "package:vamos_cartographie/features/segments/domain/entities/segment.dart";
part 'segment_states.freezed.dart';

@freezed
sealed class LineNode with _$LineNode {
  const LineNode._();

  const factory LineNode.waypoint({
    required String uid,
    required int waypointId,
    required LatLng latLng,
  }) = WaypointNode;

  const factory LineNode.intermediate({
    required String uid,
    required int index,
    required LatLng latLng,
  }) = IntermediateNode;

  const factory LineNode.middleVertex({
    required String uid,
    required String vertexId,
    required LatLng latLng,
  }) = MiddleVertexNode;

  LatLng get position => switch (this) {
    WaypointNode(:final latLng) => latLng,
    IntermediateNode(:final latLng) => latLng,
    MiddleVertexNode(:final latLng) => latLng,
  };
}
