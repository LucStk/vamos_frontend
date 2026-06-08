import 'package:vamos_cartographie/features/trips/trips.dart';
import "mock_topology_data.dart";
import "mock_waypoints_data.dart";

final Trip trip = // --- Voyage 3 : Traversée des Pyrénées ---
Trip(
  id: 3,
  title: 'Traversée des Pyrénées',
  description:
      'Un périple épique à vélo à travers les contreforts pyrénéens, de la côte basque jusqu\'aux sommets de Lourdes.',
  date: DateTime(2024, 8, 20),
  waypoints: tripWaypoints,
  segments: tripSegments,
  vertex: tripVertex,
);
