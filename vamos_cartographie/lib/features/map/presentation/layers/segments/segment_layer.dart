import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';
import "segment_line_factory.dart";

class SegmentsLayer extends ConsumerWidget {
  const SegmentsLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripId = ref.watch(currentTripIdProvider);
    final segmentsIds = ref.watch(segmentIdsProvider(tripId));

    if (segmentsIds.isEmpty) {
      debugPrint("SegmentsLayer : Aucun segment à afficher");
      return const SizedBox.shrink();
    }

    final polylines = segmentsIds
        .map((sId) => buildLine(ref, context, tripId, sId))
        .whereType<Polyline>()
        .toList();

    if (polylines.isEmpty) {
      return const SizedBox.shrink();
    }

    return PolylineLayer(polylines: polylines);
  }
  // static List<Widget> buildLayers(Trip trip) {
  //   final layers = <Widget>[];

  //   for (var i = 0; i < trip.segments.length; i++) {
  //     final seg = trip.segments[i];
  //     final points = trip.segmentPoints(i);

  //     // TODO: Implémenter la détection de tap sur les segments
  //     // Options possibles :
  //     // 1. Utiliser des marqueurs invisibles le long du segment
  //     // 2. Calculer la distance du tap par rapport aux lignes dans onTap
  //     // 3. Utiliser un package tiers pour la détection de tap sur polylines

  //     layers.add(
  //       PolylineLayer(
  //         polylines: [
  //           Polyline(
  //             points: points,
  //             color: seg.type.color,
  //             strokeWidth: 5,
  //             pattern: seg.type.isDashed
  //                 ? StrokePattern.dashed(segments: const [12, 8])
  //                 : const StrokePattern.solid(),
  //           ),
  //         ],
  //       ),
  //     );
  //   }

  //   return layers;
  // }
}
