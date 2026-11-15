import 'package:flutter/material.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/trip_ready/ui/widgets/buttons/edit_bottom_actions.dart';
import 'package:vamos_cartographie/map/modes/trip_ready/ui/widgets/buttons/edit_bottom_button.dart';

@Dependencies([modeSelection, ModeMachine])
class TripEditActions extends StatelessWidget {
  const TripEditActions({
    required this.editRoute,
    required this.editWaypoint,
    super.key,
  });

  final VoidCallback editRoute;
  final VoidCallback editWaypoint;
  // static const double _barHeight = 56;

  @override
  Widget build(BuildContext context) {
    return EditBottomActions(
      bottomOffset: 650, // ← ta marge Y par rapport au bas
      spacing: 8, // ← espacement entre les boutons
      direction: Axis.horizontal, // ← ou Axis.horizontal
      children: [
        EditBottomButton(tooltipText: "Edit route", onPressed: editRoute),
        EditBottomButton(
          icon: Icons.add_location_alt,
          tooltipText: "Edit Waypoints",
          onPressed: editWaypoint,
        ),
      ],
    );
  }
}
