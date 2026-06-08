import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/abstract_layer.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/markers/vertex_marker_view.dart';

class VertexLayer extends AbstractLayer {
  const VertexLayer({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vertices = ref.watch(vertexMapProvider(tripId));

    if (vertices.isEmpty) {
      return const SizedBox.shrink();
    }

    return MarkerLayer(
      markers: [
        for (final vertex in vertices.values)
          Marker(
            point: vertex.latLng,
            width: 20,
            height: 20,
            child: GestureDetector(
              onTap: () {
                // SegmentViewerDialog.show(
                //   context: context,
                //   tripId: tripId,
                //   segmentId: segment.id,
                // );
              },
              child: VertexMarkerView(),
            ),
          ),
      ],
    );
  }
}
