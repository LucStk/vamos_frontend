import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:vamos_cartographie/map/mode/helpers/mode_apply.dart';
import 'package:vamos_cartographie/map/mode/menu_placement.dart';
import 'package:vamos_cartographie/map/ui/modes/place_origin/origin_menu_widget.dart';
import 'package:vamos_cartographie/map/ui/shared/buttons/cancel_bottom_button.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/overlay_menu.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([menuPlacement])
class PlaceOriginUi extends ConsumerWidget {
  const PlaceOriginUi(this.mode, {super.key});

  final PlaceOriginMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CancelBottomButton(
          tooltipText: "Cancel creation",
          onPressed: () => ref.applyTransition(mode.cancel()),
        ),
        OverlayMenu<TripOriginMenu>(
          builder: (_, t, p) => OriginMenuWidget(
            validate: () => ref.applyTransition(mode.validate(p)),
          ),
        ),
        OverlayMenu<SetOriginMenu>(
          builder: (_, t, p) => OriginMenuWidget(
            validate: () => ref.applyTransition(mode.validate(p)),
          ),
        ),
      ],
    );
  }
}
