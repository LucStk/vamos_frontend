// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/material.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/ui/modes/trip_mode/sheet/trip_mode_sheet_ui.dart';
import 'package:vamos_cartographie/map/ui/modes/trip_mode/trip_mode_contextual_menu.dart';

class TripModeUi extends StatelessWidget {
  const TripModeUi(this.mode, {super.key});

  final TripMode mode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [TripModeSheetUi(mode), TripModeContextualMenu(mode)],
    );
  }
}
