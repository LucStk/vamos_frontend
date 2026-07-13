import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:domain_core/domain_core.dart';
import 'package:map_application/application/map_state.dart';
import 'package:trip_application/trip_application.dart';
import '/map/map.dart';
import "adapters/adapters.dart";

class CursorLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const CursorLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapStateNotifier = ref.read(mapStateProvider(tripId).notifier);
    final mapState = ref.watch(mapStateProvider(tripId));
    switch (mapState.selection) {
      case CursorSelection cursorDrawn:
        return DragMarkers(
          markers: [
            toDragMarker(
              CursorElement(tripId, cursorDrawn.latLng),
              tripId,
              mapStateNotifier,
            ),
          ],
        );
      case _:
        return SizedBox.shrink();
    }
  }
}
