import 'package:latlong2/latlong.dart';
import 'package:map_application/editor/collision_editor.dart';
import 'package:map_application/editor/drag_editor.dart';
import 'package:map_application/editor/pointer_down_editor.dart';
import 'package:map_application/editor/tap_editor.dart';
import 'package:map_application/map_application.dart';

mixin MapElementResolver on MapHitTester {
  MapElementState get state;
  set state(MapElementState value);
  MapEditor get mapEditor;

  void setPanBlocked(bool blocked);

  bool isDraggable(MapElement hit) => switch (hit) {
    MapVertex() => true,
    MapSketchPencil() => true,
    MapCursor() => true,
    _ => false,
  };

  void onPointerDown({required LatLng latLng}) {
    final element = hitTest(latLng);
    final pressedElement = mapEditor.onPointerDown(element, latLng);
    state = Pressed(pressedElement);
    setPanBlocked(isDraggable(pressedElement));
  }

  // Dans MapElementResolver
  void onPointerMove({required LatLng latLng}) {
    switch (state) {
      case Pressed(:final NoMapElement element):
        state = Dragging(element: NoMapElement());

      case Pressed(:final element):
        if (!isDraggable(element)) return;
        state = Dragging(element: element);
        mapEditor.onDragStart(element);

      case Dragging(:final element) when element is! NoMapElement:
        final hit = hitTest(
          latLng,
          exclude: element,
        ); // exclude l'élément dragué
        state = Dragging(element: element);
        final collided = mapEditor.onCollision(element, hit);

        if (collided) {
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
    setPanBlocked(false);
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
