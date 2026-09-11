import 'dart:async';
import 'dart:ui';

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
abstract class PointerEventsResolver {
  final double tapSlopPx = 8;
  GestureState currentState = EmptyState();
  GesturesResolver get gesturesResolver;
  ProjectedScene get scene;

  set setPanBlocked(bool blocked);

  /// Point de pression initial — détail de reconnaissance du drag (slop).
  Offset? _pressPoint;
  PendingTap? _pendingTap;

  /// Point d'entrée unique pour les trois gestes primaires.
  /// [state] est l'état courant ; la valeur retournée est le nouvel
  void handle(MapPointerEvent event) {
    switch (event) {
      case MapPointerDown(:final offset):
        print("pointer down");
        _pressPoint = offset;
        final element = scene.hitTest(_pressPoint!);
        print("element hit ? $element ");
        setPanBlocked = (element != null ? element.isDraggable : false);
        gesturesResolver.onPointerDown(element, offset);
        currentState = Pressed(element);

      case MapPointerMove(:final offset):
        print("pointer move");
        switch (currentState) {
          case Pressed(element: null):
            if (_pressPoint != null &&
                distanceTo(_pressPoint!, offset) < tapSlopPx) {
              return; // encore potentiellement un tap, pas un drag
            }
            gesturesResolver.onDragStart();
            currentState = Dragging();

          case Pressed(:final element):
            if (element != null && !element.isDraggable) return;
            gesturesResolver.onDragStart(element: element);
            currentState = Dragging(dragged: element);

          case Dragging(:final dragged) when dragged != null:
            final target = scene.hitTest(offset, exclude: dragged);
            gesturesResolver.onDragUpdate(
              dragged: dragged,
              target: target,
              offset: offset,
            );
            currentState = Dragging(dragged: dragged, target: target);
          case _:
        }
      case MapPointerUp(:final offset):
        setPanBlocked = false;
        _pressPoint = null;
        print("pointer up $currentState");

        switch (currentState) {
          case Pressed(:final element):
            _handleTap(element, offset);
          case Dragging(:final dragged, :final target):
            cancelPendingTap();
            gesturesResolver.onDragEnd(
              dragged: dragged,
              target: target,
              offset: offset,
            );
          case _:
        }
        currentState = const EmptyState();
    }
    ;
  }

  // ---------------------------------------------------------------------
  // Détection tap simple / double tap
  // ---------------------------------------------------------------------

  void _handleTap(MapObject? element, Offset offset) {
    if (element != null && !element.awaitsDoubleTap) {
      // Élément exempté du double tap : on annule tout tap en attente
      // sur un autre élément (pour ne pas laisser un double tap fantôme
      // se déclencher plus tard sur cet ancien élément) et on déclenche
      // immédiatement, sans latence.
      cancelPendingTap();
      gesturesResolver.onTapped(element, offset);
      return;
    }

    if (_pendingTap != null && _pendingTap!.compare(element, offset)) {
      cancelPendingTap();
      gesturesResolver.onDoubleTapped(element, offset);
      return;
    }

    _pendingTap?.cancel();
    _pendingTap = PendingTap(
      pendingTapPoint: offset,
      pendingTapElement: element,
      onTap: () {
        gesturesResolver.onTapped(element, offset);
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
