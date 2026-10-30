import 'package:dartz/dartz.dart';
import 'package:domain_core/failures.dart';
import 'package:domain_core/space/offset_type.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/src/mode_engine/app_scope.dart';
import 'package:map_engine/src/mode_engine/command.dart';
import 'package:trip_application/trip_application.dart';

sealed class PlaceOriginCommand<R extends Object> extends Command<R> {
  const PlaceOriginCommand();
}

final class SetTripOrigin
    extends PlaceOriginCommand<Either<Failure, EditRoutePayload>> {
  const SetTripOrigin({required this.position, required this.tripId});
  final WorldOffset position;
  final TripId tripId;

  @override
  Future<Either<Failure, EditRoutePayload>> handle(AppCommandScope n) async {
    final LatLng latLng = n.camera.worldOffsetToLatLng(position);
    final route = n.forTrip(tripId).route;
    if (route == null) {
      return Left(
        NotFoundFailure(resourceId: tripId.toString(), resourceType: "Route"),
      );
    }
    return await n.forTrip(tripId).routeEditor.setTripOrigin(latLng);
  }
}

final class PatchTripOrigin extends PlaceOriginCommand<Failure> {
  const PatchTripOrigin({required this.position, required this.tripId});
  final WorldOffset position;
  final TripId tripId;

  @override
  Future<Failure?> handle(AppCommandScope n) async {
    final LatLng latLng = n.camera.worldOffsetToLatLng(position);
    final route = n.forTrip(tripId).route;
    if (route == null) {
      return NotFoundFailure(
        resourceId: tripId.toString(),
        resourceType: "Route",
      );
    }
    n
        .forTrip(tripId)
        .patchRoute(
          RoutePatchModel.fromFields(route).copyWith(startPoint: latLng),
        );
    return null;
  }
}

final class CreateTrip extends PlaceOriginCommand<Either<Failure, Trip>> {
  const CreateTrip(this.position);
  final WorldOffset position;
  @override
  Future<Either<Failure, Trip>> handle(AppCommandScope n) async {
    final LatLng latLng = n.camera.worldOffsetToLatLng(position);
    return await n.tripEditor.createBlankTrip(latLng);
  }
}
