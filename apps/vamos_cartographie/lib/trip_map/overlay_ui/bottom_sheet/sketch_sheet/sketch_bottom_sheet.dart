// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip/domain/domain.dart';
import 'package:vamos_cartographie/features/type_selector/type_selector.dart';
import 'package:vamos_cartographie/map/map.dart';
import 'package:vamos_cartographie/topology/presentation/mobility_type_display.dart';
import 'package:vamos_cartographie/trip_map/effects/map_effects.dart';
import 'package:vamos_cartographie/trip_map/injection/map_effects.dart';
import 'package:vamos_cartographie/trip_map/injection/map_transitions.dart';
import 'package:vamos_cartographie/trip_map/transitions/sketch_transitions.dart';

class SketchBottomSheet extends ConsumerWidget {
  final TripId tripId;

  const SketchBottomSheet({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapEffects = ref.watch(mapEffectResolverProvider(tripId).notifier);
    final mapTransitions = ref.watch(
      tripMapStateTransitionsProvider(tripId).notifier,
    );

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
                    mapEffects.resolve(
                      (ChangeSegmentSelectedTypeEffect(type: newType.type)),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              IconButton.filled(
                onPressed: () => mapTransitions.deactivateSketchMode(),
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
