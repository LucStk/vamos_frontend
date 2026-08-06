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
        return DragStartEvent(element);

      case Dragging(:final element):
        final hit = hitTest(element); // exclude l'élément dragué
        state = Dragging(element: element);
        final collisionEvent = _checkCollision(hit, element, latLng);
        if (collisionEvent != null) return collisionEvent;
        return DragUpdateEvent(element, latLng);

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
    _ => DragEndEvent(dragged, latLng),
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
        if (element is NoMapElement) {
          return MapTapped(latLng);
        }
        return TapEvent(element, latLng);

      case Dragging(element: MapVertex(:final vertex)):

        // Snap détecté au relâcher : fusion des deux vertex
        return null; //VertexMergeRequested(vertex.id, target.id);

      case Dragging(:final element):
        return DragEndEvent(element, latLng);

      case _:
        return null;
    }
  }
}
