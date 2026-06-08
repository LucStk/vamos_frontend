import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

/// Source de vérité unique du fake backend.
///
/// Règle d'or : chaque entité n'existe qu'à **un seul endroit**.
///
/// - Les maps plates ([waypoints], [segments], [vertices]) sont la source de
///   vérité pour l'**état** (données) de chaque entité.
/// - Les maps de relations ([tripWaypointIds], [tripSegmentIds],
///   [tripVertexIds]) sont la source de vérité pour l'**appartenance** d'une
///   entité à un trip.
/// - [trips] stocke les champs de base du trip uniquement (listes embarquées
///   toujours vides — elles sont assemblées à la lecture via [assembleTrip]).
class FakeGraphQLStore {
  final Map<int, Trip> trips;
  final Map<int, Waypoint> waypoints;
  final Map<int, Segment> segments;
  final Map<int, Vertex> vertices;
  final Map<String, CarouselItem> carouselItems;

  // ── Relations trip → enfants ────────────────────────────────────────────────

  /// Ordre des waypoints dans le trip (significant pour l'affichage).
  final Map<int, List<int>> tripWaypointIds;
  final Map<int, List<int>> tripSegmentIds;
  final Map<int, List<int>> tripVertexIds;

  // ── Compteurs auto-incrément ────────────────────────────────────────────────

  int _nextTripId;
  int _nextWaypointId;
  int _nextSegmentId;
  int _nextVertexId;

  FakeGraphQLStore({
    Map<int, Trip>? trips,
    Map<int, Waypoint>? waypoints,
    Map<int, Segment>? segments,
    Map<int, Vertex>? vertices,
    Map<String, CarouselItem>? carouselItems,
    Map<int, List<int>>? tripWaypointIds,
    Map<int, List<int>>? tripSegmentIds,
    Map<int, List<int>>? tripVertexIds,
    int nextTripId = 1,
    int nextWaypointId = 1,
    int nextSegmentId = 1,
    int nextVertexId = 1,
  }) : trips = trips ?? {},
       waypoints = waypoints ?? {},
       segments = segments ?? {},
       vertices = vertices ?? {},
       carouselItems = carouselItems ?? {},
       tripWaypointIds = tripWaypointIds ?? {},
       tripSegmentIds = tripSegmentIds ?? {},
       tripVertexIds = tripVertexIds ?? {},
       _nextTripId = nextTripId,
       _nextWaypointId = nextWaypointId,
       _nextSegmentId = nextSegmentId,
       _nextVertexId = nextVertexId;

  // ── Allocation d'IDs ────────────────────────────────────────────────────────

  int allocateTripId() => _nextTripId++;
  int allocateWaypointId() => _nextWaypointId++;
  int allocateSegmentId() => _nextSegmentId++;
  int allocateVertexId() => _nextVertexId++;

  // ── Assemblage ──────────────────────────────────────────────────────────────

  /// Retourne le [Trip] complet avec ses entités embarquées reconstituées
  /// depuis les maps plates.
  ///
  /// Utile lorsque la couche applicative attend un [Trip] hydraté.
  /// Les resolvers préfèrent généralement accéder directement aux maps.
  Trip assembleTrip(int tripId) {
    final base = trips[tripId];
    if (base == null) throw Exception('Trip introuvable : id=$tripId');
    return base.copyWith(
      waypoints: (tripWaypointIds[tripId] ?? []).map((id) {
        final w = waypoints[id];
        if (w == null)
          throw Exception('Waypoint introuvable : id=$id (trip $tripId)');
        return w;
      }).toList(),
      segments: (tripSegmentIds[tripId] ?? []).map((id) {
        final s = segments[id];
        if (s == null)
          throw Exception('Segment introuvable : id=$id (trip $tripId)');
        return s;
      }).toList(),
      vertex: (tripVertexIds[tripId] ?? []).map((id) {
        final v = vertices[id];
        if (v == null)
          throw Exception('Vertex introuvable : id=$id (trip $tripId)');
        return v;
      }).toList(),
    );
  }

  // ── Recherches inverses ──────────────────────────────────────────────────────

  /// Retourne l'ID du trip auquel appartient le waypoint, ou `null`.
  int? tripIdForWaypoint(int waypointId) {
    for (final entry in tripWaypointIds.entries) {
      if (entry.value.contains(waypointId)) return entry.key;
    }
    return null;
  }

  /// Retourne l'ID du trip auquel appartient le segment, ou `null`.
  int? tripIdForSegment(int segmentId) {
    for (final entry in tripSegmentIds.entries) {
      if (entry.value.contains(segmentId)) return entry.key;
    }
    return null;
  }

  /// Retourne l'ID du trip auquel appartient le vertex, ou `null`.
  int? tripIdForVertex(int vertexId) {
    for (final entry in tripVertexIds.entries) {
      if (entry.value.contains(vertexId)) return entry.key;
    }
    return null;
  }
}
