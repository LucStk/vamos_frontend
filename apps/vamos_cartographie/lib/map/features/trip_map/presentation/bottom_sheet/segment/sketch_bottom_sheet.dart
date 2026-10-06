// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip/domain/domain.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

import '../../../../../../domain_features/topology/presentation/mobility_type_display.dart';
import '../../../../../../ui_kit/type_selector/type_selector_view.dart';
import '../../../../../overlay_ui/simple_bottom_sheet_shell.dart';
import '../../../injection/map_editor_mode.dart';

@Dependencies([])
class SketchBottomSheet extends ConsumerWidget {
  final TripId tripId;

  const SketchBottomSheet({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editor = ref.read(mapEditorProvider(tripId).notifier);

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
                  onTypeChanged: (newType) => editor.act(
                    (SketchEdition m) =>
                        SketchIntents.changeSegmentType(m, newType.type),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              IconButton.filled(
                onPressed: () => editor.act(SketchIntents.stopSketch),
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
