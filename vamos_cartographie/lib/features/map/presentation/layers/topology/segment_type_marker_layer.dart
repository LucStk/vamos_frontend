import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/presentation/helpers/gis.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/abstract_layer.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import "package:vamos_cartographie/features/map/presentation/widgets/markers/segment_type_marker_view.dart";

class SegmentTypeMarkerLayer extends AbstractLayer {
  const SegmentTypeMarkerLayer({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segments = ref.watch(collectionProvider<Segment>());
    if (segments.isEmpty) {
      return const SizedBox.shrink();
    }

    return MarkerLayer(
      markers: [
        for (final segment in segments.values)
          Marker(
            point: boundsCenter(segment.geometry),
            width: 20,
            height: 20,
            child: GestureDetector(
              onTap: () {
                SegmentViewerDialog.show(
                  context: context,
                  tripId: tripId,
                  segmentId: segment.id,
                );
              },
              child: SegmentTypeMarkerView(type: segment.type),
            ),
          ),
      ],
    );
  }
}
