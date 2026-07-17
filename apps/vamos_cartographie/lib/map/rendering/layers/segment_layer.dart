import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import 'package:vamos_cartographie/topology/presentation/mobility_type_display.dart';
import '/map/map.dart';

class SegmentLayer extends ConsumerStatefulWidget {
  final Id<Trip> tripId;
  const SegmentLayer({super.key, required this.tripId});

  @override
  ConsumerState<SegmentLayer> createState() => _SegmentLayerState();
}

class _SegmentLayerState extends ConsumerState<SegmentLayer> {
  late final ValueNotifier<LayerHitResult<SegmentId>?> _polylineHitNotifier;

  @override
  void initState() {
    super.initState();
    _polylineHitNotifier = ValueNotifier<LayerHitResult<SegmentId>?>(null);

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
    final segmentIds = ref.watch(segmentStoreProvider(widget.tripId)).getIds();
    final notifier = ref.read(mapStateProvider(widget.tripId).notifier);

    final List<Polyline<SegmentId>> polylines = [];
    final List<Marker> segMarkers = [];

    for (SegmentId id in segmentIds) {
      final segmentNode = ref.watch(segmentNodeProvider(widget.tripId, id));
      polylines.add(
        Polyline(
          points: segmentNode.current.geometry,
          color: Color(segmentNode.current.mobilityTypeDisplay.colorValue),
          strokeWidth: segmentNode.isRecomputing ? 3 : 5,
          hitValue: segmentNode.id,
          pattern: segmentNode.current.mobilityTypeDisplay.isDashed
              ? StrokePattern.dashed(segments: const [12, 8])
              : const StrokePattern.solid(),
        ),
      );
      segMarkers.add(
        Marker(
          point: calculMobilyMarkerPosition(segmentNode.current),
          child: GestureDetector(
            onTap: () => notifier.sendUiEvent(SegmentMobilityMarkerTapped(id)),
            child: MobilityMarker(tripId: widget.tripId, segId: id),
          ),
        ),
      );
    }

    return Stack(
      children: [
        PolylineLayer<SegmentId>(
          hitNotifier: _polylineHitNotifier,
          polylines: polylines,
        ),
        MarkerLayer(markers: segMarkers),
      ],
    );
  }
}

LatLng calculMobilyMarkerPosition(SegmentFields seg) {
  // Compute center of segment geometry
  if (seg.geometry.isEmpty) {
    return const LatLng(0, 0);
  }
  final minLat = seg.geometry
      .map((p) => p.latitude)
      .reduce((a, b) => a < b ? a : b);
  final maxLat = seg.geometry
      .map((p) => p.latitude)
      .reduce((a, b) => a > b ? a : b);
  final minLng = seg.geometry
      .map((p) => p.longitude)
      .reduce((a, b) => a < b ? a : b);
  final maxLng = seg.geometry
      .map((p) => p.longitude)
      .reduce((a, b) => a > b ? a : b);
  return LatLng((minLat + maxLat) / 2, (minLng + maxLng) / 2);
}
