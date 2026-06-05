import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/segments/domain/entities/segment_vertex.dart';
import 'segments_notifier.dart';
import 'waypoints_notifier.dart';

part 'segment_vertices_notifier.g.dart';

/// Provider qui retourne tous les vertices d'un segment (incluant start, middle, end)
@riverpod
List<SegmentVertex>? segmentAllVertices(Ref ref, int tripId, int segmentId) {
  final segment = ref.watch(segmentProvider(tripId, segmentId));
  if (segment == null) return null;

  final start = ref.watch(
    waypointLatLngProvider(tripId, segment.startWaypointId),
  );
  final end = ref.watch(waypointLatLngProvider(tripId, segment.endVertexId));

  if (start == null || end == null) return null;

  return [
    SegmentVertex(id: 'start-${segment.id}', point: start),
    ...segment.middleVertices,
    SegmentVertex(id: 'end-${segment.id}', point: end),
  ];
}

/// Provider qui calcule les ghost markers (mi-chemin entre chaque vertex)
@riverpod
List<GhostMarkerData>? segmentGhostMarkers(Ref ref, int tripId, int segmentId) {
  final vertices = ref.watch(segmentAllVerticesProvider(tripId, segmentId));
  if (vertices == null || vertices.length < 2) return null;

  final List<GhostMarkerData> ghosts = [];

  for (int i = 0; i < vertices.length - 1; i++) {
    final current = vertices[i];
    final next = vertices[i + 1];

    // Position au milieu
    final midPoint = LatLng(
      (current.point.latitude + next.point.latitude) / 2,
      (current.point.longitude + next.point.longitude) / 2,
    );

    ghosts.add(
      GhostMarkerData(
        id: 'ghost-$segmentId-$i',
        position: midPoint,
        insertIndex: i + 1, // Position où insérer le nouveau vertex
        segmentId: segmentId,
        tripId: tripId,
      ),
    );
  }

  return ghosts;
}

/// Données pour un ghost marker
class GhostMarkerData {
  final String id;
  final LatLng position;
  final int insertIndex; // Index où insérer dans middleVertices
  final int segmentId;
  final int tripId;

  GhostMarkerData({
    required this.id,
    required this.position,
    required this.insertIndex,
    required this.segmentId,
    required this.tripId,
  });
}
