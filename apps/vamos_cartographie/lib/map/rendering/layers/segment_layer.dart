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
  final ValueNotifier<LayerHitResult<SegmentId>?> hitNotifier;
  const SegmentLayer({
    super.key,
    required this.tripId,
    required this.hitNotifier,
  });

  @override
  ConsumerState<SegmentLayer> createState() => _SegmentLayerState();
}

class _SegmentLayerState extends ConsumerState<SegmentLayer> {
  @override
  void initState() {
    super.initState();
    widget.hitNotifier.addListener(_onHoverChanged);
  }

  void _onHoverChanged() {
    ref
        .read(mapStateProvider(widget.tripId).notifier)
        .sendUiEvent(HoverSegments(widget.hitNotifier.value?.hitValues));
  }

  @override
  void dispose() {
    widget.hitNotifier.removeListener(_onHoverChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final segmentIds = ref.watch(segmentStoreProvider(widget.tripId)).getIds();
    final notifier = ref.read(mapStateProvider(widget.tripId).notifier);

    final List<Polyline<SegmentId>> polylines = [];
    final List<Marker> segMarkers = [];
    for (SegmentId id in segmentIds) {
      final segment = ref.watch(segmentProvider(widget.tripId, id));
      if (segment == null) continue;

      final isSelected = ref.watch(
        isSegmentSelectedProvider(widget.tripId, segment.id),
      );

      final baseColor = Color(segment.mobilityTypeDisplay.colorValue);

      // 1. Si le segment est sélectionné, on ajoute D'ABORD le halo en arrière-plan
      if (isSelected) {
        polylines.add(
          Polyline(
            points: segment.geometry,
            // Option A : Halo dans la même couleur mais transparent et très large
            color: baseColor.withValues(alpha: 0.35),
            // Option B (alternative) : Un halo bleu néon/jaune fixe
            // color: Colors.blueAccent.withValues(alpha: 0.4),
            strokeWidth: 12, // Nettement plus large que la ligne principale
          ),
        );
      }

      // 2. Polyline principale
      polylines.add(
        Polyline(
          points: segment.geometry,
          color: baseColor,
          strokeWidth: isSelected
              ? 5
              : 3, // Légèrement plus épais quand sélectionné
          hitValue: segment.id,
          pattern: segment.mobilityTypeDisplay.isDashed
              ? StrokePattern.dashed(segments: const [12, 8])
              : const StrokePattern.solid(),
        ),
      );

      // ... (suite pour tes segMarkers)
      segMarkers.add(
        Marker(
          point: calculMobilyMarkerPosition(segment),
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
          hitNotifier: widget.hitNotifier,
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
