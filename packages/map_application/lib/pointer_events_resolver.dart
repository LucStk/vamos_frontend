import 'dart:async';
import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:map_application/gestures_resolver/gestures_resolver.dart';
import 'package:map_application/gestures_resolver/resolvers.dart';
import 'package:map_application/map_application.dart';
import 'package:map_application/map_camera_controller.dart';

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
abstract class PointerGestureController {
  final double tapSlopPx = 8;
  GestureState gestureState = EmptyState();
  GesturesResolver get gesturesResolver;
  MapCameraController get camera;
  MapHitTester get hitTester;

  set setPanBlocked(bool blocked);

  /// Point de pression initial — détail de reconnaissance du drag (slop).
  Point<double>? _pressPoint;
  PendingTap? _pendingTap;

  /// Point d'entrée unique pour les trois gestes primaires.
  /// [state] est l'état courant ; la valeur retournée est le nouvel
  void handle(GestureState state, MapPointerEvent event) {
    switch (event) {
      case MapPointerDown(:final latLng):
        final element = hitTester.hitTest(latLng);
        _pressPoint = camera.latLngToPoint(latLng);
        setPanBlocked = (element != null ? element.isDraggable : false);
        gesturesResolver.onPointerDown(element, latLng);
        gestureState = Pressed(element);

      case MapPointerMove(:final latLng):
        final position = camera.latLngToPoint(latLng);
        switch (state) {
          case Pressed(element: null):
            if (_pressPoint != null &&
                distancePx(_pressPoint!, position) < tapSlopPx) {
              return; // encore potentiellement un tap, pas un drag
            }
            gesturesResolver.onDragStart();
            gestureState = Dragging();

          case Pressed(:final element):
            if (element != null && !element.isDraggable) return;
            gesturesResolver.onDragStart(element: element);
            gestureState = Dragging(dragged: element);

          case Dragging(:final dragged) when dragged != null:
            final target = hitTester.hitTest(latLng, exclude: dragged);
            gesturesResolver.onDragUpdate(
              dragged: dragged,
              target: target,
              latLng: latLng,
            );
            gestureState = Dragging(dragged: dragged, target: target);
          case _:
        }
      case MapPointerUp(:final latLng):
        setPanBlocked = false;
        _pressPoint = null;

        switch (state) {
          case Pressed(:final element):
            _handleTap(element, latLng);
          case Dragging(:final dragged, :final target):
            cancelPendingTap();
            gesturesResolver.onDragEnd(
              dragged: dragged,
              target: target,
              latLng: latLng,
            );
          case _:
        }

        gestureState = const EmptyState();
    }
    ;
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
      gesturesResolver.onTapped(element, latLng);
      return;
    }

    final point = camera.latLngToPoint(latLng);

    if (_pendingTap != null && _pendingTap!.compare(element, point)) {
      cancelPendingTap();
      gesturesResolver.onDoubleTapped(element, latLng);
      return;
    }

    _pendingTap?.cancel();
    _pendingTap = PendingTap(
      pendingTapPoint: point,
      pendingTapElement: element,
      onTap: () {
        gesturesResolver.onTapped(element, latLng);
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
