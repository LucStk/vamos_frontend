// hit_candidate.dart
import 'dart:math';

import 'package:map_application/domain/domain.dart';
part "polyline_candidate.dart";

sealed class HitCandidate {
  const HitCandidate();
  MapElement get element;
  double distanceTo(Point<double> position);
}

class PointCandidate extends HitCandidate {
  final Point<double> point;
  final double radiusPx;
  @override
  final MapElement element;

  const PointCandidate({
    required this.point,
    required this.radiusPx,
    required this.element,
  });

  @override
  double distanceTo(Point<double> position) => position.distanceTo(point);
}
