// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip/domain/domain.dart';
import 'package:vamos_cartographie/map/injection/map_state_provider.dart';
import 'package:vamos_cartographie/map/presentation/bottom_sheet/simple_bottom_sheet_shell.dart';

// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
class SketchBottomSheet extends ConsumerWidget {
  final TripId tripId;

  const SketchBottomSheet({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(mapStateProvider(tripId).notifier);
    return SimpleBottomSheetShell(
      content: Column(
        key: const ValueKey('compact_content'),
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              FilledButton.icon(
                onPressed: () =>
                    notifier.sendUiEvent(SketchCancelButtonTapped()),
                icon: const Icon(Icons.draw_outlined, size: 16),
                label: const Text("Cancel"),
                style: FilledButton.styleFrom(
                  iconColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
