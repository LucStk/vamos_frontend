import 'dart:math';

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

  // ---------------------------------------------------------------------
  // Double tap — réglages ajustables par l'implémentation
  // ---------------------------------------------------------------------
  Duration get doubleTapTimeout => const Duration(milliseconds: 300);
  double get doubleTapMaxDistancePx => 24;

  DateTime? _lastTapTime;
  Point<double>? _lastTapPoint;
  MapElement? _lastTapElement;

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
        mapEditor.onDragUpdate(element, latLng);
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
        if (_registerTapAndCheckDouble(element, latLng)) {
          mapEditor.onDoubleTapped(element, latLng);
        } else {
          mapEditor.onTapped(element, latLng);
        }
      case Dragging(:final element):
        _resetTapTracking();
        mapEditor.onDragEnd(element, latLng);
      case _:
    }
  }

  // ---------------------------------------------------------------------
  // Détection double tap
  // ---------------------------------------------------------------------

  /// Enregistre le tap courant et renvoie true s'il complète un double tap
  /// avec le tap précédent (même élément logique, dans la fenêtre de temps
  /// et de distance autorisée).
  bool _registerTapAndCheckDouble(MapElement element, LatLng latLng) {
    final now = DateTime.now();
    final point = project(latLng);

    final isDouble =
        _lastTapTime != null &&
        _lastTapElement != null &&
        isSameHitTarget(_lastTapElement!, element) &&
        now.difference(_lastTapTime!) <= doubleTapTimeout &&
        _distancePx(_lastTapPoint!, point) <= doubleTapMaxDistancePx;

    if (isDouble) {
      // Un 3e tap rapproché ne doit pas être vu comme un nouveau double tap
      _resetTapTracking();
    } else {
      _lastTapTime = now;
      _lastTapPoint = point;
      _lastTapElement = element;
    }

    return isDouble;
  }

  void _resetTapTracking() {
    _lastTapTime = null;
    _lastTapPoint = null;
    _lastTapElement = null;
  }

  double _distancePx(Point<double> a, Point<double> b) =>
      sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));
}
