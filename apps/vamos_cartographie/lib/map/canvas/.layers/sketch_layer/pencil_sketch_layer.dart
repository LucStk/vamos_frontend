import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/canvas//markers/markers.dart';
import 'package:vamos_cartographie/map/injection/gesture_state_provider.dart';
import '/map/map.dart';

class PencilSketchLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const PencilSketchLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDragging = ref.watch(isDragInProgressProvider(tripId));
    if (isDragging) return const SizedBox.shrink();

    final mode = ref.watch(mapStateProvider(tripId).select((s) => s.mode));

    switch (mode) {
      case SketchMode e:
        final pencilPosition = e.pencilPositionOrNull;
        if (pencilPosition == null) return const SizedBox.shrink();
        return MarkerLayer(
          markers: [Marker(point: pencilPosition, child: const PencilMarker())],
        );
      case _:
        return const SizedBox.shrink();
    }
  }
}
