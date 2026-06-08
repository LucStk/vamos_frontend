import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

// ── Trip ──────────────────────────────────────────────────────────────────────

Trip trip({
  int id = 1,
  String title = 'Trip de test',
  String description = 'Une belle aventure',
  DateTime? date,
  List<MediaImage> images = const [],
  List<Waypoint> waypoints = const [],
  List<Segment> segments = const [],
  List<Vertex> vertex = const [],
}) => Trip(
  id: id,
  title: title,
  description: description,
  date: date,
  images: images,
  waypoints: waypoints,
  segments: segments,
  vertex: vertex,
);

TripDraft tripDraft({
  String title = 'Nouveau trip',
  String description = '',
  DateTime? date,
  List<MediaImage> images = const [],
}) => TripDraft(
  title: title,
  description: description,
  date: date,
  images: images,
);
