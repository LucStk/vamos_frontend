import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/waypoint/presentation/waypoint_kind_display.dart';
import 'package:vamos_cartographie/ui_kit/inputs/icon_choice_menu.dart';

/// Catégorie d'un waypoint : un bouton qui affiche le choix courant et ouvre
/// un menu.
///
/// « Aucune » n'est proposée que si le waypoint n'a pas de catégorie : on ne
/// peut pas encore en retirer une (voir `WaypointChanges.between`).
class WaypointKindMenu extends StatelessWidget {
  const WaypointKindMenu({
    super.key,
    required this.selected,
    required this.onChanged,
    this.buttonSize = 40,
  });

  final WaypointKind? selected;
  final ValueChanged<WaypointKind> onChanged;
  final double buttonSize;

  @override
  Widget build(BuildContext context) {
    return IconChoiceMenu<WaypointKind?>(
      selected: selected,
      buttonSize: buttonSize,
      onChanged: (kind) {
        if (kind != null) onChanged(kind);
      },
      options: [
        for (final s in WaypointKindStyle.selectable)
          if (selected == null || s != WaypointKindStyle.none)
            IconChoiceOption(
              value: s.kind,
              icon: s.icon,
              label: s.label,
              color: s.color,
            ),
      ],
    );
  }
}
