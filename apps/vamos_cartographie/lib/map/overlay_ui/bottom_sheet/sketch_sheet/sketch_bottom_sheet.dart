// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/editor/segment_editor.dart';
import 'package:map_application/editor/sketch_editor.dart';
import 'package:trip_application/trip/domain/domain.dart';
import 'package:vamos_cartographie/features/type_selector/type_selector.dart';
import 'package:vamos_cartographie/map/injection/map_state_provider.dart';
import 'package:vamos_cartographie/map/overlay_ui/bottom_sheet/simple_bottom_sheet_shell.dart';
import 'package:vamos_cartographie/topology/presentation/mobility_type_display.dart';

class SketchBottomSheet extends ConsumerWidget {
  final TripId tripId;

  const SketchBottomSheet({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(mapStateProvider(tripId).notifier);

    // On écoute aussi l'état courant pour mettre à jour la sélection visuelle !
    // (À adapter selon ton provider exact, ex: final currentType = ref.watch(...))

    return SimpleBottomSheetShell(
      content: Column(
        key: const ValueKey('compact_content'),
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              // Expanded indispensable pour limiter le scroll horizontal du TypeSelector
              Expanded(
                child: TypeSelector(
                  values: MobilityTypeStyle.values,
                  selectedType:
                      MobilityTypeStyle.bike, // idéalement issu d'un ref.watch
                  onTypeChanged: (newType) {
                    notifier.changeSegmentType(newType.type);
                  },
                ),
              ),
              const SizedBox(width: 12),
              IconButton.filled(
                onPressed: () => notifier.deactivateSketchMode(),
                icon: const Icon(Icons.close, size: 20),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.red.shade50,
                  foregroundColor: Colors.red.shade700,
                ),
                tooltip: "Cancel",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
