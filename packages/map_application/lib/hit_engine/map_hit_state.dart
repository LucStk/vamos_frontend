import 'dart:math';

import 'package:trip_application/trip_application.dart';

part "cursor/cursor_hit_states.dart";

sealed class MapHitState {
  const MapHitState();
}

class EmptyState extends MapHitState {
  const EmptyState();
}

class PointerDown extends MapHitState {
  final Point downPoint;
  PointerDown(this.downPoint);
}

class VertexPressed extends PointerDown {
  final VertexId vertexId;
  VertexPressed(super.downPoint, this.vertexId);
}

class SegmentPressed extends PointerDown {
  SegmentId segmentId;
  SegmentPressed(super.downPoint, this.segmentId);
}

class SketchSegmentPressed extends PointerDown {
  SketchSegmentPressed(super.downPoint);
}
