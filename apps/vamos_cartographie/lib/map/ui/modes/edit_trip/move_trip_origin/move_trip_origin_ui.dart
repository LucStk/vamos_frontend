import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:vamos_cartographie/map/mode/helpers/mode_apply.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/shared/buttons/cancel_bottom_button.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/overlay_menu.dart';

class MoveTripOriginUi extends ConsumerWidget {
  const MoveTripOriginUi(this.mode, {super.key});

  final PlaceOriginMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CancelBottomButton(
          tooltipText: "Cancel creation",
          onPressed: () => ref
              .applyTransition(mode.cancel()),
        ),
        OverlayMenu<TripOriginMenu>(builder: (_, t, p) => ref.applyTransition(mode.validate(t.))),
      ],
    );
  }
}
