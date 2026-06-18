import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/application/providers/display_segment_providers.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_state.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/layer_abstract.dart';
import 'package:vamos_cartographie/features/map/presentation/markers/segment_type_marker.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';

class SegmentMarkersLayer extends AbstractLayer {
  const SegmentMarkersLayer({super.key, required super.tripId});

  @override
  Widget buildWithCtrl(
    BuildContext context,
    WidgetRef ref,
    MapCtrl mapCtrl,
    MapState mapState,
  ) {
    final segments = ref.watch(collectionProvider<Segment>(tripId));
    if (segments.isEmpty) {
      return const SizedBox.shrink();
    }
    final List<Marker> markers = [];
    for (final segment in segments.values) {
      var latLng = ref.watch(segmentMarkerLatLngProvider(tripId, segment.id));
      markers.add(
        Marker(
          point: latLng,
          width: 20,
          height: 20,
          child: MobilityTypeMarker(tripId: tripId, segmentId: segment.id),
        ),
      );
    }

    return MarkerLayer(markers: markers);
  }
}
