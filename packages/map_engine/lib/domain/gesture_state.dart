import 'package:map_engine/map_engine.dart';

sealed class GestureState {
  const GestureState();
}

class EmptyState extends GestureState {
  const EmptyState();
}

class Pressed extends GestureState {
  const Pressed({required this.element, required this.pressPoint});

  final MapObject? element;
  final WorldOffset pressPoint;
}

class Dragging extends GestureState {
  const Dragging({this.dragged, this.target});

  final MapObject? dragged;
  final MapObject? target;
}
