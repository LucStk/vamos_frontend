import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/topology/data/mappers/segment_type_mapper.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import "package:vamos_cartographie/dev_backend/core/fake_graphql_store.dart";
import "package:vamos_cartographie/dev_backend/mapping/gql_mappers.dart";

/// Résout les opérations GraphQL relatives aux segments et vertices.
class TopologyResolver {
  final FakeGraphQLStore store;

  /// Table de correspondance qui associe chaque nom d'opération GraphQL
  /// à une fonction gérant la désérialisation, l'exécution et la sérialisation.
  late final Map<String, Map<String, dynamic>? Function(Map<String, dynamic>?)>
  mockHandlers;

  TopologyResolver(this.store) {
    _initHandlers();
  }

  void _initHandlers() {
    mockHandlers = {
      // Queries
      "GetSegments": (raw) =>
          getSegments(GGetSegmentsVars.fromJson(raw ?? const {})).toJson(),
      "GetVertices": (raw) =>
          getVertices(GGetVerticesVars.fromJson(raw ?? const {})).toJson(),
      "GetTopology": (raw) =>
          getTopology(GGetTopologyVars.fromJson(raw ?? const {})).toJson(),

      // Mutations — Vertices
      "CreateVertex": (raw) =>
          createVertex(GCreateVertexVars.fromJson(raw ?? const {})).toJson(),
      "MoveVertex": (raw) =>
          moveVertex(GMoveVertexVars.fromJson(raw ?? const {})).toJson(),
      "DeleteVertex": (raw) =>
          deleteVertex(GDeleteVertexVars.fromJson(raw ?? const {})).toJson(),

      // Mutations — Segments
      "CreateSegment": (raw) =>
          createSegment(GCreateSegmentVars.fromJson(raw ?? const {})).toJson(),
      "UpdateSegment": (raw) =>
          updateSegment(GUpdateSegmentVars.fromJson(raw ?? const {})).toJson(),
      "DeleteSegment": (raw) =>
          deleteSegment(GDeleteSegmentVars.fromJson(raw ?? const {})).toJson(),
    };
  }

  // ── Queries ──────────────────────────────────────────────────────────────────

  GGetSegmentsData getSegments(GGetSegmentsVars vars) {
    final segments = store.segments(vars.tripId).map((s) {
      return segmentToGql(
        s,
        store.vertex(s.startVertexId),
        store.vertex(s.endVertexId),
      );
    }).toList();

    return GGetSegmentsData(
      trip: GGetSegmentsData_trip(
        topology: GGetSegmentsData_trip_topology(segments: segments),
      ),
    );
  }

  GGetVerticesData getVertices(GGetVerticesVars vars) {
    final vertices = (store.vertices(
      vars.tripId,
    )).map((v) => vertexToGql(store.verticesMap[v.id]!)).toList();

    return GGetVerticesData(
      trip: GGetVerticesData_trip(
        topology: GGetVerticesData_trip_topology(vertices: vertices),
      ),
    );
  }

  GGetTopologyData getTopology(GGetTopologyVars vars) {
    final vertices = (store.vertices(vars.tripId)).map(vertexToGql).toList();

    final segments = store.segments(vars.tripId).map((s) {
      return segmentToGql(
        s,
        store.verticesMap[s.startVertexId]!,
        store.verticesMap[s.endVertexId]!,
      );
    }).toList();

    return GGetTopologyData(
      trip: GGetTopologyData_trip(
        id: vars.tripId,
        topology: GGetTopologyData_trip_topology(
          vertices: vertices,
          segments: segments,
        ),
      ),
    );
  }

  // ── Mutations — Vertices ──────────────────────────────────────────────────────

  GCreateVertexData createVertex(GCreateVertexVars vars) {
    final int tripId = vars.tripId;
    final latLngMap = vars.latLng;

    if (!store.tripsMap.containsKey(tripId)) {
      throw Exception('Trip introuvable : id=$tripId');
    }

    final id = store.nextVertexId.next();
    final vertex = Vertex(id: id, latLng: LatLng(latLngMap.lat, latLngMap.lng));
    store.addVertex(tripId, vertex);
    return GCreateVertexData(createVertex: vertexToGql(vertex));
  }

  GMoveVertexData moveVertex(GMoveVertexVars vars) {
    final int id = vars.id;
    final latLngMap = vars.latLng;

    final updated = Vertex(
      id: id,
      latLng: LatLng(latLngMap.lat, latLngMap.lng),
    );
    store.verticesMap[id] = updated;
    return GMoveVertexData(moveVertex: vertexToGql(updated));
  }

  GDeleteVertexData deleteVertex(GDeleteVertexVars vars) {
    if (!store.verticesMap.containsKey(vars.vertexId)) {
      throw Exception('Vertex introuvable : id=$vars.vertexId');
    }

    store.removeVertex(vars.vertexId);

    return GDeleteVertexData(deleteVertex: true);
  }

  // ── Mutations — Segments ──────────────────────────────────────────────────────

  GCreateSegmentData createSegment(GCreateSegmentVars vars) {
    final int tripId = vars.tripId;
    final GSegmentCreateInput input = vars.segment;

    if (!store.tripsMap.containsKey(tripId)) {
      throw Exception('Trip introuvable : id=$tripId');
    }

    final startVertex = store.vertex(input.startVertexId);
    final endVertex = store.vertex(input.endVertexId);
    final List<LatLng> geometry = [startVertex.latLng, endVertex.latLng];

    final sid = store.nextSegmentId.next();
    final segment = Segment(
      id: sid,
      startVertexId: input.startVertexId,
      endVertexId: input.endVertexId,
      type: input.type.toDomain(),
      geometry: geometry,
    );

    store.addSegment(tripId, segment);

    return GCreateSegmentData(
      createSegment: segmentToGql(
        segment,
        store.vertex(segment.startVertexId),
        store.vertex(segment.endVertexId),
      ),
    );
  }

  GUpdateSegmentData updateSegment(GUpdateSegmentVars vars) {
    final int id = vars.id;
    final GSegmentUpdateInput input = vars.segment;

    final existing = store.segment(id);

    final updatedStartId =
        input.startVertexId.isPresent &&
            input.startVertexId.requireValue != null
        ? input.startVertexId.requireValue!
        : existing.startVertexId;

    final updatedEndId =
        input.endVertexId.isPresent && input.endVertexId.requireValue != null
        ? input.endVertexId.requireValue!
        : existing.endVertexId;

    final updated = existing.copyWith(
      type: input.type.isPresent && input.type.requireValue != null
          ? input.type.requireValue!.toDomain()
          : existing.type,
      startVertexId: updatedStartId,
      endVertexId: updatedEndId,
    );

    store.segmentsMap[id] = updated;

    return GUpdateSegmentData(
      updateSegment: segmentToGql(
        updated,
        store.vertex(updated.startVertexId),
        store.vertex(updated.endVertexId),
      ),
    );
  }

  GDeleteSegmentData deleteSegment(GDeleteSegmentVars vars) {
    store.removeSegment(vars.segmentId);
    return GDeleteSegmentData(deleteSegment: true);
  }
}
