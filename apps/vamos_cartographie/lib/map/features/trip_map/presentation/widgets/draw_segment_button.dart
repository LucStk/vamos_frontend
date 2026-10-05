import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/map.dart';

@Dependencies([])
class DrawSegmentButton extends ConsumerWidget {
  final VertexId vertexId;
  final TripId tripId;
  const DrawSegmentButton({
    super.key,
    required this.tripId,
    required this.vertexId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapTransitions = ref
        .watch(mapEditorProvider(tripId).notifier)
        .controller;
    return OutlinedButton.icon(
      onPressed: () => mapTransitions.startSketch(),

      icon: const Icon(Icons.draw_outlined, size: 16),
      label: const Text("Draw road"),
    );
  }
}
