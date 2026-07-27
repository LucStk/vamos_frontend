// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/topology/domain/domain.dart';
import 'package:trip_application/trip/domain/domain.dart';
import 'package:vamos_cartographie/features/buttons/buttons.dart';
import 'package:vamos_cartographie/map/injection/injection.dart';
import 'package:vamos_cartographie/map/presentation/bottom_sheet/simple_bottom_sheet_shell.dart';
import 'package:vamos_cartographie/topology/topology.dart';

// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
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
    return SimpleBottomSheetShell(
      content: Column(
        key: const ValueKey('compact_content'),
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                // Ajoute le padding ici (ajuste la valeur selon le rendu souhaité)
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Color(
                    segment.mobilityTypeDisplay.colorValue,
                  ).withValues(alpha: 0.7),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.8),
                    width: 1,
                  ),
                ),
                child: Icon(
                  segment.mobilityTypeDisplay.icon,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Spacer(),
              DeleteButton(
                onPressed: () =>
                    notifier.sendUiEvent(SegmentButtonDeleteTapped()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
