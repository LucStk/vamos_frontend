import 'package:map_application/domain/map_objects.dart';

sealed class GestureState {
  const GestureState();
}

class EmptyState extends GestureState {
  const EmptyState();
}

class Pressed extends GestureState {
  final MapObject? element;
  const Pressed(this.element);
}

class Dragging extends GestureState {
  final MapObject? dragged;
  final MapObject? target;
  const Dragging({this.dragged, this.target});
}
