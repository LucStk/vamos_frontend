// Emplacement : lib/features/waypoint/widgets/vertex_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/topology/domain/domain.dart';
import 'package:trip_application/trip/domain/domain.dart';
import 'package:vamos_cartographie/features/buttons/buttons.dart';
import 'package:vamos_cartographie/base_map/overlay_ui/overlay_ui.dart';
import 'package:vamos_cartographie/trip_map/editor/editor.dart';
import 'package:vamos_cartographie/trip_map/editor/overlay_editor/draw_segment.dart';

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
    final notifier = ref.watch(mapEditorControllerProvider(tripId));

    return SimpleBottomSheetShell(
      content: Column(
        key: const ValueKey('compact_content'),
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ligne d'actions
          Row(
            children: [
              // 1. Action de dessin de segment depuis ce vertex
              DrawSegment(vertexId: vertexId, tripId: tripId),

              const SizedBox(width: 8),

              // 2. Bouton principal d'action : Créer une étape
              Expanded(
                child: ConfirmButton(
                  label: "Créer une étape ici",
                  onPressed:
                      () {}, //=> notifier.createWaypointFromSelectedVertex(),
                ),
              ),

              const SizedBox(width: 8),

              // 3. Supprimer le vertex
              DeleteButton(onPressed: () => notifier.deleteSelected()),
            ],
          ),
        ],
      ),
    );
  }
}
