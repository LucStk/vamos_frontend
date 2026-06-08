import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

// ── Waypoint ──────────────────────────────────────────────────────────────────

Waypoint waypoint({
  int id = 1,
  int vertexId = 1,
  String title = 'Waypoint de test',
  WaypointType type = WaypointType.waypoint,
  String description = '',
  List<MediaImage> images = const [],
}) => Waypoint(
  id: id,
  vertexId: vertexId,
  title: title,
  type: type,
  description: description,
  images: images,
);

WaypointDraft waypointDraft({
  String title = 'Nouveau waypoint',
  WaypointType type = WaypointType.waypoint,
  String description = '',
  List<MediaImage> images = const [],
}) => WaypointDraft(
  title: title,
  type: type,
  description: description,
  images: images,
);
