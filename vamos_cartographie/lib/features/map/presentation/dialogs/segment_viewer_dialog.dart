import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';
import 'package:vamos_cartographie/features/segments/segments.dart';
import 'package:vamos_cartographie/shared/shared.dart';

class SegmentViewerDialog extends ConsumerWidget {
  final int segmentId;
  final int tripId;

  const SegmentViewerDialog({
    super.key,
    required this.segmentId,
    required this.tripId,
  });

  static void show({
    required BuildContext context,
    required int segmentId,
    required int tripId,
  }) {
    showDialog(
      context: context,
      builder: (_) => SegmentViewerDialog(segmentId: segmentId, tripId: tripId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segment = ref.watch(segmentProvider(tripId, segmentId));

    if (segment == null) {
      return const SizedBox.shrink();
    }
    return DialogShell(
      content: SegmentEditor(
        initialSegment: segment,
        successMessage: "Segment mis à jour",
        onSubmit: (ref, editedSegment) async {
          await ref
              .read(segmentsStoreProvider(tripId).notifier)
              .updateSegmentRemote(segmentId, editedSegment);
        },
      ),

      buttonsBuilder: (ctx) => [],
    );
  }
}
