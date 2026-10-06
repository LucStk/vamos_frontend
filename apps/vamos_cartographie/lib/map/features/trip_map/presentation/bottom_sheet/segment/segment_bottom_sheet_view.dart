// Emplacement : lib/features/waypoint/widgets/segment_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/topology/domain/domain.dart';
import 'package:trip_application/trip/domain/domain.dart';
import '../../../../../overlay_ui/simple_bottom_sheet_shell.dart';
import '../../../injection/map_editor_mode.dart';
import '/ui_kit/ui_kit.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([])
class SegmentBottomSheet extends ConsumerWidget {
  final TripId tripId;
  final SegmentId segmentId;

  const SegmentBottomSheet({
    super.key,
    required this.tripId,
    required this.segmentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editor = ref.read(mapEditorProvider(tripId).notifier);
    return SimpleBottomSheetShell(
      content: Column(
        key: const ValueKey('compact_content'),
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // 1. Sélecteur de modalité défilable dans l'espace disponible
              // Expanded(
              //   child: TypeSelector(
              //     values: MobilityTypeStyle.values,
              //     selectedType: currentStyle,
              //     onTypeChanged: (newType) {
              //       notifier.changeSegmentType(newType.type);
              //     },
              //   ),
              // ),

              // const SizedBox(width: 8),

              // 2. Bouton "Redessiner" le segment
              IconButton.filledTonal(
                onPressed: () =>
                    editor.act(SegmentSelectIntents.startSegmentEdit),
                icon: const Icon(Icons.edit_road_rounded, size: 20),
                tooltip: "Redessiner le segment",
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primaryContainer.withValues(alpha: 0.7),
                  foregroundColor: Theme.of(
                    context,
                  ).colorScheme.onPrimaryContainer,
                ),
              ),

              const SizedBox(width: 4),

              // 3. Bouton "Supprimer" le segment
              DeleteButton(
                onPressed: () => editor.act(SegmentSelectIntents.deleteSegment),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
