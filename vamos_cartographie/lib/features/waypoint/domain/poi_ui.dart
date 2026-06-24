import "package:flutter/material.dart";
import "package:trip_domain/trip_domain.dart";
import "package:vamos_cartographie/features/shared/domain/types/map_item_type.dart";

// poi_category_ui.dart — vamos_cartographie, tout l'UI ici

enum PoiCategoryUi implements MapItemType {
  start(
    label: 'Départ',
    icon: Icons.play_arrow,
    colorValue: 0xFF4CAF50,
    category: PoiCategory.start,
  ),
  end(
    label: 'Arrivée',
    icon: Icons.flag,
    colorValue: 0xFFF44336,
    category: PoiCategory.end,
  ),
  waypoint(
    label: 'Point de passage',
    icon: Icons.circle,
    colorValue: 0xFF2196F3,
    category: PoiCategory.waypoint,
  ),
  water(
    label: 'Point d\'eau',
    icon: Icons.water_drop,
    colorValue: 0xFF03A9F4,
    category: PoiCategory.water,
  ),
  food(
    label: 'Ravitaillement',
    icon: Icons.restaurant,
    colorValue: 0xFFFF9800,
    category: PoiCategory.food,
  ),
  repair(
    label: 'Réparation vélo',
    icon: Icons.build,
    colorValue: 0xFF795548,
    category: PoiCategory.repair,
  ),
  shelter(
    label: 'Abri',
    icon: Icons.house,
    colorValue: 0xFF9C27B0,
    category: PoiCategory.shelter,
  ),
  camping(
    label: 'Camping',
    icon: Icons.terrain,
    colorValue: 0xFF009688,
    category: PoiCategory.camping,
  ),
  viewpoint(
    label: 'Point de vue',
    icon: Icons.visibility,
    colorValue: 0xFF3F51B5,
    category: PoiCategory.viewpoint,
  ),
  historic(
    label: 'Patrimoine',
    icon: Icons.account_balance,
    colorValue: 0xFFFF5722,
    category: PoiCategory.historic,
  ),
  beach(
    label: 'Plage / Lac',
    icon: Icons.beach_access,
    colorValue: 0xFF00BCD4,
    category: PoiCategory.beach,
  ),
  boat(
    label: 'Port / Embarcadère',
    icon: Icons.directions_boat,
    colorValue: 0xFF2196F3,
    category: PoiCategory.boat,
  ),
  warning(
    label: 'Danger',
    icon: Icons.warning,
    colorValue: 0xFFFFEB3B,
    category: PoiCategory.warning,
  ),
  other(
    label: 'Autre',
    icon: Icons.help_outline,
    colorValue: 0xFF9E9E9E,
    category: PoiCategory.other,
  );

  const PoiCategoryUi({
    required this.label,
    required this.icon,
    required this.colorValue,
    required this.category,
  });

  @override
  final String label;
  @override
  final IconData icon;
  @override
  final int colorValue;
  final PoiCategory category;

  // Retrouver le UI depuis le domaine
  static PoiCategoryUi from(PoiCategory category) =>
      values.firstWhere((e) => e.category == category);
}
