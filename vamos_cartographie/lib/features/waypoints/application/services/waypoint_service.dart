import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/waypoints/data/waypoints_providers.dart';
import 'package:vamos_cartographie/features/waypoints/data/waypoint_repository.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
part "waypoint_service.g.dart";

class WaypointService {
  final WaypointRepository _repo;
  WaypointService(this._repo);

  Future<Map<int, Waypoint>> getWaypoints(int tripId) async {
    final result = await _repo.getWaypoints(tripId);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (waypoints) => {for (final waypoint in waypoints) waypoint.id: waypoint},
    );
  }

  Future<CreateWaypointResult> createWaypoint(
    int tripId,
    WaypointDraft draft,
    int? vertexId,
    LatLng? latLng,
  ) async {
    final result = await _repo.createWaypoint(tripId, draft, vertexId, latLng);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (ret) => ret,
    );
  }

  Future<Either<Failure, Waypoint>> updateWaypoint(
    int id,
    WaypointDraft draft,
  ) async {
    return await _repo.updateWaypoint(id, draft);
  }

  Future<Either<Failure, void>> deleteWaypoint(int id) async {
    return await _repo.deleteWaypoint(id);
  }
}

@riverpod
WaypointService waypointService(Ref ref) {
  return WaypointService(ref.read(waypointRepositoryProvider));
}
