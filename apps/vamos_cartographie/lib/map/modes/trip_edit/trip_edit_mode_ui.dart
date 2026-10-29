// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/material.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/trip_edit_menus.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/trip_edit_sheets.dart';

class TripEditModeUi extends StatelessWidget {
  const TripEditModeUi(this.mode, {super.key});

  final TripEditMode mode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [TripEditSheets(mode), TripEditMenus(mode)],
    );
  }
}
