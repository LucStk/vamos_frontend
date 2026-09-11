import 'dart:async';
import 'dart:ui';

import 'package:latlong2/latlong.dart';
import 'package:map_application/gestures_resolver/gestures_resolver.dart';
import 'package:map_application/map_application.dart';

double distanceTo(Offset p1, Offset p2) => (p1 - p2).distance;

class PendingTap {
  /// État interne de détection du double tap.
  final Timer pendingTapTimer;
  final Offset pendingTapPoint;
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

  bool compare(MapObject? element, Offset point) {
    if (element == null || pendingTapElement == null) return false;
    return pendingTapElement!.isSameAs(element) &&
        distanceTo(pendingTapPoint, point) <= doubleTapMaxDistancePx;
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
  MapCameraReader get camera;
  ProjectedScene get scene;

  set setPanBlocked(bool blocked);

  /// Point de pression initial — détail de reconnaissance du drag (slop).
  Offset? _pressPoint;
  PendingTap? _pendingTap;

  /// Point d'entrée unique pour les trois gestes primaires.
  /// [state] est l'état courant ; la valeur retournée est le nouvel
  void handle(GestureState state, MapPointerEvent event) {
    switch (event) {
      case MapPointerDown(:final latLng):
        _pressPoint = camera.latLngToScreenOffset(latLng);
        final element = scene.hitTest(_pressPoint!);
        setPanBlocked = (element != null ? element.isDraggable : false);
        gesturesResolver.onPointerDown(element, latLng);
        gestureState = Pressed(element);

      case MapPointerMove(:final latLng):
        final position = camera.latLngToScreenOffset(latLng);
        switch (state) {
          case Pressed(element: null):
            if (_pressPoint != null &&
                distanceTo(_pressPoint!, position) < tapSlopPx) {
              return; // encore potentiellement un tap, pas un drag
            }
            gesturesResolver.onDragStart();
            gestureState = Dragging();

          case Pressed(:final element):
            if (element != null && !element.isDraggable) return;
            gesturesResolver.onDragStart(element: element);
            gestureState = Dragging(dragged: element);

          case Dragging(:final dragged) when dragged != null:
            final target = scene.hitTest(position, exclude: dragged);
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

    final point = camera.latLngToScreenOffset(latLng);

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
