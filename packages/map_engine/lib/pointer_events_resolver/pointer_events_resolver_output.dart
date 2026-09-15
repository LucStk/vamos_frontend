import 'dart:ui';

import 'package:map_engine/domain/pointer_gesture_state.dart';
import 'package:map_engine/map_engine.dart';

class PointerEventsResolverOutput {
  const PointerEventsResolverOutput({required this.state, this.action});

  final PointerGestureState state;

  /// Action reconnue à transmettre au GesturesResolver.
  final PointerGestureAction? action;
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
