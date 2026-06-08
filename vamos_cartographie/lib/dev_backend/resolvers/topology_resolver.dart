import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/topology/data/mappers/segment_type_mapper.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import "package:vamos_cartographie/dev_backend/core/fake_graphql_store.dart";
import "package:vamos_cartographie/dev_backend/mapping/gql_mappers.dart";

/// Résout les opérations GraphQL relatives aux segments et vertices.
class TopologyResolver {
  final FakeGraphQLStore store;

  TopologyResolver(this.store);

  // ── Queries ──────────────────────────────────────────────────────────────────

  Map<String, dynamic> getSegments(int tripId) {
    final segments = store.segments(tripId).map((s) {
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
    ).toJson();
  }

  Map<String, dynamic> getVertices(int tripId) {
    final vertices = (store.vertices(
      tripId,
    )).map((v) => vertexToGql(store.verticesMap[v.id]!)).toList();

    return GGetVerticesData(
      trip: GGetVerticesData_trip(
        topology: GGetVerticesData_trip_topology(vertices: vertices),
      ),
    ).toJson();
  }

  Map<String, dynamic> getTopology(int tripId) {
    final vertices = (store.vertices(tripId)).map(vertexToGql).toList();

    final segments = store.segments(tripId).map((s) {
      return segmentToGql(
        s,
        store.verticesMap[s.startVertexId]!,
        store.verticesMap[s.endVertexId]!,
      );
    }).toList();

    return GGetTopologyData(
      trip: GGetTopologyData_trip(
        id: tripId,
        topology: GGetTopologyData_trip_topology(
          vertices: vertices,
          segments: segments,
        ),
      ),
    ).toJson();
  }

  // ── Mutations — Vertices ──────────────────────────────────────────────────────

  Map<String, dynamic> createVertex(Map<String, dynamic> variables) {
    final tripId = variables['tripId'] as int;
    final latLngMap = variables['latLng'] as Map<String, dynamic>;

    if (!store.tripsMap.containsKey(tripId)) {
      throw Exception('Trip introuvable : id=$tripId');
    }

    final id = store.nextVertexId.next();
    final vertex = Vertex(
      id: id,
      latLng: LatLng(latLngMap['lat'] as double, latLngMap['lng'] as double),
    );
    store.addVertex(tripId, vertex);
    return GCreateVertexData(createVertex: vertexToGql(vertex)).toJson();
  }

  Map<String, dynamic> moveVertex(Map<String, dynamic> variables) {
    final id = variables['id'] as int;
    final latLngMap = variables['latLng'] as Map<String, dynamic>;

    final existing = store.vertex(id);

    final updated = Vertex(
      id: id,
      latLng: LatLng(latLngMap['lat'] as double, latLngMap['lng'] as double),
    );
    store.verticesMap[id] = updated;
    return GMoveVertexData(moveVertex: vertexToGql(updated)).toJson();
  }

  Map<String, dynamic> deleteVertex(int vertexId) {
    if (!store.verticesMap.containsKey(vertexId)) {
      throw Exception('Vertex introuvable : id=$vertexId');
    }

    store.removeVertex(vertexId);

    return GDeleteVertexData(deleteVertex: true).toJson();
  }

  // ── Mutations — Segments ──────────────────────────────────────────────────────

  Map<String, dynamic> createSegment(Map<String, dynamic> variables) {
    final tripId = variables['tripId'] as int;
    final input = GSegmentCreateInput.fromJson(
      variables['segment'] as Map<String, dynamic>,
    );

    if (!store.tripsMap.containsKey(tripId)) {
      throw Exception('Trip introuvable : id=$tripId');
    }

    // Par défaut géometry est juste une ligne entre les deux points
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
    ).toJson();
  }

  Map<String, dynamic> updateSegment(Map<String, dynamic> variables) {
    final id = variables['id'] as int;
    final input = GSegmentUpdateInput.fromJson(
      variables['segment'] as Map<String, dynamic>,
    );

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
    ).toJson();
  }

  Map<String, dynamic> deleteSegment(int segmentId) {
    store.removeSegment(segmentId);
    return GDeleteSegmentData(deleteSegment: true).toJson();
  }
}
