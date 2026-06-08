import 'package:vamos_cartographie/features/trips/trips.dart';

import "mock_topology_data.dart";
import "mock_waypoints_data.dart";

final Trip trip = Trip(
  id: 2,
  title: "Route des vins d'Alsace",
  description:
      "La célèbre route des vins entre Strasbourg et Mulhouse, en vélo et à pied, avec des arrêts dans les plus beaux villages alsaciens.",
  date: DateTime(2024, 9, 5),
  waypoints: tripWaypoints,
  segments: tripSegments,
  vertex: tripVertex,
);
