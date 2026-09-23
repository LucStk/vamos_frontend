// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip/domain/domain.dart';
import 'package:vamos_cartographie/domain_features/topology/presentation/mobility_type_display.dart';
import 'package:vamos_cartographie/map/overlay_ui/overlay_ui.dart';
import 'package:vamos_cartographie/ui_kit/type_selector/type_selector_view.dart';

class SketchBottomSheet extends ConsumerWidget {
  final TripId tripId;

  const SketchBottomSheet({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapEditorControllerProvider(tripId));

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
                    mapController.changeSegmentType(newType.type);
                  },
                ),
              ),
              const SizedBox(width: 12),
              IconButton.filled(
                onPressed: () => mapController.stopSketch(),
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
