import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/canvas/layers/markers/markers.dart';
import '/map/map.dart';

class PencilSketchLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const PencilSketchLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapStateProvider(tripId));
    // final gestureState = ref.watch(gestureStateProvider(tripId));
    // if (gestureState is Dragging) {
    //   return const SizedBox.shrink();
    // }
    switch (mapState.mode) {
      case SketchMode e:
        final pencilPosition = e.pencilPositionOrNull;
        if (pencilPosition == null) {
          return SizedBox.shrink();
        }
        return MarkerLayer(
          markers: [Marker(point: pencilPosition, child: PencilMarker())],
        );

      case _:
        return SizedBox.shrink();
    }
  }
}
