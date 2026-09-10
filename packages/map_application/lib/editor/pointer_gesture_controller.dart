import 'dart:async';
import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';

double distancePx(Point<double> a, Point<double> b) =>
    sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));

class PendingTap {
  /// État interne de détection du double tap.
  final Timer pendingTapTimer;
  final Point<double> pendingTapPoint;
  final MapObject? pendingTapElement;
  final Duration doubleTapTimeout;
  final double doubleTapMaxDistancePx;

  PendingTap({
    required this.pendingTapElement,
    required this.pendingTapPoint,
    required void Function() onTap,
    this.doubleTapMaxDistancePx = 24,
    this.doubleTapTimeout = const Duration(milliseconds: 300),
  }) : pendingTapTimer = Timer(doubleTapTimeout, onTap);

  void cancel() {
    pendingTapTimer.cancel();
  }

  bool compare(MapObject? element, Point<double> point) {
    if (element == null || pendingTapElement == null) return false;
    return pendingTapElement!.isSameAs(element) &&
        distancePx(pendingTapPoint, point) <= doubleTapMaxDistancePx;
  }
}

/// Orchestre le cycle de vie d'un geste pointeur (down → move → up),
/// décide tap/double-tap/drag, et dispatche vers MapContext.
/// Pure côté état applicatif : ne possède aucun GestureState — le
/// reçoit en entrée de [handle] et retourne le nouvel état, à charge
/// de l'appelant de le conserver. Conserve en interne uniquement des
/// détails de reconnaissance de geste (slop, timer de double tap) qui
/// n'ont pas vocation à être exposés/persistés ailleurs.
/// Ne connaît MapHitTester et MapContext que comme dépendances injectées.
class PointerGestureController {
  final MapHitTester hitTester;
  final void Function(bool blocked) setPanBlocked;
  final double tapSlopPx;

  PointerGestureController({
    required this.hitTester,
    required this.setPanBlocked,
    this.tapSlopPx = 8,
  });

  /// Point de pression initial — détail de reconnaissance du drag (slop).
  Point<double>? _pressPoint;
  PendingTap? _pendingTap;

  /// Point d'entrée unique pour les trois gestes primaires.
  /// [state] est l'état courant ; la valeur retournée est le nouvel
  GestureState handle(GestureState state, MapPointerEvent event) {
     switch (event) {
      case MapPointerDown(:final latLng) :
        final element = hitTester.hitTest(latLng);
        final pressedElement = mapContext.onPointerDown(element, latLng);
        _pressPoint = hitTester.project(latLng);
        setPanBlocked(pressedElement.isDraggable);
        return Pressed(pressedElement);

      case MapPointerMove(:final latLng) :,
      case MapPointerUp(:final latLng) :,
    };
  }

  GestureState _handleDown(LatLng latLng) {

  }

  GestureState _handleMove(GestureState state, LatLng latLng) {
    final position = hitTester.project(latLng);
    switch (state) {
      case Pressed(element: null):
        if (_pressPoint != null &&
            distancePx(_pressPoint!, position) < tapSlopPx) {
          return state; // encore potentiellement un tap, pas un drag
        }
        mapContext.onDragStart();
        return Dragging();

      case Pressed(:final element):
        if (element != null && !element.isDraggable) return state;
        mapContext.onDragStart(element: element);
        return Dragging(dragged: element);

      case Dragging(:final dragged) when dragged != null:
        final target = hitTester.hitTest(latLng, exclude: dragged);
        mapContext.onDragUpdate(
          dragged: dragged,
          target: target,
          latLng: latLng,
        );
        return Dragging(dragged: dragged, target: target);

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
      case Dragging(:final dragged, :final target):
        cancelPendingTap();
        mapContext.onDragEnd(dragged: dragged, target: target, latLng: latLng);
      case _:
    }

    return const EmptyState();
  }

  // ---------------------------------------------------------------------
  // Détection tap simple / double tap
  // ---------------------------------------------------------------------

  void _handleTap(MapObject? element, LatLng latLng) {
    if (element != null && !element.awaitsDoubleTap) {
      // Élément exempté du double tap : on annule tout tap en attente
      // sur un autre élément (pour ne pas laisser un double tap fantôme
      // se déclencher plus tard sur cet ancien élément) et on déclenche
      // immédiatement, sans latence.
      cancelPendingTap();
      mapContext.onTapped(element, latLng);
      return;
    }

    final point = hitTester.project(latLng);

    if (_pendingTap != null && _pendingTap!.compare(element, point)) {
      cancelPendingTap();
      mapContext.onDoubleTapped(element, latLng);
      return;
    }

    _pendingTap?.cancel();
    _pendingTap = PendingTap(
      pendingTapPoint: point,
      pendingTapElement: element,
      onTap: () {
        mapContext.onTapped(element, latLng);
        _pendingTap = null;
      },
    );
  }

  void cancelPendingTap() {
    _pendingTap?.cancel();
    _pendingTap = null;
  }

  void dispose() => cancelPendingTap();
}
