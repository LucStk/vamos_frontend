import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/features/shared/shared.dart';
import 'package:vamos_cartographie/features/map_ui/presentation/widgets/segment_editor.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/domain.dart';

import 'package:domain_core/domain_core.dart';

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
