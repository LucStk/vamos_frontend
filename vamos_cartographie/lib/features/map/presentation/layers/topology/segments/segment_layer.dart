import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/abstract_layer.dart';

class SegmentLayer extends AbstractLayer {
  const SegmentLayer({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segments = ref.watch(segmentMapProvider(tripId));
    if (segments.isEmpty) {
      return const SizedBox.shrink();
    }
    return PolylineLayer(
      polylines: [
        for (final segment in segments.values)
          Polyline(
            points: segment.geometry,
            color: segment.type.color,
            strokeWidth: 5,
            pattern: segment.type.isDashed
                ? StrokePattern.dashed(segments: const [12, 8])
                : const StrokePattern.solid(),
          ),
      ],
    );
  }
}
