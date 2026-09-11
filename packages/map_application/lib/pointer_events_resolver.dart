import 'dart:async';
import 'dart:ui';

import 'package:map_application/gestures_resolver/gestures_resolver.dart';
import 'package:map_application/map_application.dart';

double distanceTo(Offset p1, Offset p2) => (p1 - p2).distance;

class PendingTap {
  PendingTap({
    required this.pendingTapElement,
    required this.pendingTapPoint,
    required void Function() onTap,
    this.doubleTapMaxDistancePx = 24,
    this.doubleTapTimeout = const Duration(milliseconds: 300),
  }) : pendingTapTimer = Timer(doubleTapTimeout, onTap);

  /// Élément détecté lors du premier tap.
  final MapObject? pendingTapElement;

  /// Position du premier tap.
  final Offset pendingTapPoint;

  final Duration doubleTapTimeout;
  final double doubleTapMaxDistancePx;

  final Timer pendingTapTimer;

  void cancel() {
    pendingTapTimer.cancel();
  }

  bool compare(MapObject? element, Offset point) {
    if (distanceTo(pendingTapPoint, point) > doubleTapMaxDistancePx) {
      return false;
    }

    // Deux taps dans le vide = même cible.
    if (pendingTapElement == null && element == null) {
      return true;
    }

    // Un seul des deux taps est sur un élément.
    if (pendingTapElement == null || element == null) {
      return false;
    }

    return pendingTapElement!.isSameAs(element);
  }
}

/// Orchestre le cycle de vie d'un geste pointeur (down → move → up),
/// décide tap/double-tap/drag, et dispatche vers MapContext.
///
/// Pure côté état applicatif : ne possède aucun GestureState — le
/// reçoit en entrée de [handle] et retourne le nouvel état, à charge
/// de l'appelant de le conserver.
///
/// Conserve en interne uniquement des détails de reconnaissance de geste
/// (slop, timer de double tap) qui n'ont pas vocation à être exposés.
///
/// Ne connaît MapHitTester et MapContext que comme dépendances injectées.
abstract class PointerEventsResolver {
  final double tapSlopPx = 8;

  GestureState currentState = EmptyState();

  GesturesResolver get gesturesResolver;
  ProjectedScene get scene;

  set setPanBlocked(bool blocked);

  Offset? _pressPoint;
  PendingTap? _pendingTap;

  void handle(MapPointerEvent event) {
    switch (event) {
      case MapPointerDown(:final offset):
        _pressPoint = offset;

        final element = scene.hitTest(offset);

        setPanBlocked = element?.isDraggable ?? false;

        gesturesResolver.onPointerDown(element, offset);
        currentState = Pressed(element);

      case MapPointerMove(:final offset):
        switch (currentState) {
          case Pressed(element: null):
            if (_pressPoint != null &&
                distanceTo(_pressPoint!, offset) < tapSlopPx) {
              return;
            }

            gesturesResolver.onDragStart();
            currentState = const Dragging();

          case Pressed(:final element):
            if (element != null && !element.isDraggable) {
              return;
            }

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
  }

  void _handleTap(MapObject? element, Offset offset) {
    // Les éléments qui n'attendent pas de double-tap sont immédiats.
    if (element != null && !element.awaitsDoubleTap) {
      cancelPendingTap();
      gesturesResolver.onTapped(element, offset);
      return;
    }

    final pendingTap = _pendingTap;

    // Deuxième tap compatible avec le premier.
    if (pendingTap != null && pendingTap.compare(element, offset)) {
      cancelPendingTap();
      gesturesResolver.onDoubleTapped(element, offset);
      return;
    }

    // Nouveau premier tap.
    cancelPendingTap();

    late final PendingTap newPendingTap;

    newPendingTap = PendingTap(
      pendingTapPoint: offset,
      pendingTapElement: element,
      onTap: () {
        // Évite qu'un ancien timer puisse invalider un nouveau tap.
        if (!identical(_pendingTap, newPendingTap)) {
          return;
        }

        _pendingTap = null;
        gesturesResolver.onTapped(element, offset);
      },
    );

    _pendingTap = newPendingTap;
  }

  void cancelPendingTap() {
    _pendingTap?.cancel();
    _pendingTap = null;
  }

  void dispose() {
    cancelPendingTap();
  }
}
