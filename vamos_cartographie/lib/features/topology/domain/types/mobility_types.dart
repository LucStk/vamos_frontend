import "package:flutter/material.dart";

import "package:vamos_cartographie/features/shared/shared.dart";

enum MobilityType implements MapItemType {
  bike,
  car,
  boat,
  walk,
  train;

  @override
  String get label => switch (this) {
    MobilityType.bike => 'Vélo',
    MobilityType.car => 'Voiture',
    MobilityType.boat => 'Bateau',
    MobilityType.walk => 'Marche',
    MobilityType.train => 'Train',
    _ => 'Autre',
  };
  @override
  IconData get icon => switch (this) {
    MobilityType.bike => Icons.directions_bike,
    MobilityType.car => Icons.directions_car,
    MobilityType.boat => Icons.directions_boat,
    MobilityType.walk => Icons.directions_walk,
    MobilityType.train => Icons.train,
    _ => Icons.help_outline,
  };
  @override
  Color get color => switch (this) {
    MobilityType.bike => Colors.blue,
    MobilityType.car => Colors.grey,
    MobilityType.boat => Colors.indigo,
    MobilityType.walk => Colors.green,
    MobilityType.train => Colors.red,
    _ => Colors.grey,
  };

  bool get isDashed => switch (this) {
    MobilityType.boat => true,
    MobilityType.train => true,
    _ => false,
  };
}
