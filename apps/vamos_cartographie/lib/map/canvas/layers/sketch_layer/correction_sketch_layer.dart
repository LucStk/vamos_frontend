import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import '/map/map.dart';

class CorrectionSketchLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const CorrectionSketchLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapStateProvider(tripId));
    switch (mapState.mode) {
      case SketchMode e when e.hasCorrection:
        return PolylineLayer<MapElement>(
          polylines: [
            Polyline<MapElement>(
              points: e.correction!.path,
              color: Colors.lightGreen,
              strokeWidth: 3.8,
            ),
          ],
        );

      case _:
        return SizedBox.shrink();
    }
  }
}
