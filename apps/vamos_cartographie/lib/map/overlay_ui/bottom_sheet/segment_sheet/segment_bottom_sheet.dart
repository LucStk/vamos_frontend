// Emplacement : lib/features/waypoint/widgets/segment_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/editor/segment_editor.dart';
import 'package:trip_application/topology/domain/domain.dart';
import 'package:trip_application/trip/domain/domain.dart';
import 'package:vamos_cartographie/features/buttons/buttons.dart';
import 'package:vamos_cartographie/map/injection/injection.dart';
import 'package:vamos_cartographie/map/overlay_ui/bottom_sheet/simple_bottom_sheet_shell.dart';
import 'package:vamos_cartographie/topology/topology.dart';

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
    final segment = ref.watch(segmentProvider(tripId, segmentId));
    if (segment == null) return const SizedBox.shrink();

    final notifier = ref.watch(mapStateProvider(tripId).notifier);

    // Récupération de la valeur enum courante du segment pour présélectionner le bon TypeSelector
    final currentStyle = segment.mobilityTypeDisplay;

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
                onPressed: () => notifier.activateSegmentEditMode(),
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
              DeleteButton(onPressed: () => notifier.deleteSelectedSegment()),
            ],
          ),
        ],
      ),
    );
  }
}
