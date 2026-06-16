import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/application/providers/display_segment_providers.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/graph/domain/entities/display_segment.dart';

Polyline? segmentPolylineBuilder(
  WidgetRef ref,
  Id<Trip> tripId,
  Id<Segment> segmentId,
) {
  final DisplaySegment display = ref.watch(
    displaySegmentProvider(tripId, segmentId),
  );

  return Polyline(
    points: display.geometry,
    color: display.segment.type.color,
    strokeWidth: 5,
    pattern: display.segment.type.isDashed
        ? StrokePattern.dashed(segments: const [12, 8])
        : const StrokePattern.solid(),
  );
}
