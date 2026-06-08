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
    if (!store.trips.containsKey(tripId)) {
      throw Exception('Trip introuvable : id=$tripId');
    }

    final segments = (store.tripSegmentIds[tripId] ?? []).map((sId) {
      final s = store.segments[sId]!;
      return segmentToGql(
        s,
        store.vertices[s.startVertexId]!,
        store.vertices[s.endVertexId]!,
      );
    }).toList();

    return GGetSegmentsData(
      trip: GGetSegmentsData_trip(
        topology: GGetSegmentsData_trip_topology(segments: segments),
      ),
    ).toJson();
  }

  Map<String, dynamic> getVertices(int tripId) {
    if (!store.trips.containsKey(tripId)) {
      throw Exception('Trip introuvable : id=$tripId');
    }

    final vertices = (store.tripVertexIds[tripId] ?? [])
        .map((vId) => vertexToGql(store.vertices[vId]!))
        .toList();

    return GGetVerticesData(
      trip: GGetVerticesData_trip(
        topology: GGetVerticesData_trip_topology(vertices: vertices),
      ),
    ).toJson();
  }

  Map<String, dynamic> getTopology(int tripId) {
    if (!store.trips.containsKey(tripId)) {
      throw Exception('Trip introuvable : id=$tripId');
    }

    final vertices = (store.tripVertexIds[tripId] ?? [])
        .map((vId) => vertexToGql(store.vertices[vId]!))
        .toList();

    final segments = (store.tripSegmentIds[tripId] ?? []).map((sId) {
      final s = store.segments[sId]!;
      return segmentToGql(
        s,
        store.vertices[s.startVertexId]!,
        store.vertices[s.endVertexId]!,
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

    if (!store.trips.containsKey(tripId)) {
      throw Exception('Trip introuvable : id=$tripId');
    }

    final id = store.allocateVertexId();
    final vertex = Vertex(
      id: id,
      latLng: LatLng(latLngMap['lat'] as double, latLngMap['lng'] as double),
    );

    store.vertices[id] = vertex;
    (store.tripVertexIds[tripId] ??= []).add(id);

    return GCreateVertexData(createVertex: vertexToGql(vertex)).toJson();
  }

  Map<String, dynamic> moveVertex(Map<String, dynamic> variables) {
    final id = variables['id'] as int;
    final latLngMap = variables['latLng'] as Map<String, dynamic>;

    final existing = store.vertices[id];
    if (existing == null) throw Exception('Vertex introuvable : id=$id');

    final updated = Vertex(
      id: id,
      latLng: LatLng(latLngMap['lat'] as double, latLngMap['lng'] as double),
    );

    store.vertices[id] = updated;
    return GMoveVertexData(moveVertex: vertexToGql(updated)).toJson();
  }

  Map<String, dynamic> deleteVertex(int vertexId) {
    if (!store.vertices.containsKey(vertexId)) {
      throw Exception('Vertex introuvable : id=$vertexId');
    }

    store.vertices.remove(vertexId);
    final tripId = store.tripIdForVertex(vertexId);
    store.tripVertexIds[tripId]?.remove(vertexId);

    return GDeleteVertexData(deleteVertex: true).toJson();
  }

  // ── Mutations — Segments ──────────────────────────────────────────────────────

  Map<String, dynamic> createSegment(Map<String, dynamic> variables) {
    final tripId = variables['tripId'] as int;
    final input = GSegmentCreateInput.fromJson(
      variables['segment'] as Map<String, dynamic>,
    );

    if (!store.trips.containsKey(tripId)) {
      throw Exception('Trip introuvable : id=$tripId');
    }
    if (!store.vertices.containsKey(input.startVertexId)) {
      throw Exception('startVertex introuvable : id=${input.startVertexId}');
    }
    if (!store.vertices.containsKey(input.endVertexId)) {
      throw Exception('endVertex introuvable : id=${input.endVertexId}');
    }

    final id = store.allocateSegmentId();
    final segment = Segment(
      id: id,
      startVertexId: input.startVertexId,
      endVertexId: input.endVertexId,
      type: input.type.toDomain(),
      geometry: input.geometry.isPresent && input.geometry.requireValue != null
          ? input.geometry.requireValue!
                .map((ll) => LatLng(ll.lat, ll.lng))
                .toList()
          : [],
    );

    store.segments[id] = segment;
    (store.tripSegmentIds[tripId] ??= []).add(id);

    return GCreateSegmentData(
      createSegment: segmentToGql(
        segment,
        store.vertices[segment.startVertexId]!,
        store.vertices[segment.endVertexId]!,
      ),
    ).toJson();
  }

  Map<String, dynamic> updateSegment(Map<String, dynamic> variables) {
    final id = variables['id'] as int;
    final input = GSegmentUpdateInput.fromJson(
      variables['segment'] as Map<String, dynamic>,
    );

    final existing = store.segments[id];
    if (existing == null) throw Exception('Segment introuvable : id=$id');

    final updatedStartId =
        input.startVertexId.isPresent &&
            input.startVertexId.requireValue != null
        ? input.startVertexId.requireValue!
        : existing.startVertexId;

    final updatedEndId =
        input.endVertexId.isPresent && input.endVertexId.requireValue != null
        ? input.endVertexId.requireValue!
        : existing.endVertexId;

    if (!store.vertices.containsKey(updatedStartId)) {
      throw Exception('startVertex introuvable : id=$updatedStartId');
    }
    if (!store.vertices.containsKey(updatedEndId)) {
      throw Exception('endVertex introuvable : id=$updatedEndId');
    }

    final updated = existing.copyWith(
      type: input.type.isPresent && input.type.requireValue != null
          ? input.type.requireValue!.toDomain()
          : existing.type,
      startVertexId: updatedStartId,
      endVertexId: updatedEndId,
      geometry: input.geometry.isPresent && input.geometry.requireValue != null
          ? input.geometry.requireValue!
                .map((ll) => LatLng(ll.lat, ll.lng))
                .toList()
          : existing.geometry,
    );

    store.segments[id] = updated;

    return GUpdateSegmentData(
      updateSegment: segmentToGql(
        updated,
        store.vertices[updated.startVertexId]!,
        store.vertices[updated.endVertexId]!,
      ),
    ).toJson();
  }

  Map<String, dynamic> deleteSegment(int segmentId) {
    if (!store.segments.containsKey(segmentId)) {
      throw Exception('Segment introuvable : id=$segmentId');
    }

    store.segments.remove(segmentId);
    final tripId = store.tripIdForSegment(segmentId);
    store.tripSegmentIds[tripId]?.remove(segmentId);

    return GDeleteSegmentData(deleteSegment: true).toJson();
  }
}
