// Emplacement : lib/features/waypoint/widgets/vertex_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/topology/domain/domain.dart';
import 'package:trip_application/trip/domain/domain.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/modes/trip_mode/widgets/widgets.dart';
import 'package:vamos_cartographie/map/ui/shared/sheets/simple_bottom_sheet_shell.dart';
import 'package:vamos_cartographie/ui_kit/buttons/confirm_button.dart';
import 'package:vamos_cartographie/ui_kit/buttons/delete_button.dart';

@Dependencies([modeMachine])
class VertexBottomSheetContent extends ConsumerWidget {
  final TripId tripId;
  final WaypointId vertexId;
  final Widget? child;

  const VertexBottomSheetContent({
    super.key,
    required this.tripId,
    required this.vertexId,
    this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editor = ref.read(modeMachineProvider);

    return SimpleBottomSheetShell(
      content: Column(
        key: const ValueKey('compact_content'),
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ligne d'actions
          Row(
            children: [
              // 1. Action de dessin de segment depuis ce waypoint
              DrawSegmentButton(vertexId: vertexId, tripId: tripId),

              const SizedBox(width: 8),

              // 2. Bouton principal d'action : Créer une étape
              Expanded(
                child: ConfirmButton(
                  label: "Créer une étape ici",
                  onPressed: () => editor.apply(
                    Transition.withSelection<AppMode, MapWaypoint>(
                      (s) => s.createWaypoint(),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // 3. Supprimer le waypoint
              DeleteButton(
                onPressed: () => editor.apply(
                  Transition.withSlot<AppMode, Selectable>(
                    selectionSlot,
                    (s) => s.delete(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
