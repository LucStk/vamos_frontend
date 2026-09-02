import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import '/map/map.dart';

class PencilSketchLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const PencilSketchLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapStateProvider(tripId));
    switch (mapState.mode) {
      case SketchMode e:
        final pencilPosition = e.pencilPositionOrNull;
        if (pencilPosition == null) {
          return SizedBox.shrink();
        }
        return MarkerLayer(
          markers: [
            Marker(
              point: pencilPosition,
              child: Icon(Icons.draw_sharp, size: 30, color: Colors.black),
            ),
          ],
        );

      case _:
        return SizedBox.shrink();
    }
  }
}
