import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import '/map/map.dart';

class SegmentSketchLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const SegmentSketchLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(mapStateProvider(tripId).select((m) => m.mode));
    switch (mode) {
      case SketchMode e:
        final List<Polyline<MapElement>> polylineLayer = [];
        if (e is SketchCreation) {
          polylineLayer.add(
            Polyline<MapElement>(
              points: e.itineraire,
              color: e.hasCorrection ? Colors.blueGrey : Colors.lightBlue,
              strokeWidth: e.hasCorrection ? 3 : 3.8,
              hitValue: MapSketchSegment(),
            ),
          );
        }
        return PolylineLayer<MapElement>(polylines: polylineLayer);

      case _:
        return SizedBox.shrink();
    }
  }
}
