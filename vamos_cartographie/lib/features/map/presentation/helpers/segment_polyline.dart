import 'package:flutter_map/flutter_map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
part "segment_polyline.g.dart";

@riverpod
Polyline? segmentPolyline(Ref ref, Id<Trip> tripId, Id<Segment> segmentId) {
  final segment = ref.watch(nodeProvider<Segment>(tripId, segmentId));

  if (segment == null) {
    return null;
  }

  return Polyline(
    points: segment.geometry,
    color: segment.type.color,
    strokeWidth: 5,
    pattern: segment.type.isDashed
        ? StrokePattern.dashed(segments: const [12, 8])
        : const StrokePattern.solid(),
  );
}
