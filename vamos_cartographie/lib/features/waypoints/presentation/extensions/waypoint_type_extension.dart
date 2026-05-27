import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:flutter/material.dart';

extension WaypointTypeExtension on GWaypointEnum {
  String get label => switch (this) {
    GWaypointEnum.START => 'Départ',
    GWaypointEnum.END => 'Arrivée',
    GWaypointEnum.WAYPOINT => 'Point de passage',
    GWaypointEnum.WATER => 'Point d\'eau',
    GWaypointEnum.FOOD => 'Ravitaillement',
    GWaypointEnum.REPAIR => 'Réparation vélo',
    GWaypointEnum.SHELTER => 'Abri',
    GWaypointEnum.CAMPING => 'Camping',
    GWaypointEnum.VIEWPOINT => 'Point de vue',
    GWaypointEnum.HISTORIC => 'Patrimoine',
    GWaypointEnum.BEACH => 'Plage / Lac',
    GWaypointEnum.BOAT => 'Port / Embarcadère',
    GWaypointEnum.WARNING => 'Danger',
    _ => 'Autre',
  };
  IconData get icon => switch (this) {
    GWaypointEnum.START => Icons.play_arrow,
    GWaypointEnum.END => Icons.flag,
    GWaypointEnum.WAYPOINT => Icons.circle,
    GWaypointEnum.WATER => Icons.water_drop,
    GWaypointEnum.FOOD => Icons.restaurant,
    GWaypointEnum.REPAIR => Icons.build,
    GWaypointEnum.SHELTER => Icons.house,
    GWaypointEnum.CAMPING => Icons.terrain,
    GWaypointEnum.VIEWPOINT => Icons.visibility,
    GWaypointEnum.HISTORIC => Icons.account_balance,
    GWaypointEnum.BEACH => Icons.beach_access,
    GWaypointEnum.BOAT => Icons.directions_boat,
    GWaypointEnum.WARNING => Icons.warning,
    _ => Icons.help_outline,
  };
  Color get color => switch (this) {
    GWaypointEnum.START => Colors.green,
    GWaypointEnum.END => Colors.red,
    GWaypointEnum.WAYPOINT => Colors.blue,
    GWaypointEnum.WATER => Colors.lightBlue,
    GWaypointEnum.FOOD => Colors.orange,
    GWaypointEnum.REPAIR => Colors.brown,
    GWaypointEnum.SHELTER => Colors.purple,
    GWaypointEnum.CAMPING => Colors.teal,
    GWaypointEnum.VIEWPOINT => Colors.indigo,
    GWaypointEnum.HISTORIC => Colors.deepOrange,
    GWaypointEnum.BEACH => Colors.cyan,
    GWaypointEnum.BOAT => Colors.blue,
    GWaypointEnum.WARNING => Colors.yellow,
    _ => Colors.grey,
  };
}
