import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/modes/shared/origin_menu_widget.dart';
import 'package:vamos_cartographie/map/ui/shared/buttons/cancel_bottom_button.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/overlay_menu.dart';

class MoveTripOriginUi extends ConsumerWidget {
  const MoveTripOriginUi(this.mode, {super.key});

  final MoveTripOriginMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    @Dependencies([modeSelection, ModeMachine])
    void validate(TripOriginMenu t) {
      final modeMachine = ref.read(modeMachineProvider);
      modeMachine.apply(t.updateTripOrigin(mode.tripId));
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        CancelBottomButton(
          tooltipText: "Cancel creation",
          onPressed: () => ref
              .watch(modeMachineProvider)
              .apply(TripActiveMode.switchTo(mode.tripId)),
        ),
        OverlayMenu<TripOriginMenu>(
          builder: (_, t, _) => TripOriginMenu(validate: () => validate(t)),
        ),
      ],
    );
  }
}
