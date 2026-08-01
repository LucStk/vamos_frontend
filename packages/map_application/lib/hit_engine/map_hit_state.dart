import 'dart:math';

import 'package:map_application/hit_engine/hit_model.dart';
import 'package:trip_application/trip_application.dart';

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
  final MapHit hit;
  final VertexId?
  snapTargetId; // pertinent seulement si hit est VertexHit, sinon null
  const Dragging(this.hit, {this.snapTargetId});
}
