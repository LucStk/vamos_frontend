import 'dart:math';

import 'package:map_application/hit_engine/hit_model.dart';

sealed class MapHitState {
  const MapHitState();
}

class EmptyState extends MapHitState {
  const EmptyState();
}

class Pressed extends MapHitState {
  final MapHit hit;
  final Point<double> downPoint;
  const Pressed(this.hit, this.downPoint);
}

class Dragging extends MapHitState {
  final MapHit draggedHit;
  final MapHit? hit;
  const Dragging({required this.draggedHit, this.hit});
}
