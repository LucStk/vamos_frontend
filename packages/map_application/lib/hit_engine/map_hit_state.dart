import 'dart:math';

import 'package:map_application/domain/map_elements.dart';

sealed class MapElementState {
  const MapElementState();
}

class EmptyState extends MapElementState {
  const EmptyState();
}

class Pressed extends MapElementState {
  final MapElement element;
  final Point<double> downPoint;
  const Pressed(this.element, this.downPoint);
}

class Dragging extends MapElementState {
  final MapElement element;
  const Dragging({required this.element});
}
