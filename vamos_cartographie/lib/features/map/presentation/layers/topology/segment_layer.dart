import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/presentation/helpers/segment_polyline.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/abstract_layer.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';

class SegmentLayer extends AbstractLayer {
  const SegmentLayer({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ids = ref.watch(
      collectionProvider<Segment>(tripId).select((m) => m.keys.toList()),
    );
    final segments = ref.watch(collectionProvider<Segment>(tripId));
    if (segments.isEmpty) {
      return const SizedBox.shrink();
    }
    final polylines = [
      for (final id in ids) ref.watch(segmentPolylineProvider(tripId, id)),
    ].whereType<Polyline>().toList();
    return PolylineLayer(polylines: polylines);
  }
}
