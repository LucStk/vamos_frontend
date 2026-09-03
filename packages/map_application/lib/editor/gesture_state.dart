import 'package:map_application/domain/map_elements.dart';

sealed class GestureState {
  const GestureState();
}

class EmptyState extends GestureState {
  const EmptyState();
}

class Pressed extends GestureState {
  final MapElement element;
  const Pressed(this.element);
}

class Dragging extends GestureState {
  final MapElement dragged;
  final MapElement? target;
  const Dragging({required this.dragged, this.target});
}
