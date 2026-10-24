import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';

@Dependencies([modeMachine])
class DrawSegmentButton extends ConsumerWidget {
  final WaypointId vertexId;
  final TripId tripId;
  const DrawSegmentButton({
    super.key,
    required this.tripId,
    required this.vertexId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editor = ref.read(modeMachineProvider);
    return OutlinedButton.icon(
      onPressed: () => editor.apply(
        Transition.withSlot(selectionSlot, (s) {
          if (s is! MapWaypoint) return null;
          final v = ref.read(waypointProvider(tripId, s.id));
          return s.startSketch(v.position);
        }),
      ),
      icon: const Icon(Icons.draw_outlined, size: 16),
      label: const Text("Draw road"),
    );
  }
}
