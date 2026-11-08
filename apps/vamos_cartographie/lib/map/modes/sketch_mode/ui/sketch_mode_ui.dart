import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/overlay_menu.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/ui/pencil_menu_widget.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/sketch_mobility_type_provider.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/ui/widgets/bottom_sheet/contextual/sheet_sketch.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/ui/widgets/bottom_sheet/sketch_bottom_sheet.dart';

@Dependencies([modeSelection, ModeMachine])
class SketchModeUi extends ConsumerWidget {
  const SketchModeUi(this.mode, {super.key});

  final SketchEdition mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobilityType = ref.watch(sketchMobilityTypeProvider);
    final sketch = ref.watch(modeSlotProvider(sketchTraceSlot));

    return Stack(
      fit: StackFit.expand,
      children: [
        // OverlayMenu<MapSketchPencil>(
        //   builder: (_, hit) => PencilMenuWidget(
        //     endSketch: () => ref.applyTransition(mode.validate(mobilityType)),
        //   ),
        // ),
        SketchBottomSheet(
          // Retour : quitte le mode sans valider (ancien « Cancel creation »).
          onBack: () => ref
              .read(appModeMachineProvider.notifier)
              .apply(TripMode.open(mode.tripId)),

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
