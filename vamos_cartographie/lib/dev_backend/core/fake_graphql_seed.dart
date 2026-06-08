import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

/// Données initiales pour peupler un [FakeGraphQLStore].
///
/// Les trips sont stockés **sans listes embarquées** (waypoints/segments/vertex
/// = `[]`). Les appartenances sont déclarées explicitement via les maps de
/// relations ([tripWaypointIds], [tripSegmentIds], [tripVertexIds]).
///
/// Invariant à respecter dans tout seed :
///   ∀ id ∈ tripWaypointIds[t] ⟹ waypoints.any((w) => w.id == id)
class FakeGraphQLSeed {
  final List<Trip> trips;
  final List<Waypoint> waypoints;
  final List<Segment> segments;
  final List<Vertex> vertices;
  final List<(String fileKey, CarouselItem item)> carouselItems;

  /// Appartenance trip → waypoints (listes ordonnées d'IDs).
  final Map<int, List<int>> tripWaypointIds;
  final Map<int, List<int>> tripSegmentIds;
  final Map<int, List<int>> tripVertexIds;

  const FakeGraphQLSeed({
    this.trips = const [],
    this.waypoints = const [],
    this.segments = const [],
    this.vertices = const [],
    this.carouselItems = const [],
    this.tripWaypointIds = const {},
    this.tripSegmentIds = const {},
    this.tripVertexIds = const {},
  });
}

// ── Seed par défaut ────────────────────────────────────────────────────────────

// Vertices
final _v1 = Vertex(id: 1, latLng: const LatLng(48.8566, 2.3522)); // Paris
final _v2 = Vertex(
  id: 2,
  latLng: const LatLng(48.8700, 2.3200),
); // Intermédiaire
final _v3 = Vertex(id: 3, latLng: const LatLng(48.8049, 2.1204)); // Versailles

// Waypoints (sans latLng : la position est portée par le vertex associé)
final _w1 = Waypoint(
  id: 1,
  vertexId: 1,
  title: 'Départ — Paris',
  type: WaypointType.start,
);
final _w2 = Waypoint(
  id: 2,
  vertexId: 3,
  title: 'Arrivée — Versailles',
  type: WaypointType.end,
);

// Segments
final _s1 = Segment(
  id: 1,
  startVertexId: 1,
  endVertexId: 2,
  type: SegmentType.bike,
);
final _s2 = Segment(
  id: 2,
  startVertexId: 2,
  endVertexId: 3,
  type: SegmentType.bike,
);

// Images
const _img1 = MediaImage(
  fileKey: 'media/trip1_cover.jpg',
  url: 'https://cdn.example.com/trip1_cover.jpg',
);

// Trips (listes embarquées vides — elles sont gérées par les maps de relations)
final _trip1 = Trip(
  id: 1,
  title: 'Paris – Versailles',
  description: 'Une sortie classique en vélo.',
  date: DateTime(2024, 7, 14),
  images: [_img1],
);

final _trip2 = Trip(
  id: 2,
  title: 'Balade en forêt',
  description: 'Circuit forestier autour de Fontainebleau.',
  date: DateTime(2024, 9, 1),
);

/// Seed par défaut :
/// - Trip 1 complet (2 waypoints, 2 segments, 3 vertices, 1 image).
/// - Trip 2 vide (aucune entité associée).
final kDefaultSeed = FakeGraphQLSeed(
  trips: [_trip1, _trip2],
  waypoints: [_w1, _w2],
  segments: [_s1, _s2],
  vertices: [_v1, _v2, _v3],
  carouselItems: [(_img1.fileKey, CarouselItem.remote(image: _img1))],
  tripWaypointIds: {
    1: [1, 2],
    2: [],
  },
  tripSegmentIds: {
    1: [1, 2],
    2: [],
  },
  tripVertexIds: {
    1: [1, 2, 3],
    2: [],
  },
);
