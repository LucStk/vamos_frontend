import 'dart:async';
import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';

/// Orchestre le cycle de vie d'un geste pointeur (down → move → up),
/// décide tap/double-tap/drag, et dispatche vers MapEditor.
/// Pure côté état applicatif : ne possède aucun GestureState — le
/// reçoit en entrée de [handle] et retourne le nouvel état, à charge
/// de l'appelant de le conserver. Conserve en interne uniquement des
/// détails de reconnaissance de geste (slop, timer de double tap) qui
/// n'ont pas vocation à être exposés/persistés ailleurs.
/// Ne connaît MapHitTester et MapEditor que comme dépendances injectées.
class PointerGestureController {
  final MapHitTester hitTester;
  final MapEditor mapEditor;
  final void Function(bool blocked) setPanBlocked;
  final double tapSlopPx;
  final Duration doubleTapTimeout;
  final double doubleTapMaxDistancePx;

  PointerGestureController({
    required this.hitTester,
    required this.mapEditor,
    required this.setPanBlocked,
    this.tapSlopPx = 8,
    this.doubleTapTimeout = const Duration(milliseconds: 300),
    this.doubleTapMaxDistancePx = 24,
  });

  /// Point de pression initial — détail de reconnaissance du drag (slop).
  Point<double>? _pressPoint;

  /// État interne de détection du double tap.
  Timer? _pendingTapTimer;
  Point<double>? _pendingTapPoint;
  MapElement? _pendingTapElement;

  /// Point d'entrée unique pour les trois gestes primaires.
  /// [state] est l'état courant ; la valeur retournée est le nouvel
  /// état à conserver par l'appelant (ex: ValueNotifier<GestureState>).
  GestureState handle(GestureState state, MapPointerEvent event) {
    return switch (event) {
      MapPointerDown(:final latLng) => _handleDown(latLng),
      MapPointerMove(:final latLng) => _handleMove(state, latLng),
      MapPointerUp(:final latLng) => _handleUp(state, latLng),
    };
  }

  GestureState _handleDown(LatLng latLng) {
    final element = hitTester.hitTest(latLng);
    final pressedElement = mapEditor.onPointerDown(element, latLng);
    _pressPoint = hitTester.project(latLng);
    setPanBlocked(pressedElement.isDraggable);
    return Pressed(pressedElement);
  }

  GestureState _handleMove(GestureState state, LatLng latLng) {
    final position = hitTester.project(latLng);
    switch (state) {
      case Pressed(element: NoMapElement()):
        if (_pressPoint != null &&
            _distancePx(_pressPoint!, position) < tapSlopPx) {
          return state; // encore potentiellement un tap, pas un drag
        }
        return Dragging(element: NoMapElement());

      case Pressed(:final element):
        if (!element.isDraggable) return state;
        mapEditor.onDragStart(element);
        return Dragging(element: element);

      case Dragging(:final element) when element is! NoMapElement:
        mapEditor.onDragUpdate(element, latLng);
        final hit = hitTester.hitTest(latLng, exclude: element);
        final collided = mapEditor.onCollision(element, hit);
        if (collided) return const EmptyState();
        return Dragging(element: element);

      case _:
        return state;
    }
  }

  GestureState _handleUp(GestureState state, LatLng latLng) {
    setPanBlocked(false);
    _pressPoint = null;

    switch (state) {
      case Pressed(:final element):
        _handleTap(element, latLng);
      case Dragging(:final element):
        cancelPendingTap();
        mapEditor.onDragEnd(element, latLng);
      case _:
    }

    return const EmptyState();
  }

  // ---------------------------------------------------------------------
  // Détection tap simple / double tap
  // ---------------------------------------------------------------------

  void _handleTap(MapElement element, LatLng latLng) {
    if (!element.awaitsDoubleTap) {
      // Élément exempté du double tap : on annule tout tap en attente
      // sur un autre élément (pour ne pas laisser un double tap fantôme
      // se déclencher plus tard sur cet ancien élément) et on déclenche
      // immédiatement, sans latence.
      cancelPendingTap();
      mapEditor.onTapped(element, latLng);
      return;
    }

    final point = hitTester.project(latLng);

    final isDouble =
        _pendingTapTimer != null &&
        _pendingTapElement != null &&
        isSameHitTarget(_pendingTapElement!, element) &&
        _distancePx(_pendingTapPoint!, point) <= doubleTapMaxDistancePx;

    if (isDouble) {
      cancelPendingTap();
      mapEditor.onDoubleTapped(element, latLng);
      return;
    }

    cancelPendingTap();
    _pendingTapPoint = point;
    _pendingTapElement = element;
    _pendingTapTimer = Timer(doubleTapTimeout, () {
      mapEditor.onTapped(element, latLng);
      _pendingTapTimer = null;
      _pendingTapPoint = null;
      _pendingTapElement = null;
    });
  }

  void cancelPendingTap() {
    _pendingTapTimer?.cancel();
    _pendingTapTimer = null;
    _pendingTapPoint = null;
    _pendingTapElement = null;
  }

  void dispose() => cancelPendingTap();

  double _distancePx(Point<double> a, Point<double> b) =>
      sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));
}
