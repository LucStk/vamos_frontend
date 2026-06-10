import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/waypoints/data/waypoint_repository.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/waypoint.dart';
import 'package:vamos_cartographie/features/topology/domain/entities/vertex.dart';

class CreateWaypointUseCase {
  final WaypointRepository _repo;

  CreateWaypointUseCase(this._repo);

  Future<(Waypoint waypoint, Vertex vertex)> call({
    required int tripId,
    required WaypointDraft draft,
    int? vertexId,
    LatLng? latLng,
  }) async {
    final result = await _repo.createWaypoint(tripId, draft, vertexId, latLng);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (tuple) => tuple, // (Waypoint, Vertex)
    );
  }
}
