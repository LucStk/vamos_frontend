import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

class Seed {
  final Trip trip;
  final List<Waypoint> waypoints;
  final List<Vertex> vertices;
  final List<Segment> segments;
  Seed({
    required this.trip,
    required this.waypoints,
    required this.vertices,
    required this.segments,
  });
}
