import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';

class DrawSegment extends ConsumerWidget {
  final VertexId vertexId;
  final TripId tripId;
  const DrawSegment({super.key, required this.tripId, required this.vertexId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapTransitions = ref.watch(
      tripMapStateTransitionsProvider(tripId).notifier,
    );
    return OutlinedButton.icon(
      onPressed: () => mapTransitions.activateSketchMode(),

      icon: const Icon(Icons.draw_outlined, size: 16),
      label: const Text("Draw road"),
    );
  }
}
