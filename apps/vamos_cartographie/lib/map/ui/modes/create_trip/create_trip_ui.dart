import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/modes/create_trip/origin_menu_widget.dart';
import 'package:vamos_cartographie/map/ui/shared/buttons/cancel_bottom_button.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/overlay_menu.dart';

class CreateTripUi extends ConsumerWidget {
  const CreateTripUi(this.mode, {super.key});

  final CreateTripMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    @Dependencies([modeSelection, ModeMachine])
    void validate(TripOriginMenu t) {
      final modeMachine = ref.read(modeMachineProvider);
      modeMachine.apply(t.createTripWtOrigin());
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        CancelBottomButton(
          tooltipText: "Cancel creation",
          onPressed: () => switch (mode) {
            CreateTripMode _ =>
              ref.watch(modeMachineProvider).apply(ExploreMode.switchTo()),
          },
        ),
        OverlayMenu<TripOriginMenu>(
          builder: (_, t, _) => OriginMenuWidget(validate: () => validate(t)),
        ),
      ],
    );
  }
}
