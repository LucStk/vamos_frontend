import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/chrome/edit_bottom_sheet.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/ui/widgets/buttons/edit_bottom_button.dart';

@Dependencies([modeSelection, ModeMachine])
class WaypointsEditUi extends ConsumerWidget {
  const WaypointsEditUi(this.mode, {super.key});

  final WaypointsEditMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EditBottomSheet(
      // Retour : quitte le mode sans valider (ancien « Cancel creation »).
      onBack: () => ref
          .read(appModeMachineProvider.notifier)
          .apply(TripMode.open(mode.tripId)),

      onClearRoute: null,
      contextualSheet: EditBottomButton(
        icon: Icons.add_location_alt,
        tooltipText: "Add Waypoint",
        onPressed: () => ref
            .read(appModeMachineProvider.notifier)
            .apply(Transition.to(CreateWaypointMode(mode.tripId))),
      ),
    );
  }
}
