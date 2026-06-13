import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/shared/shared.dart';
import 'package:vamos_cartographie/features/topology/orchestrators/segment_orchestrator.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';

import "package:vamos_cartographie/features/graph/graph.dart";
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

class SegmentViewerDialog extends ConsumerWidget {
  final Id<Segment> segmentId;
  final Id<Trip> tripId;

  const SegmentViewerDialog({
    super.key,
    required this.segmentId,
    required this.tripId,
  });

  static void show({
    required BuildContext context,
    required Id<Segment> segmentId,
    required Id<Trip> tripId,
  }) {
    showDialog(
      context: context,
      builder: (_) => SegmentViewerDialog(segmentId: segmentId, tripId: tripId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segment = ref
        .watch(graphStoreProvider(tripId))
        .map<Segment>()[segmentId]
        ?.value;

    if (segment == null) {
      return const SizedBox.shrink();
    }
    return DialogShell(
      content: SegmentEditor(
        initialSegment: segment,
        successMessage: "Segment mis à jour",
        onSubmit: (ref, editedSegment) async {
          await ref
              .read(segmentOrchestratorProvider(tripId).notifier)
              .updateSegment(segmentId, editedSegment);
        },
      ),

      buttonsBuilder: (ctx) => [],
    );
  }
}
