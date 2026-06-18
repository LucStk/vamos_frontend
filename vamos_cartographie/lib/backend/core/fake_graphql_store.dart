import 'dart:math';
import 'package:vamos_cartographie/backend/core/fake_seeds.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/media/media.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

class IdGenerator {
  int _next;
  IdGenerator(this._next);
  int next() => _next++;
}

class FakeGraphQLStore {
  Map<Id<Trip>, Trip> tripsMap = {};

  Map<Id<Waypoint>, Waypoint> waypointsMap = {};
  Map<Id<Segment>, Segment> segmentsMap = {};
  Map<Id<Vertex>, Vertex> verticesMap = {};

  Map<Id<Waypoint>, Id<Trip>> wpIdTripId = {};
  Map<Id<Segment>, Id<Trip>> sgIdTripId = {};
  Map<Id<Vertex>, Id<Trip>> vxIdTripId = {};

  Map<Id<Trip>, List<Id<Waypoint>>> tripIdWpId = {};
  Map<Id<Trip>, List<Id<Segment>>> tripIdSgId = {};
  Map<Id<Trip>, List<Id<Vertex>>> tripIdVxId = {};

  late IdGenerator nextTripId;
  late IdGenerator nextWaypointId;
  late IdGenerator nextSegmentId;
  late IdGenerator nextVertexId;
  final IdGenerator nextMediaSeed = IdGenerator(0);

  Trip trip(Id<Trip> tripId) {
    if (!tripsMap.containsKey(tripId)) {
      throw Exception('Trip introuvable : id=$tripId');
    }
    return tripsMap[tripId]!;
  }

  Vertex vertex(Id<Vertex> vertexId) {
    if (!verticesMap.containsKey(vertexId)) {
      throw Exception('Fake-Backend : Vertex introuvable : id=$vertexId');
    }
    return verticesMap[vertexId]!;
  }

  Segment segment(Id<Segment> segmentId) {
    if (!segmentsMap.containsKey(segmentId)) {
      throw Exception('Fake-Backend : Segment introuvable : id=$segmentId');
    }
    return segmentsMap[segmentId]!;
  }

  Waypoint waypoint(Id<Waypoint> waypointId) {
    if (!waypointsMap.containsKey(waypointId)) {
      throw Exception('Fake-Backend : Segment introuvable : id=$waypointId');
    }
    return waypointsMap[waypointId]!;
  }

  List<Segment> segments(Id<Trip> tripId) {
    return tripIdSgId[tripId]!.map(segment).toList();
  }

  List<Vertex> vertices(Id<Trip> tripId) {
    return tripIdVxId[tripId]!.map(vertex).toList();
  }

  List<Waypoint> waypoints(Id<Trip> tripId) {
    return tripIdWpId[tripId]!.map(waypoint).toList();
  }

  void addTrip(Trip trip) {
    final Id<Trip> tripId = trip.id;
    tripsMap[tripId] = trip;
    tripIdSgId[tripId] = [];
    tripIdWpId[tripId] = [];
    tripIdVxId[tripId] = [];
  }

  void removeTrip(Id<Trip> tripId) {
    // 1. Vérifier si le voyage existe pour éviter les erreurs de type Null
    if (!tripsMap.containsKey(tripId)) return;

    // 2. Nettoyer les Waypoints associés
    final wpIds = tripIdWpId[tripId] ?? [];
    for (final wId in wpIds) {
      waypointsMap.remove(wId);
      wpIdTripId.remove(wId);
    }

    // 3. Nettoyer les Segments associés
    final sgIds = tripIdSgId[tripId] ?? [];
    for (final sId in sgIds) {
      segmentsMap.remove(sId);
      sgIdTripId.remove(sId);
    }

    // 4. Nettoyer les Vertices associés
    final vxIds = tripIdVxId[tripId] ?? [];
    for (final vId in vxIds) {
      verticesMap.remove(vId);
      vxIdTripId.remove(vId);
    }

    // 5. Supprimer le voyage et ses listes d'index de l'historique du Store
    tripsMap.remove(tripId);
    tripIdWpId.remove(tripId);
    tripIdSgId.remove(tripId);
    tripIdVxId.remove(tripId);
  }

  void addVertex(Id<Trip> tripId, Vertex v) {
    verticesMap[v.id] = v;
    vxIdTripId[v.id] = tripId;
    tripIdVxId[tripId]!.add(v.id);
  }

  void removeVertex(Id<Vertex> vId) {
    Id<Trip> tripId = vxIdTripId[vId]!;
    verticesMap.remove(vId);
    vxIdTripId.remove(vId);
    tripIdVxId[tripId]!.removeWhere((x) => x == vId);
  }

  void addSegment(Id<Trip> tripId, Segment s) {
    segmentsMap[s.id] = s;
    sgIdTripId[s.id] = tripId;
    tripIdSgId[tripId]!.add(s.id);
  }

  void removeSegment(Id<Segment> sId) {
    Id<Trip> tripId = sgIdTripId[sId]!;
    segmentsMap.remove(sId);
    sgIdTripId.remove(sId);
    tripIdSgId[tripId]!.removeWhere((x) => x == sId);
  }

  void addWaypoint(Id<Trip> tripId, Waypoint w) {
    waypointsMap[w.id] = w;
    wpIdTripId[w.id] = tripId;
    tripIdWpId[tripId]!.add(w.id);
  }

  void removeWaypoint(Id<Waypoint> wId) {
    Id<Trip> tripId = wpIdTripId[wId]!;
    waypointsMap.remove(wId);
    wpIdTripId.remove(wId);
    tripIdWpId[tripId]!.removeWhere((x) => x == wId);
  }

  MediaImage getMediaImage(String fileKey) {
    return MediaImage(
      fileKey: fileKey,
      url: "https://picsum.photos/seed/$fileKey/300/300",
    );
  }

  FakeGraphQLStore(List<Seed> seeds) {
    int maxTripId = 0;
    int maxWaypointId = 0;
    int maxSegmentId = 0;
    int maxVertexId = 0;
    for (Seed seed in seeds) {
      final Id<Trip> tripId = seed.trip.id;
      maxTripId = max(tripId.value, maxTripId);
      addTrip(seed.trip);

      for (final w in seed.waypoints) {
        maxWaypointId = max(w.id.value, maxWaypointId);
        addWaypoint(tripId, w);
      }
      for (final s in seed.segments) {
        segmentsMap[s.id] = s;
        maxSegmentId = max(s.id.value, maxSegmentId);
        addSegment(tripId, s);
      }
      for (final v in seed.vertices) {
        maxVertexId = max(v.id.value, maxVertexId);
        addVertex(tripId, v);
      }
    }

    nextTripId = IdGenerator(maxTripId + 1);
    nextWaypointId = IdGenerator(maxWaypointId + 1);
    nextSegmentId = IdGenerator(maxSegmentId + 1);
    nextVertexId = IdGenerator(maxVertexId + 1);
  }
}
