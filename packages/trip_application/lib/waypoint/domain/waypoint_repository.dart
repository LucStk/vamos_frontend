import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/topology/domain/entities/entities.dart';
import 'package:trip_application/topology/domain/types/types.dart';
import 'package:trip_application/trip/domain/trip.dart';
import 'package:trip_application/waypoint/domain/waypoint_model.dart';

abstract class WaypointRepository {
  Future<Either<Failure, List<WaypointRemoteModel>>> getWaypoints(TripId id);
  Future<Either<Failure, WaypointCreateBlankRes>>
  createBlankWaypointFromPosition(TripId tripId, LatLng latLng);
  Future<Either<Failure, WaypointCreateBlankRes>> createBlankWaypointFromVertex(
    TripId tripId,
    VertexId vertexId,
  );
  Future<Either<Failure, WaypointRemoteModel>> updateWaypoint(
    WaypointRemoteModel waypoint,
  );
  Future<Either<Failure, StoredFileFields>> attachFileToWaypoint(
    WaypointId waypointId,
    StoredFileId fileId,
  );

  Future<Either<Failure, void>> deleteWaypoint(WaypointId id);
}
