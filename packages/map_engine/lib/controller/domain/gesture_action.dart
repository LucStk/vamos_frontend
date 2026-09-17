import 'package:map_engine/visual/visual.dart';

sealed class PointerGestureAction {
  const PointerGestureAction();
}

class PointerDownAction extends PointerGestureAction {
  const PointerDownAction({required this.element, required this.offset});

  final MapObject? element;
  final WorldOffset offset;
}

class TapAction extends PointerGestureAction {
  const TapAction({required this.element, required this.offset});

  final MapObject? element;
  final WorldOffset offset;
}

class DoubleTapAction extends PointerGestureAction {
  const DoubleTapAction({required this.element, required this.offset});

  final MapObject? element;
  final WorldOffset offset;
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
  final WorldOffset offset;
}

class DragEndAction extends PointerGestureAction {
  const DragEndAction({
    required this.dragged,
    required this.target,
    required this.offset,
  });

  final MapObject? dragged;
  final MapObject? target;
  final WorldOffset offset;
}
