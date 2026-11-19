import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/waypoint/widgets/create_waypoint_actions.dart';
import 'package:vamos_cartographie/map/ui/chrome/edit_bottom_sheet.dart';

@Dependencies([modeSelection, ModeMachine])
class CreateWaypointUi extends ConsumerWidget {
  const CreateWaypointUi(this.mode, {super.key});

  final CreateWaypointMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pending = ref.watch(modeSlotProvider(pendingWaypointSlot));

    return EditBottomSheet(
      // Retour : quitte le mode sans valider (ancien « Cancel creation »).
      onBack: () => ref
          .read(appModeMachineProvider.notifier)
          .apply(TripMode.open(mode.tripId)),

      onClearRoute: null,
      contextualSheet: (pending != null)
          ? CreateWaypointActions(
              validatePosition: () =>
                  ref.applyTransition(mode.validatePosition()),
            )
          : null,
    );
  }
}
