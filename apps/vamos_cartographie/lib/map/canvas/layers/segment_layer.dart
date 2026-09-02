import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/canvas/layers/widgets/markers/mobility_marker.dart';
import 'package:vamos_cartographie/map/injection/map_hit_notifier.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import 'package:vamos_cartographie/topology/presentation/mobility_type_display.dart';

class SegmentLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const SegmentLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hitNotifier = ref.watch(segmentHitLayerProvider);
    final segmentIds = ref.watch(segmentStoreProvider(tripId)).getIds();

    final List<Polyline<MapElement>> polylines = [];
    final List<Marker> segMarkers = [];
    for (SegmentId id in segmentIds) {
      final segment = ref.watch(segmentProvider(tripId, id));
      if (segment == null) continue;

      final isSelected = ref.watch(
        isSegmentSelectedProvider(tripId, segment.id),
      );

      final baseColor = Color(segment.mobilityTypeDisplay.colorValue);

      // 1. Si le segment est sélectionné, on ajoute D'ABORD le halo en arrière-plan
      if (isSelected) {
        polylines.add(
          Polyline<MapElement>(
            points: segment.geometry,
            color: baseColor.withValues(alpha: 0.35),
            strokeWidth: 12, // Nettement plus large que la ligne principale
          ),
        );
      }

      // 2. Polyline principale
      polylines.add(
        Polyline<MapElement>(
          points: segment.geometry,
          color: baseColor,
          strokeWidth: isSelected
              ? 5
              : 3, // Légèrement plus épais quand sélectionné
          hitValue: MapSegment(segment.id),
          pattern: segment.mobilityTypeDisplay.isDashed
              ? StrokePattern.dashed(segments: const [12, 8])
              : const StrokePattern.solid(),
        ),
      );

      segMarkers.add(
        Marker(
          point: calculMobilyMarkerPosition(segment),
          child: MobilityMarker(tripId: tripId, segId: id),
        ),
      );
    }

    return Stack(
      children: [
        PolylineLayer<MapElement>(
          hitNotifier: hitNotifier,
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
