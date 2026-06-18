import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/application/providers/display_segment_providers.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/elements/segment/segment_type_marker.dart';

class SegmentMarkersLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const SegmentMarkersLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
