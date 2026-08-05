import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';

mixin MapElementResolver {
  MapElementState get state;
  set state(MapElementState value);

  MapEvent? onPointerDown({
    required MapElement hit,
    required Point<double> point,
  }) {
    state = Pressed(hit, point);
    print("map hit $hit");
    return null;
  }

  // Dans MapElementResolver
  MapEvent? onPointerMove({
    required Point<double> point,
    required LatLng latLng,
    required MapElement Function(MapElement? exclude) hitTest, // ← injecté
  }) {
    switch (state) {
      case Pressed(:final element):
        if (!isDraggable(element)) {
          state = const EmptyState();
          return null;
        }
        state = Dragging(element: element);
        return _dragStartEvent(element, latLng);

      case Dragging(:final element):
        final hit = hitTest(element); // exclude l'élément dragué
        state = Dragging(element: element);
        final collisionEvent = _checkCollision(hit, element, latLng);
        if (collisionEvent != null) return collisionEvent;
        return _dragUpdateEvent(element, latLng);

      case _:
        return null;
    }
  }

  MapEvent? _checkCollision(MapElement hit, MapElement dragged, LatLng latLng) {
    if (hit is NoMapElement) return null;
    state = EmptyState();
    return _onDropOnTarget(dragged: dragged, target: hit, latLng: latLng);
  }

  MapEvent? _onDropOnTarget({
    required MapElement dragged,
    required MapElement target,
    required LatLng latLng,
  }) => switch ((dragged, target)) {
    // (MapVertex(:final vertex), MapVertex(vertex: final targetVertex)) =>
    //   VertexMergeRequested(vertex.id, targetVertex.id),
    // (MapCursor(), MapVertex(:final vertex)) => CursorSnappedToVertex(
    //   vertex,
    // ), // exemple
    _ => _dragEndEvent(dragged, latLng),
  };
  bool isDraggable(MapElement hit) => switch (hit) {
    MapVertex() => true,
    MapSketchPencil() => true,
    MapCursor() => true,
    _ =>
      false, // NoHit, SegmentHit, SketchSegmentHit... => pan natif de la carte
  };

  MapEvent? onPointerUp(LatLng latLng) {
    final lastState = state;
    state = const EmptyState();
    switch (lastState) {
      case Pressed(:final element):
        return _tapEvent(element, latLng);

      case Dragging(element: MapVertex(:final vertex)):

        // Snap détecté au relâcher : fusion des deux vertex
        return null; //VertexMergeRequested(vertex.id, target.id);

      case Dragging(:final element):
        return _dragEndEvent(element, latLng);

      case _:
        return null;
    }
  }

  MapEvent? _tapEvent(MapElement hit, LatLng latLng) => switch (hit) {
    MapCursor() => CursorTapped(latLng),
    MapVertex(:final vertex) => VertexTapped(vertex),
    MapSegment(:final segmentId) => SegmentTapped(segmentId),
    MapSketchSegment() => SketchSegmentTapped(latLng),
    MapSketchPencil() => null,
    NoMapElement() => MapTapped(latLng),
  };

  MapEvent? _dragStartEvent(MapElement hit, LatLng latLng) => switch (hit) {
    MapCursor() => CursorDraggedStart(latLng),
    MapVertex(:final vertex) => VertexDragStarted(vertex.id),
    MapSketchPencil() => SketchPencilDragUpdate(latLng: latLng),
    _ => null,
  };

  MapEvent? _dragUpdateEvent(MapElement element, LatLng latLng) =>
      switch (element) {
        MapCursor() => CursorDragUpdate(latLng),
        MapVertex(:final vertex) => VertexDragUpdated(vertex.id, latLng),
        MapSketchPencil() => SketchPencilDragUpdate(latLng: latLng),
        _ => null,
      };

  MapEvent? _dragEndEvent(MapElement hit, LatLng latLng) => switch (hit) {
    MapCursor() => CursorDraggedEnd(latLng),
    MapVertex(:final vertex) => VertexDragEnded(vertex.id, latLng),
    _ => null,
  };
}
