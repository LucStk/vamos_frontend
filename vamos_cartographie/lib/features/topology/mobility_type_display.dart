// mobility_type_ui.dart — vamos_cartographie
import 'package:flutter/material.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/features/shared/domain/types/map_item_type.dart';

extension ExtMobilityTypeDisplay on SegmentUiModel {
  MobilityTypeDisplay get mobilityTypeDisplay =>
      MobilityTypeDisplay.from(mobilityType);
}

enum MobilityTypeDisplay implements MapItemType {
  bike(
    label: 'Vélo',
    icon: Icons.directions_bike,
    colorValue: 0xFF2196F3,
    isDashed: false,
    type: MobilityType.bike,
  ),
  car(
    label: 'Voiture',
    icon: Icons.directions_car,
    colorValue: 0xFF9E9E9E,
    isDashed: false,
    type: MobilityType.car,
  ),
  boat(
    label: 'Bateau',
    icon: Icons.directions_boat,
    colorValue: 0xFF3F51B5,
    isDashed: true,
    type: MobilityType.boat,
  ),
  walk(
    label: 'Marche',
    icon: Icons.directions_walk,
    colorValue: 0xFF4CAF50,
    isDashed: false,
    type: MobilityType.walk,
  ),
  train(
    label: 'Train',
    icon: Icons.train,
    colorValue: 0xFFF44336,
    isDashed: true,
    type: MobilityType.train,
  );

  const MobilityTypeDisplay({
    required this.label,
    required this.icon,
    required this.colorValue,
    required this.isDashed,
    required this.type,
  });

  @override
  final String label;
  @override
  final IconData icon;
  @override
  final int colorValue;
  final bool isDashed;
  final MobilityType type;

  static MobilityTypeDisplay from(MobilityType type) =>
      values.firstWhere((e) => e.type == type);
}
