import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/layer_abstract.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';

import 'package:vamos_cartographie/features/map/presentation/helpers/factories/factories.dart';

class SegmentMarkersLayer extends AbstractLayer {
  const SegmentMarkersLayer({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segments = ref.watch(collectionProvider<Segment>(tripId));
    if (segments.isEmpty) {
      return const SizedBox.shrink();
    }

    return MarkerLayer(
      markers: [
        for (final segment in segments.values)
          buildSegmentMarker(
            context: context,
            ref: ref,
            tripId: tripId,
            segmentId: segment.id,
          ),
      ],
    );
  }
}
