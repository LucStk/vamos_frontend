import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/presentation.dart';
import 'package:vamos_cartographie/ui_kit/inputs/icon_choice_menu.dart';

/// Type de mobilité : un bouton qui affiche le choix courant et ouvre un menu.
class WaypointTypeMenu extends StatelessWidget {
  const WaypointTypeMenu({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final MobilityType selected;
  final ValueChanged<MobilityType> onChanged;

  @override
  Widget build(BuildContext context) {
    return IconChoiceMenu<MobilityType>(
      selected: selected,
      onChanged: onChanged,
      options: [
        for (final s in MobilityTypeStyle.values)
          IconChoiceOption(
            value: s.type,
            icon: s.icon,
            label: s.label,
            color: s.color,
          ),
      ],
    );
  }
}
