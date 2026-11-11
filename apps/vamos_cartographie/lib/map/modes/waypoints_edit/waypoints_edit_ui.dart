import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/route_edit/providers/sketch_mobility_type_provider.dart';
import 'package:vamos_cartographie/map/modes/route_edit/ui/widgets/bottom_sheet/contextual/sheet_sketch.dart';
import 'package:vamos_cartographie/map/modes/route_edit/ui/widgets/bottom_sheet/sketch_bottom_sheet.dart';

@Dependencies([modeSelection, ModeMachine])
class WaypointsEditUi extends ConsumerWidget {
  const WaypointsEditUi(this.mode, {super.key});

  final WaypointsEditMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobilityType = ref.watch(sketchMobilityTypeProvider);
    final sketch = ref.watch(modeSlotProvider(sketchTraceSlot));

    return Stack(
      fit: StackFit.expand,
      children: [
        SketchBottomSheet(
          // Retour : quitte le mode sans valider (ancien « Cancel creation »).
          onBack: () => ref
              .read(appModeMachineProvider.notifier)
              .apply(Transition.to(RouteEditMode(mode.tripId))),

          onRoute: null,
          onCancelStroke: null,
          onClearRoute: null,
          contextualSheet: (sketch != null)
              ? SheetSketch(
                  mobilityType: mobilityType,
                  eraseSketch: () {},
                  goBack: () {},
                  onMobilityTypeChanged: (MobilityType type) => ref
                      .read(sketchMobilityTypeProvider.notifier)
                      .select(type),
                  validateSketch: () {},
                  routingSketch: () {},
                  routingFailed: false,
                  isSketchRouted: false,
                )
              : null,
        ),
      ],
    );
  }
}
