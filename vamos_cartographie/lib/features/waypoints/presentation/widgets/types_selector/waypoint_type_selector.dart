import "package:flutter/material.dart";

import "package:vamos_cartographie/graphql/graphql.dart";

import "waypoint_type_card.dart";
// Pense à importer ton sous-widget s'il est dans un autre fichier
// import 'waypoint_type_card.dart';

class WaypointTypeSelector extends StatelessWidget {
  final GWaypointEnum selectedType;
  final ValueChanged<GWaypointEnum> onTypeChanged;

  const WaypointTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      // 1. On applique le padding ICI plutôt que sur un widget parent
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        // 2. On utilise MainAxisSize.min pour que la Row colle à ses enfants
        mainAxisSize: MainAxisSize.min,
        children: GWaypointEnum.values.map((type) {
          final isSelected = selectedType == type;

          return Padding(
            // Un poil plus d'espace entre les cartes (6px de chaque côté = 12px entre deux cartes)
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: WaypointTypeCard(
              type: type,
              isSelected: isSelected,
              onTap: () => onTypeChanged(type),
            ),
          );
        }).toList(),
      ),
    );
  }
}
