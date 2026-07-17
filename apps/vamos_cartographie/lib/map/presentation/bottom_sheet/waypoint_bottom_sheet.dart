import 'package:flutter/material.dart'; // Remplacé cupertino par material pour SizedBox et ListView standard
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/presentation/bottom_sheet/draggable_bottom_sheet_shell.dart';
import '/waypoint/waypoint.dart';
import '/map/presentation/bottom_sheet/drag_handle.dart';

class WaypointBottomSheet extends ConsumerWidget {
  final TripId tripId;
  final WaypointId waypointId;

  const WaypointBottomSheet({
    super.key,
    required this.tripId,
    required this.waypointId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoint = ref.watch(waypointProvider(tripId, waypointId));

    return DraggableBottomSheetShell(
      tripId:
          tripId, // 1. Ne pas oublier de passer le tripId requis par le Shell
      builder: ({isAtmin = true, required scrollController}) {
        // 2. Correction de la syntaxe des arguments nommés
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            controller: scrollController,
            // Empêche le rebond du scroll pour ne pas interférer avec le drag de la sheet
            physics: const ClampingScrollPhysics(),
            children: [
              const DragHandle(),
              const SizedBox(height: 8),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child:
                    isAtmin // Attention à la casse "isAtmin" définie dans ton Shell
                    ? WaypointCompactContent(
                        key: const ValueKey(
                          'compact',
                        ), // Crucial pour l'AnimatedSwitcher
                        waypoint: waypoint,
                        tripId: tripId,
                      )
                    : WaypointViewerContent(
                        key: const ValueKey(
                          'expanded',
                        ), // Crucial pour l'AnimatedSwitcher
                        waypoint: waypoint,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
