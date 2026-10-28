import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode_machine/helpers/mode_apply.dart';
import 'package:vamos_cartographie/map/mode_machine/map_mode.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/overlay_menu.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/ui/pencil_menu_widget.dart';
import 'package:vamos_cartographie/map/ui/shared/buttons/cancel_bottom_button.dart';

@Dependencies([modeSelection, ModeMachine])
class SketchModeUi extends ConsumerWidget {
  const SketchModeUi(this.mode, {super.key});

  final SketchEdition mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      fit: StackFit.expand,
      children: [
        OverlayMenu<PencilMenu>(
          builder: (_, t, _) => PencilMenuWidget(
            endSketch: () => ref.applyTransition(mode.validate()),
          ),
        ),
        CancelBottomButton(
          tooltipText: "Cancel creation",
          onPressed: () {
            ref.watch(modeMachineProvider).apply(TripMode.open(mode.tripId));
          },
        ),
      ],
    );
  }
}
