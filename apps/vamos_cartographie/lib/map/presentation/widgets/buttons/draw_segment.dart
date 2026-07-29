import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/events/events.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/map.dart';

class DrawSegment extends ConsumerWidget {
  final VertexId vertexId;
  final TripId tripId;
  const DrawSegment({super.key, required this.tripId, required this.vertexId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapStateNotifier = ref.watch(mapStateProvider(tripId).notifier);
    return OutlinedButton.icon(
      onPressed: () => mapStateNotifier.sendUiEvent(SketchModeActivate()),

      icon: const Icon(Icons.draw_outlined, size: 16),
      label: const Text("Draw road"),
    );
  }
}
