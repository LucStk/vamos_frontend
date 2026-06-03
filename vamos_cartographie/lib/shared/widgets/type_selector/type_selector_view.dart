import "package:flutter/material.dart";

import "package:vamos_cartographie/shared/domain/types/map_item_type.dart";
import "type_card.dart";
// Pense à importer ton sous-widget s'il est dans un autre fichier
// import 'waypoint_type_card.dart';

class TypeSelector<T extends MapItemType> extends StatelessWidget {
  final List<T> values;
  final T selectedType;
  final ValueChanged<T> onTypeChanged;

  const TypeSelector({
    super.key,
    required this.values,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: values.map((type) {
          final isSelected = selectedType == type;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: TypeCard(
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
