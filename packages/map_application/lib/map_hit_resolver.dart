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

  bool get shouldPanMap => switch (state) {
    Dragging() => false,
    _ => true,
  };

  MapEvent? onPointerMove({
    required Point<double> point,
    required LatLng latLng,
    VertexId? snapTargetId,
  }) {
    switch (state) {
      case Pressed(:final hit, :final downPoint):
        if (point.squaredDistanceTo(downPoint) <= 4) return null;
        state = Dragging(hit, snapTargetId: snapTargetId);
        return _dragStartEvent(hit, latLng);

      case Dragging(:final hit):
        state = Dragging(hit, snapTargetId: snapTargetId);
        return _dragUpdateEvent(hit, latLng, snapTargetId);

      case _:
        return null;
    }
  }

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
    VertexHit() => VertexDragUpdated(latLng),
    _ => null,
  };

  MapEvent? _dragEndEvent(MapHit hit, LatLng latLng) => switch (hit) {
    CursorHit() => CursorDraggedEnd(latLng),
    VertexHit(:final vertex) => VertexDragEnded(vertex.id, latLng),
    _ => null,
  };
}
