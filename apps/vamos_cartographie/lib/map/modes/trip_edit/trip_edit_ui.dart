import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/mode_toolbox.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/providers/sketch_mobility_type_provider.dart';
import 'package:vamos_cartographie/map/ui/chrome/back/back_tab.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/toolbox.dart';

@Dependencies([modeSelection, ModeMachine])
class TripEditUi extends ConsumerWidget {
  const TripEditUi(this.mode, {super.key});

  final TripMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobilityType = ref.watch(sketchMobilityTypeProvider);
    final sketch = ref.watch(modeSlotProvider(sketchTraceSlot));

    return ModeToolbox(
      mode: mode,
      tools: [
        ModeTool(
          item: ToolboxItem(
            icon: Icons.add_location_alt,
            label: "ajouter un waypoint",
            selectedIcon: Icons.add_location_alt_outlined,
          ),
          open: ()=> CreateWaypointMode(mode.tripId)
          panel:
        ),
      ],
      leading: BackTab(
        onTap: () => ref.applyTransition(
          Transition.to(TripReadyMode(mode.tripId, readOnly: false)),
        ),
      ),
      closed: () => TripEditMode(mode.tripId),
    );
  }
}
