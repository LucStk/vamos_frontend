// mobility_type_ui.dart — vamos_cartographie
import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/shared_ui/map_item_style.dart';

extension ExtMobilityTypeStyle on Segment {
  MobilityTypeStyle get mobilityTypeDisplay =>
      MobilityTypeStyle.from(mobilityType);
}

enum MobilityTypeStyle implements MapItemStyle {
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

  const MobilityTypeStyle({
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

  static MobilityTypeStyle from(MobilityType type) =>
      values.firstWhere((e) => e.type == type);
}
