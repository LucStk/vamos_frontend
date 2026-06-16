import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/presentation/helpers/gis.dart';
import 'package:vamos_cartographie/features/map/presentation/helpers/segment_marker_builder.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/abstract_layer.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/markers/segment_type_marker.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';

class SegmentTypeMarkerLayer extends AbstractLayer {
  const SegmentTypeMarkerLayer({super.key, required super.tripId});

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
