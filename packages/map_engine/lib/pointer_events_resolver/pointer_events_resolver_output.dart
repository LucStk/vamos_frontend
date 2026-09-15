import 'dart:ui';

import 'package:map_engine/map_engine.dart';
import 'package:map_engine/pointer_events_resolver/pending_tap.dart';

class PointerEventsResolverOutput {
  const PointerEventsResolverOutput({
    required this.state,
    required this.panBlocked,
    this.action,
    this.pendingTap,
    this.pressPoint,
  });

  final GestureState state;

  /// Indique à la couche UI si le pan de FlutterMap doit être bloqué.
  final bool panBlocked;

  /// Action reconnue à transmettre au GesturesResolver.
  final PointerGestureAction? action;

  /// Nouvel état de reconnaissance du double-tap.
  final PendingTap? pendingTap;

  /// Point de départ du geste courant.
  final Offset? pressPoint;
}

sealed class PointerGestureAction {
  const PointerGestureAction();
}

class PointerDownAction extends PointerGestureAction {
  const PointerDownAction({required this.element, required this.offset});

  final MapObject? element;
  final Offset offset;
}

class TapAction extends PointerGestureAction {
  const TapAction({required this.element, required this.offset});

  final MapObject? element;
  final Offset offset;
}

class DoubleTapAction extends PointerGestureAction {
  const DoubleTapAction({required this.element, required this.offset});

  final MapObject? element;
  final Offset offset;
}

class DragStartAction extends PointerGestureAction {
  const DragStartAction({this.element});

  final MapObject? element;
}

class DragUpdateAction extends PointerGestureAction {
  const DragUpdateAction({
    required this.dragged,
    required this.target,
    required this.offset,
  });

  final MapObject dragged;
  final MapObject? target;
  final Offset offset;
}

class DragEndAction extends PointerGestureAction {
  const DragEndAction({
    required this.dragged,
    required this.target,
    required this.offset,
  });

  final MapObject? dragged;
  final MapObject? target;
  final Offset offset;
}
