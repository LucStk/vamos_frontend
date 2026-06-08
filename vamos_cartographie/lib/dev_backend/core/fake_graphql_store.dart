import 'dart:math';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

import "package:vamos_cartographie/dev_backend/core/fake_seeds.dart";

class IdGenerator {
  int _next;
  IdGenerator(this._next);
  int next() => _next++;
}

class FakeGraphQLStore {
  Map<int, Trip> tripsMap = {};

  Map<int, Waypoint> waypointsMap = {};
  Map<int, Segment> segmentsMap = {};
  Map<int, Vertex> verticesMap = {};

  Map<int, int> wpIdTripId = {};
  Map<int, int> sgIdTripId = {};
  Map<int, int> vxIdTripId = {};

  Map<int, List<int>> tripIdWpId = {};
  Map<int, List<int>> tripIdSgId = {};
  Map<int, List<int>> tripIdVxId = {};

  late IdGenerator nextTripId;
  late IdGenerator nextWaypointId;
  late IdGenerator nextSegmentId;
  late IdGenerator nextVertexId;

  Trip trip(int tripId) {
    if (!tripsMap.containsKey(tripId)) {
      throw Exception('Trip introuvable : id=$tripId');
    }
    return tripsMap[tripId]!;
  }

  Vertex vertex(int vertexId) {
    if (!verticesMap.containsKey(vertexId)) {
      throw Exception('Fake-Backend : Vertex introuvable : id=$vertexId');
    }
    return verticesMap[vertexId]!;
  }

  Segment segment(int segmentId) {
    if (!segmentsMap.containsKey(segmentId)) {
      throw Exception('Fake-Backend : Segment introuvable : id=$segmentId');
    }
    return segmentsMap[segmentId]!;
  }

  Waypoint waypoint(int waypointId) {
    if (!waypointsMap.containsKey(waypointId)) {
      throw Exception('Fake-Backend : Segment introuvable : id=$waypointId');
    }
    return waypointsMap[waypointId]!;
  }

  List<Segment> segments(int tripId) {
    return tripIdSgId[tripId]!.map(segment).toList();
  }

  List<Vertex> vertices(int tripId) {
    return tripIdVxId[tripId]!.map(vertex).toList();
  }

  List<Waypoint> waypoints(int tripId) {
    return tripIdWpId[tripId]!.map(waypoint).toList();
  }

  void addTrip(Trip trip) {
    final int tripId = trip.id;
    tripsMap[tripId] = trip;
    tripIdSgId[tripId] = [];
    tripIdWpId[tripId] = [];
    tripIdVxId[tripId] = [];
  }

  void removeTrip(int tripId) {
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

  void addVertex(int tripId, Vertex v) {
    verticesMap[v.id] = v;
    vxIdTripId[v.id] = tripId;
    tripIdVxId[tripId]!.add(v.id);
  }

  void removeVertex(int vId) {
    int tripId = vxIdTripId[vId]!;
    verticesMap.remove(vId);
    vxIdTripId.remove(vId);
    tripIdVxId[tripId]!.removeWhere((x) => x == vId);
  }

  void addSegment(int tripId, Segment s) {
    segmentsMap[s.id] = s;
    sgIdTripId[s.id] = tripId;
    tripIdSgId[tripId]!.add(s.id);
  }

  void removeSegment(int sId) {
    int tripId = sgIdTripId[sId]!;
    segmentsMap.remove(sId);
    sgIdTripId.remove(sId);
    tripIdSgId[tripId]!.removeWhere((x) => x == sId);
  }

  void addWaypoint(int tripId, Waypoint w) {
    waypointsMap[w.id] = w;
    wpIdTripId[w.id] = tripId;
    tripIdWpId[tripId]!.add(w.id);
  }

  void removeWaypoint(int wId) {
    int tripId = wpIdTripId[wId]!;
    waypointsMap.remove(wId);
    wpIdTripId.remove(wId);
    tripIdWpId[tripId]!.removeWhere((x) => x == wId);
  }

  FakeGraphQLStore(List<Seed> seeds) {
    int maxTripId = 0;
    int maxWaypointId = 0;
    int maxSegmentId = 0;
    int maxVertexId = 0;
    for (Seed seed in seeds) {
      final int tripId = seed.trip.id;
      maxTripId = max(tripId, maxTripId);
      addTrip(seed.trip);

      for (final w in seed.waypoints) {
        maxWaypointId = max(w.id, maxWaypointId);
        addWaypoint(tripId, w);
      }
      for (final s in seed.segments) {
        segmentsMap[s.id] = s;
        maxSegmentId = max(s.id, maxSegmentId);
        addSegment(tripId, s);
      }
      for (final v in seed.vertices) {
        maxVertexId = max(v.id, maxVertexId);
        addVertex(tripId, v);
      }
    }

    nextTripId = IdGenerator(maxTripId + 1);
    nextWaypointId = IdGenerator(maxWaypointId + 1);
    nextSegmentId = IdGenerator(maxSegmentId + 1);
    nextVertexId = IdGenerator(maxVertexId + 1);
  }
}
