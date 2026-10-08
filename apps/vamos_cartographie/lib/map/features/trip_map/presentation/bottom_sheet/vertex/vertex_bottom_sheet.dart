// Emplacement : lib/features/waypoint/widgets/vertex_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/topology/domain/domain.dart';
import 'package:trip_application/trip/domain/domain.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import '/map/overlay_ui/simple_bottom_sheet_shell.dart';
import '../../../injection/map_editor_mode.dart';
import '../../widgets/draw_segment_button.dart';
import '/ui_kit/ui_kit.dart';

@Dependencies([MapEditor])
class VertexBottomSheet extends ConsumerWidget {
  final TripId tripId;
  final VertexId vertexId;
  final Widget? child;

  const VertexBottomSheet({
    super.key,
    required this.tripId,
    required this.vertexId,
    this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editor = ref.read(mapEditorProvider(tripId).notifier);

    return SimpleBottomSheetShell(
      content: Column(
        key: const ValueKey('compact_content'),
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ligne d'actions
          Row(
            children: [
              // 1. Action de dessin de segment depuis ce vertex
              DrawSegmentButton(vertexId: vertexId, tripId: tripId),

              const SizedBox(width: 8),

              // 2. Bouton principal d'action : Créer une étape
              Expanded(
                child: ConfirmButton(
                  label: "Créer une étape ici",
                  onPressed: () => editor.actOnSelection<VertexSelection>(
                    (s) => s.createWaypoint(),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // 3. Supprimer le vertex
              DeleteButton(
                onPressed: () =>
                    editor.actOnSelection<VertexSelection>((s) => s.delete()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
