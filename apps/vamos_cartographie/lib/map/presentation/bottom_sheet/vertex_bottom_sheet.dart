// Emplacement : lib/features/waypoint/widgets/vertex_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/topology/domain/domain.dart';
import 'package:trip_application/trip/domain/domain.dart';
import 'package:vamos_cartographie/features/buttons/buttons.dart';
import 'package:vamos_cartographie/map/injection/injection.dart';
import 'package:vamos_cartographie/map/presentation/bottom_sheet/simple_bottom_sheet_shell.dart';
import 'package:vamos_cartographie/map/presentation/widgets/buttons/buttons.dart';

class VertexBottomSheet extends ConsumerWidget {
  final TripId tripId;
  final VertexId vertexId;

  const VertexBottomSheet({
    super.key,
    required this.tripId,
    required this.vertexId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(mapStateProvider(tripId).notifier);

    return SimpleBottomSheetShell(
      content: Column(
        key: const ValueKey('compact_content'),
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle visuel pour inciter au glissement

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
                  onPressed: () =>
                      notifier.sendUiEvent(VertexButtonCreateWaypoint()),
                ),
              ),

              const SizedBox(width: 8),

              // 3. Supprimer le vertex
              DeleteButton(
                onPressed: () =>
                    notifier.sendUiEvent(VertexButtonDeleteTapped()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
