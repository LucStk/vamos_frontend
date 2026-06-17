import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/map/interaction/state/interaction_mode.dart';
import 'package:vamos_cartographie/features/map/interaction/state/map_cursor.dart';
import 'package:vamos_cartographie/features/map/interaction/state/map_interaction_state.dart';
import 'package:vamos_cartographie/features/map/interaction/state/pop_up.dart';
import 'package:vamos_cartographie/features/map/presentation/pop_up/pop_up.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';
part "map_interaction_controller.g.dart";

@riverpod
class MapInteractionController extends _$MapInteractionController {
  @override
  MapInteractionState build(Id<Trip> tripId) {
    return MapInteractionState.initial();
  }

  void onMapTap(LatLng pos) {
    state = state.copyWith(
      mode: InteractionMode.idle,
      popup: null,
      cursor: MapCursorState(latLng: pos, isOpen: true),
    );
  }

  void onVertexTap(Id<Vertex> vertexId) {
    state = state.copyWith(
      mode: InteractionMode.tappingVertex,
      activeVertex: vertexId,
    );
  }

  void onWaypointTap(Id<Waypoint> waypointId) {
    state = state.copyWith(
      mode: InteractionMode.tappingWaypoint,
      activeWaypoint: waypointId,
      popup: MapPopupState(WaypointPopUp(tripId: tripId,vertexId: vertexId));
    );
  }
  void onWaypointDoubleTap(Id<Waypoint> waypointId) {
    state = state.copyWith(
      mode: InteractionMode.tappingWaypoint,
      activeWaypoint: waypointId,
      popup: MapPopupState(WaypointPopUp(tripId: tripId,vertexId: vertexId));
    );
  }
  void onVertexDragStart(Id<Vertex> id) {
    state = state.copyWith(
      mode: InteractionMode.draggingVertex,
      activeVertex: id,
      popup: null, // important: fermeture auto
    );
  }

  void onVertexDrag(Id<Vertex> id, LatLng pos) {
    state = state.copyWith(cursor: MapCursorState(latLng: pos, isOpen: true));
  }

  void onVertexDragEnd(Id<Vertex> id, LatLng pos) {
    state = state.copyWith(mode: InteractionMode.idle, activeVertex: null);

    ref.read(vertexOrchestratorProvider(tripId).notifier).moveVertex(id, pos);
  }

  void onHoverSegment(LayerHitResult<Id<Segment>>? hitResult) {
    state = state.copyWith(segmentHit: hitResult);
  }

  void onSegmentTap(Id<Segment> segmentId, Offset tapOffset, MapCamera camera) {
    final tapPosition = camera.screenOffsetToLatLng(tapOffset);

    debugPrint("Segment clicked: $segmentId");
    debugPrint("LatLng: $tapPosition");

    // // exemple interaction → popup segment
    // state = state.copyWith(
    //   popup: MapPopupState(
    //     latLng: tapPosition,
    //     popUp: SegmentPopUp(segmentId: segmentId),
    //   ),
    // );

    // // ou délégation orchestrator
    // ref.read(segmentOrchestratorProvider(tripId).notifier).select(segmentId);
  }
}
