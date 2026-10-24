import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/mode/menu_placement.dart';
// import 'package:vamos_cartographie/map/mode/mode_scope.dart';

import 'package:vamos_cartographie/map/ui/shared/menus/object_menu_shell.dart';
import 'package:vamos_cartographie/map/ui/shared/camera/world_positioned.dart';

@Dependencies([modeSelection, ModeMachine])
class TripOriginMenuUi extends ConsumerWidget {
  const TripOriginMenuUi({super.key, required this.validate});

  final void Function(TripOriginMenu t) validate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placement = ref.watch(menuPlacementProvider);
    if (placement == null) {
      return kEmptyPositioned;
    }
    return switch (placement.overlay) {
      TripOriginMenu t => ObjectMenuShell(
        worldOffset: placement.world,
        child: TripOriginMenuWidget(validate: () => validate(t)),
      ),
      _ => kEmptyPositioned,
    };
  }
}
