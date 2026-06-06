import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/features/topology/application/providers/segments_notifier.dart';
import "package:vamos_cartographie/features/topology/topology.dart";

Polyline? buildLine(
  WidgetRef ref,
  BuildContext context,
  int tripId,
  int segmentId,
) {
  final points = ref.watch(segmentPolylinePointsProvider(tripId, segmentId));
  final type = ref.watch(segmentProvider(tripId, segmentId));
  if (type == null || points == null || points.length < 2) {
    return null;
  }

  return Polyline(
    points: points,
    color: type.color,
    strokeWidth: 5,
    pattern: type.isDashed
        ? StrokePattern.dashed(segments: const [12, 8])
        : const StrokePattern.solid(),
  );
}
