import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/shared/shared.dart';
import 'package:topology_engine/application/command_handlers/segment_handler.dart';
import 'package:topology_engine/infrastructure/providers/topology_providers.dart';
import 'package:topology_engine/presentation/widgets/segment_editor.dart';
import 'package:topology_engine/domain/domain.dart';
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
        .watch(tripGraphProvider(tripId))
        .requireValue
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
              .read(segmentHandlerProvider(tripId).notifier)
              .updateSegment(segmentId: segmentId, draft: editedSegment);
        },
      ),

      buttonsBuilder: (ctx) => [],
    );
  }
}
