import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

import '/domain_features/topology/injection/queries/queries.dart';
import '../../injection/map_editor_mode.dart';

@Dependencies([MapEditor])
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
    final editor = ref.watch(mapEditorProvider(tripId).notifier);
    return OutlinedButton.icon(
      onPressed: () => editor.actOnSelection<VertexSelection>((s) {
        final v = ref.read(vertexProvider(tripId, s.id));
        return s.startSketch(v.latLng);
      }),
      icon: const Icon(Icons.draw_outlined, size: 16),
      label: const Text("Draw road"),
    );
  }
}
