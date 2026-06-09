import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/abstract_layer.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/topology/vertex_layer.dart';

class TopologyLayer extends AbstractLayer {
  const TopologyLayer({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        // SegmentLayer(tripId: tripId),
        // SegmentTypeMarkerLayer(tripId: tripId),
        VertexLayer(tripId: tripId),
      ],
    );
  }
}
