import 'package:vamos_cartographie/shared/shared.dart';
import "package:flutter/material.dart";

enum WaypointType implements MapItemType {
  start,
  end,
  waypoint,
  water,
  food,
  repair,
  shelter,
  camping,
  viewpoint,
  historic,
  beach,
  boat,
  warning,
  other;

  @override
  String get label => switch (this) {
    WaypointType.start => 'Départ',
    WaypointType.end => 'Arrivée',
    WaypointType.waypoint => 'Point de passage',
    WaypointType.water => 'Point d\'eau',
    WaypointType.food => 'Ravitaillement',
    WaypointType.repair => 'Réparation vélo',
    WaypointType.shelter => 'Abri',
    WaypointType.camping => 'Camping',
    WaypointType.viewpoint => 'Point de vue',
    WaypointType.historic => 'Patrimoine',
    WaypointType.beach => 'Plage / Lac',
    WaypointType.boat => 'Port / Embarcadère',
    WaypointType.warning => 'Danger',
    _ => 'Autre',
  };
  @override
  IconData get icon => switch (this) {
    WaypointType.start => Icons.play_arrow,
    WaypointType.end => Icons.flag,
    WaypointType.waypoint => Icons.circle,
    WaypointType.water => Icons.water_drop,
    WaypointType.food => Icons.restaurant,
    WaypointType.repair => Icons.build,
    WaypointType.shelter => Icons.house,
    WaypointType.camping => Icons.terrain,
    WaypointType.viewpoint => Icons.visibility,
    WaypointType.historic => Icons.account_balance,
    WaypointType.beach => Icons.beach_access,
    WaypointType.boat => Icons.directions_boat,
    WaypointType.warning => Icons.warning,
    _ => Icons.help_outline,
  };
  @override
  Color get color => switch (this) {
    WaypointType.start => Colors.green,
    WaypointType.end => Colors.red,
    WaypointType.waypoint => Colors.blue,
    WaypointType.water => Colors.lightBlue,
    WaypointType.food => Colors.orange,
    WaypointType.repair => Colors.brown,
    WaypointType.shelter => Colors.purple,
    WaypointType.camping => Colors.teal,
    WaypointType.viewpoint => Colors.indigo,
    WaypointType.historic => Colors.deepOrange,
    WaypointType.beach => Colors.cyan,
    WaypointType.boat => Colors.blue,
    WaypointType.warning => Colors.yellow,
    _ => Colors.grey,
  };
}
