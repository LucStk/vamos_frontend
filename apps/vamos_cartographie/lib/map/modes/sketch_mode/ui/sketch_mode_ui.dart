import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/overlay_menu.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/ui/pencil_menu_widget.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/sketch_mobility_type_provider.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/ui/sketch_bottom_sheet.dart';

@Dependencies([modeSelection, ModeMachine])
class SketchModeUi extends ConsumerWidget {
  const SketchModeUi(this.mode, {super.key});

  final SketchEdition mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobilityType = ref.watch(sketchMobilityTypeProvider);

    return Stack(
      fit: StackFit.expand,
      children: [
        OverlayMenu<MapSketchPencil>(
          builder: (_, hit) => PencilMenuWidget(
            endSketch: () => ref.applyTransition(mode.validate(mobilityType)),
          ),
        ),
        SketchBottomSheet(
          // Retour : quitte le mode sans valider (ancien « Cancel creation »).
          onBack: () => ref
              .read(appModeMachineProvider.notifier)
              .apply(TripMode.open(mode.tripId)),
          onValidate: () => ref.applyTransition(
            mode.validate(ref.read(sketchMobilityTypeProvider)),
          ),
          mobilityType: mobilityType,
          onMobilityTypeChanged: (type) =>
              ref.read(sketchMobilityTypeProvider.notifier).select(type),

          // TODO: à brancher sur ton API. Un callback null = bouton désactivé.
          //   onRoute: () => ref.applyTransition(mode.route(mobilityType)),
          //   onCancelStroke: () => ref.applyTransition(mode.clearStroke()),
          //   onClearRoute: () => ref.applyTransition(mode.clearRoute()),
          // La confirmation est gérée par SketchBottomSheet.
          onRoute: null,
          onCancelStroke: null,
          onClearRoute: null,
        ),
      ],
    );
  }
}
