import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import '/map/map.dart';

import "/map/rendering/adapters/adapters.dart";

class SegmentLayer extends ConsumerStatefulWidget {
  final Id<Trip> tripId;
  const SegmentLayer({super.key, required this.tripId});

  @override
  ConsumerState<SegmentLayer> createState() => _SegmentLayerState();
}

class _SegmentLayerState extends ConsumerState<SegmentLayer> {
  late final ValueNotifier<LayerHitResult<SegmentRef>?> _polylineHitNotifier;

  @override
  void initState() {
    super.initState();
    _polylineHitNotifier = ValueNotifier<LayerHitResult<SegmentRef>?>(null);

    _polylineHitNotifier.addListener(_onHoverChanged);
  }

  void _onHoverChanged() {
    // ref est accessible partout dans le State d'un ConsumerStatefulWidget
    ref
        .read(mapStateProvider(widget.tripId).notifier)
        .sendUiEvent(HoverSegments(_polylineHitNotifier.value?.hitValues));
  }

  @override
  void dispose() {
    _polylineHitNotifier.removeListener(_onHoverChanged);
    _polylineHitNotifier.dispose(); // Nettoyage propre
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final segments = ref.watch(segmentRefsProvider);
    final mapState = ref.read(mapStateProvider(widget.tripId).notifier);

    final polylines =
        segments
                .map((id) => toPolyline(ref, id, widget.tripId, mapState))
                .toList()
            as List<Polyline<SegmentRef>>;
    // On en profite pour construire les markers mobility sur les segments
    final List<Marker> segMarkers = [];
    for (SegmentRef entry in segments) {
      final segment = ref.read(segmentUiProvider(entry));
      if (segment != null) {
        final MobilityMarkerElement m = MobilityMarkerElement(
          widget.tripId,
          segment,
        );
        segMarkers.add(toMarker(m, widget.tripId, mapState));
      }
    }

    return Stack(
      children: [
        PolylineLayer<SegmentRef>(
          hitNotifier: _polylineHitNotifier,
          polylines: polylines,
        ),
        MarkerLayer(markers: segMarkers),
      ],
    );
  }
}
