import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/modes/create_trip_mode/create_trip_menu_ui.dart';
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
        CancelBottomButton(
          tooltipText: "Cancel creation",
          onPressed: () {
            ref
                .watch(modeMachineProvider)
                .apply(TripActiveMode.switchTo(mode.tripId));
          },
        ),
      ],
    );
  }
}
