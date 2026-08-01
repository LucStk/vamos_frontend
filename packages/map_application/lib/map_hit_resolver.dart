import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';

mixin MapHitResolver {
  MapHitState get state;
  set state(MapHitState value);

  MapEvent? onPointerDown({required MapHit hit, required Point<double> point}) {
    state = Pressed(hit, point);
    return null;
  }

  MapEvent? onPointerMove({
    required Point<double> point,
    required LatLng latLng,
    VertexId? snapTargetId,
  }) {
    switch (state) {
      case Pressed(:final hit): //:final downPoint):
        // if (point.squaredDistanceTo(downPoint) <= 2) return null;
        // Seuls certains hits déclenchent un VRAI drag métier
        if (!isDraggable(hit)) {
          state =
              const EmptyState(); // on laisse flutter_map gérer le pan natif
          return null;
        }
        state = Dragging(hit, snapTargetId: snapTargetId);
        return _dragStartEvent(hit, latLng);

      case Dragging(:final hit):
        state = Dragging(hit, snapTargetId: snapTargetId);
        return _dragUpdateEvent(hit, latLng, snapTargetId);

      case _:
        return null;
    }
  }

  bool isDraggable(MapHit hit) => switch (hit) {
    VertexHit() => true,
    CursorHit() => true,
    _ =>
      false, // NoHit, SegmentHit, SketchSegmentHit... => pan natif de la carte
  };

  MapEvent? onPointerUp(LatLng latLng) {
    final lastState = state;
    state = const EmptyState();

    switch (lastState) {
      case Pressed(:final hit):
        return _tapEvent(hit, latLng);

      // case Dragging(hit: VertexHit(:final vertex), :final snapTargetId?):
      // return VertexMergeRequested(vertex, snapTargetId);

      case Dragging(:final hit):
        return _dragEndEvent(hit, latLng);

      case _:
        return null;
    }
  }

  MapEvent? _tapEvent(MapHit hit, LatLng latLng) => switch (hit) {
    CursorHit() => CursorTapped(latLng),
    VertexHit(:final vertex) => VertexTapped(vertex),
    SegmentHit(:final segmentId) => SegmentTapped(segmentId),
    SketchSegmentHit() => SketchSegmentTapped(latLng),
    SketchPencilHit() => null,
    NoHit() => MapTapped(latLng),
  };

  MapEvent? _dragStartEvent(MapHit hit, LatLng latLng) => switch (hit) {
    CursorHit() => CursorDraggedStart(latLng),
    VertexHit(:final vertex) => VertexDragStarted(vertex.id),
    _ => null,
  };

  MapEvent? _dragUpdateEvent(
    MapHit hit,
    LatLng latLng,
    VertexId? snapTargetId,
  ) => switch (hit) {
    CursorHit() => CursorDragUpdate(latLng),
    VertexHit(:final vertex) => VertexDragUpdated(vertex.id, latLng),
    _ => null,
  };

  MapEvent? _dragEndEvent(MapHit hit, LatLng latLng) => switch (hit) {
    CursorHit() => CursorDraggedEnd(latLng),
    VertexHit(:final vertex) => VertexDragEnded(vertex.id, latLng),
    _ => null,
  };
}
