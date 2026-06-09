import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/topology/data/repositories/vertex_repository.dart';

import 'package:vamos_cartographie/features/topology/data/topology_providers.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
part "vertex_service.g.dart";

class VertexService {
  final VertexRepository _repo;
  VertexService(this._repo);

  Future<Map<int, Vertex>> getVertices(int tripId) async {
    final result = await _repo.getVertices(tripId);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (vertexs) => {for (final vertex in vertexs) vertex.id: vertex},
    );
  }

  Future<Vertex> createVertex(int tripId, LatLng latLng) async {
    final result = await _repo.createVertex(tripId, latLng);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (vertex) => vertex,
    );
  }

  Future<Vertex> moveVertex(int id, LatLng latLng) async {
    final result = await _repo.moveVertex(id, latLng);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (vertex) => vertex,
    );
  }

  Future<void> deleteVertex(int id) async {
    final result = await _repo.deleteVertex(id);

    return result.fold((failure) => throw Exception(failure.message), (_) {});
  }
}

@riverpod
VertexService vertexService(Ref ref) {
  return VertexService(ref.read(vertexRepositoryProvider));
}
