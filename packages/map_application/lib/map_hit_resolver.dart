import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:map_application/editor/collision_editor.dart';
import 'package:map_application/editor/drag_editor.dart';
import 'package:map_application/editor/tap_editor.dart';
import 'package:map_application/map_application.dart';

mixin MapElementResolver {
  MapElementState get state;
  set state(MapElementState value);
  MapEditor get mapEditor;

  bool isDraggable(MapElement hit) => switch (hit) {
    MapVertex() => true,
    MapSketchPencil() => true,
    MapCursor() => true,
    _ => false,
  };

  void onPointerDown({required MapElement hit, required Point<double> point}) {
    state = Pressed(hit, point);
  }

  // Dans MapElementResolver
  void onPointerMove({
    required Point<double> point,
    required LatLng latLng,
    required MapElement Function(MapElement? exclude) hitTest, // ← injecté
  }) {
    switch (state) {
      case Pressed(:final element):
        if (!isDraggable(element)) return;
        state = Dragging(element: element);
        mapEditor.onDragStart(element);

      case Dragging(:final element):
        final hit = hitTest(element); // exclude l'élément dragué
        state = Dragging(element: element);
        final b = mapEditor.isColliding(
          dragged: element,
          target: hit,
          latLng: latLng,
        );
        if (b) {
          mapEditor.onCollision(element, hit);
          state = const EmptyState();
          return;
        }
        mapEditor.onDragUpdate(element, latLng);
      case _:
        return;
    }
  }

  void onPointerUp(LatLng latLng) {
    final lastState = state;
    state = const EmptyState();
    switch (lastState) {
      case Pressed(:final element):
        mapEditor.onTapped(element, latLng);
      case Dragging(:final element):
        mapEditor.onDragEnd(element, latLng);
      case _:
    }
  }
}
