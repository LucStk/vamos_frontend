import 'package:flutter/material.dart';
// Importe tes fichiers générés par Ferry en haut
import 'package:api_client/api_client.dart';
import 'package:latlong2/latlong.dart';

class Waypoint {
  int? id;
  String? title;
  LatLng latLng;
  GWaypointTypeEnum type;
  String? description;
  List<String>? images;

  Waypoint({
    this.id,
    required this.latLng,
    this.title,
    this.type = GWaypointTypeEnum.waypoint,
    this.description = '',
    List<String>? images,
  }) : images = images ?? [];
}

// Utilise les extensions définit dans le schema pour obtenir le label et l'icône correspondant à chaque type de point de passage
extension WaypointTypeExtension on GWaypointTypeEnum {
  String get label => switch (this) {
    GWaypointTypeEnum.start => 'Départ',
    GWaypointTypeEnum.end => 'Arrivée',
    GWaypointTypeEnum.waypoint => 'Point de passage',
    GWaypointTypeEnum.water => 'Point d\'eau',
    GWaypointTypeEnum.food => 'Ravitaillement',
    GWaypointTypeEnum.repair => 'Réparation vélo',
    GWaypointTypeEnum.shelter => 'Abri',
    GWaypointTypeEnum.camping => 'Camping',
    GWaypointTypeEnum.viewpoint => 'Point de vue',
    GWaypointTypeEnum.historic => 'Patrimoine',
    GWaypointTypeEnum.beach => 'Plage / Lac',
    GWaypointTypeEnum.boat => 'Port / Embarcadère',
    GWaypointTypeEnum.warning => 'Danger',
    _ => 'Autre',
  };
  IconData get icon => switch (this) {
    GWaypointTypeEnum.start => Icons.play_arrow,
    GWaypointTypeEnum.end => Icons.flag,
    GWaypointTypeEnum.waypoint => Icons.circle,
    GWaypointTypeEnum.water => Icons.water_drop,
    GWaypointTypeEnum.food => Icons.restaurant,
    GWaypointTypeEnum.repair => Icons.build,
    GWaypointTypeEnum.shelter => Icons.house,
    GWaypointTypeEnum.camping => Icons.terrain,
    GWaypointTypeEnum.viewpoint => Icons.visibility,
    GWaypointTypeEnum.historic => Icons.account_balance,
    GWaypointTypeEnum.beach => Icons.beach_access,
    GWaypointTypeEnum.boat => Icons.directions_boat,
    GWaypointTypeEnum.warning => Icons.warning,
    _ => Icons.help_outline,
  };
  Color get color => switch (this) {
    GWaypointTypeEnum.start => Colors.green,
    GWaypointTypeEnum.end => Colors.red,
    GWaypointTypeEnum.waypoint => Colors.blue,
    GWaypointTypeEnum.water => Colors.lightBlue,
    GWaypointTypeEnum.food => Colors.orange,
    GWaypointTypeEnum.repair => Colors.brown,
    GWaypointTypeEnum.shelter => Colors.purple,
    GWaypointTypeEnum.camping => Colors.teal,
    GWaypointTypeEnum.viewpoint => Colors.indigo,
    GWaypointTypeEnum.historic => Colors.deepOrange,
    GWaypointTypeEnum.beach => Colors.cyan,
    GWaypointTypeEnum.boat => Colors.blue,
    GWaypointTypeEnum.warning => Colors.yellow,
    _ => Colors.grey,
  };
}
