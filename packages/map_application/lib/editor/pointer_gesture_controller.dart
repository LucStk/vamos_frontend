import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';

mixin PointerGestureController on MapHitTester {
  GestureState get state;
  set state(GestureState value);

  MapEditor get mapEditor;
  void setPanBlocked(bool blocked);

  // ---------------------------------------------------------------------
  // Réglages ajustables par l'implémentation
  // ---------------------------------------------------------------------
  double get tapSlopPx => 8;
  Duration get doubleTapTimeout => const Duration(milliseconds: 300);
  double get doubleTapMaxDistancePx => 24;

  /// Construit paresseusement, une fois que `project`/`mapEditor` (fournis
  /// par les mixins/classe hôte) sont accessibles.
  late final TapEngine _tapEngine = TapEngine(
    project: project,
    onTap: (element, latLng) => mapEditor.onTapped(element, latLng),
    onDoubleTap: (element, latLng) => mapEditor.onDoubleTapped(element, latLng),
    doubleTapTimeout: doubleTapTimeout,
    doubleTapMaxDistancePx: doubleTapMaxDistancePx,
  );
  void cancelPendingTap() {
    _tapEngine.cancelPendingTap();
  }

  Point<double>? _pressPoint;

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
    _pressPoint = project(latLng);
    setPanBlocked(isDraggable(pressedElement));
  }

  void onPointerMove({required LatLng latLng}) {
    final position = project(latLng);
    switch (state) {
      case Pressed(:final NoMapElement element):
        if (_pressPoint != null &&
            _distancePx(_pressPoint!, position) < tapSlopPx) {
          return; // encore potentiellement un tap, pas un drag
        }
        state = Dragging(element: NoMapElement());
      case Pressed(:final element):
        if (!isDraggable(element)) return;
        state = Dragging(element: element);
        mapEditor.onDragStart(element);
      case Dragging(:final element) when element is! NoMapElement:
        mapEditor.onDragUpdate(element, latLng);
        final hit = hitTest(latLng, exclude: element);
        state = Dragging(element: element);
        final collided = mapEditor.onCollision(element, hit);
        if (collided) {
          state = const EmptyState();
          return;
        }
      case _:
        return;
    }
  }

  void onPointerUp(LatLng latLng) {
    final lastState = state;
    setPanBlocked(false);
    state = const EmptyState();
    _pressPoint = null;

    switch (lastState) {
      case Pressed(:final element):
        _tapEngine.handleTap(element, latLng);
      case Dragging(:final element):
        _tapEngine.cancelPendingTap();
        mapEditor.onDragEnd(element, latLng);
      case _:
    }
  }

  /// À appeler depuis le dispose() du widget hôte, pour éviter un
  /// callback de timer sur un état démonté.
  void disposeTapTracking() => _tapEngine.dispose();
  double _distancePx(Point<double> a, Point<double> b) =>
      sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));
}
