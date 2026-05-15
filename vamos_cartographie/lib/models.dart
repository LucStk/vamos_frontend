import 'package:flutter/material.dart';
// Importe tes fichiers générés par Ferry en haut
import 'package:api_client/api_client.dart';
import 'package:latlong2/latlong.dart';

import 'package:gql_tristate_value/gql_tristate_value.dart';

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

extension SegmentTypeExtension on GSegmentTypeEnum {
  String get label => switch (this) {
    GSegmentTypeEnum.bike => 'Vélo',
    GSegmentTypeEnum.car => 'Voiture',
    GSegmentTypeEnum.boat => 'Bateau',
    GSegmentTypeEnum.walk => 'Marche',
    GSegmentTypeEnum.train => 'Train',
    _ => 'Autre',
  };
  IconData get icon => switch (this) {
    GSegmentTypeEnum.bike => Icons.directions_bike,
    GSegmentTypeEnum.car => Icons.directions_car,
    GSegmentTypeEnum.boat => Icons.directions_boat,
    GSegmentTypeEnum.walk => Icons.directions_walk,
    GSegmentTypeEnum.train => Icons.train,
    _ => Icons.help_outline,
  };
  Color get color => switch (this) {
    GSegmentTypeEnum.bike => Colors.blue,
    GSegmentTypeEnum.car => Colors.grey,
    GSegmentTypeEnum.boat => Colors.indigo,
    GSegmentTypeEnum.walk => Colors.green,
    GSegmentTypeEnum.train => Colors.red,
    _ => Colors.grey,
  };
  bool get isDashed => switch (this) {
    GSegmentTypeEnum.boat => true,
    GSegmentTypeEnum.train => true,
    _ => false,
  };
}

class Waypoint {
  String? id;
  LatLng latLng;
  GWaypointTypeEnum type;
  String? description;
  List<String>? images;

  Waypoint({
    this.id,
    required this.latLng,
    this.type = GWaypointTypeEnum.waypoint,
    this.description = '',
    List<String>? images,
  }) : images = images ?? [];

  GWaypointInput toGQLInput() => GWaypointInput(
    lat: latLng.latitude,
    lng: latLng.longitude,
    type: type,
    description: description != null
        ? Value.present(description)
        : Value.absent(),
  );

  factory Waypoint.fromGQL(GWaypointFieldsData data) => Waypoint(
    latLng: LatLng(data.lat, data.lng),
    type: data.type,
    id: data.id,
    description: data.description,
    images: data.images,
  );
}

class Segment {
  String? id;
  GSegmentTypeEnum type;
  List<LatLng> intermediatePoints;

  Segment({
    this.id,
    this.type = GSegmentTypeEnum.bike,
    List<LatLng>? intermediatePoints,
  }) : intermediatePoints = intermediatePoints ?? [];

  List<LatLng> allPoints(LatLng from, LatLng to) => [
    from,
    ...intermediatePoints,
    to,
  ];

  GSegmentInput toGQLInput() => GSegmentInput(
    type: type,
    intermediatePoints: intermediatePoints
        .map((p) => GLatLngInput(lat: p.latitude, lng: p.longitude))
        .toList(),
  );

  factory Segment.fromGQL(GSegmentFieldsData data) => Segment(
    id: data.id,
    type: data.type,
    intermediatePoints: data.intermediatePoints
        .map((p) => LatLng(p.lat, p.lng))
        .toList(),
  );
}

// ---------------------------------------------------------------------------
// Route
// ---------------------------------------------------------------------------

class Trip {
  String? id;
  String title;
  String description;
  DateTime? date;
  List<String> images;
  final List<Waypoint> waypoints;
  final List<Segment> segments;

  Trip({
    this.id,
    this.title = '',
    this.description = '',
    this.date,
    List<String>? images,
    this.waypoints = const [],
    this.segments = const [],
  }) : images = images ?? [],
       assert(segments.length == waypoints.length - 1 || waypoints.isEmpty);

  void addWaypoint(
    LatLng latLng, {
    GWaypointTypeEnum type = GWaypointTypeEnum.waypoint,
  }) {
    if (waypoints.isEmpty) {
      waypoints.add(Waypoint(latLng: latLng, type: GWaypointTypeEnum.start));
    } else {
      waypoints.add(Waypoint(latLng: latLng, type: type));
      segments.add(Segment());
    }
    _updateEndpoints();
  }

  void removeWaypoint(int index) {
    if (waypoints.length <= 2) return;
    waypoints.removeAt(index);
    if (index == 0) {
      segments.removeAt(0);
    } else if (index >= segments.length) {
      segments.removeAt(segments.length - 1);
    } else {
      final merged = Segment(
        type: segments[index - 1].type,
        intermediatePoints: [
          ...segments[index - 1].intermediatePoints,
          ...segments[index].intermediatePoints,
        ],
      );
      segments.removeAt(index);
      segments.removeAt(index - 1);
      segments.insert(index - 1, merged);
    }
    _updateEndpoints();
  }

  void _updateEndpoints() {
    if (waypoints.isEmpty) return;
    if (waypoints.first.type == GWaypointTypeEnum.end ||
        waypoints.first.type == GWaypointTypeEnum.start) {
      waypoints.first.type = GWaypointTypeEnum.start;
    }
    if (waypoints.last.type == GWaypointTypeEnum.start ||
        waypoints.last.type == GWaypointTypeEnum.end) {
      waypoints.last.type = GWaypointTypeEnum.end;
    }
  }

  List<LatLng> segmentPoints(int segmentIndex) {
    return segments[segmentIndex].allPoints(
      waypoints[segmentIndex].latLng,
      waypoints[segmentIndex + 1].latLng,
    );
  }

  GTripInput toGQLInput() => GTripInput(
    title: title,
    description: description,
    date: date != null
        ? Value.present(date!.toIso8601String().substring(0, 10))
        : const Value.absent(),
    images: Value.present(images),
    waypoints: Value.present(waypoints.map((w) => w.toGQLInput()).toList()),
    segments: Value.present(segments.map((s) => s.toGQLInput()).toList()),
  );

  factory Trip.fromGQL(GGetTripData_trip data) => Trip(
    id: data.id,
    title: data.title,
    description: data.description,
    // Si data.date n'est pas nul, on parse, sinon on met null
    images: data.images,
    date: data.date != null ? DateTime.parse(data.date!) : null,
    waypoints: data.waypoints.map((w) => Waypoint.fromGQL(w)).toList(),
    segments: data.segments.map((s) => Segment.fromGQL(s)).toList(),

    // TODO : charger les chemins et les images
    // imageUrls: data.imageUrls?.toList() ?? [],
    // // Pour les listes, Ferry génère aussi des sous-objets typés
  );
}
