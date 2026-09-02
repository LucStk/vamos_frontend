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
    final mapState = ref.watch(mapStateProvider(tripId));
    switch (mapState.mode) {
      case SketchMode e:
        final List<Polyline<MapElement>> polylineLayer = [];

        if (e.correction != null) {
          polylineLayer.add(
            Polyline<MapElement>(
              points: e.correction!.path,
              color: Colors.green,
              strokeWidth: 5,
            ),
          );
        }
        if (e is SketchCreation) {
          polylineLayer.add(
            Polyline<MapElement>(
              points: e.itineraire,
              color: Colors.lightBlue,
              strokeWidth: 5,
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
