import 'package:dartz/dartz.dart';
import 'package:domain_core/failures.dart';
import 'package:domain_core/space/offset_type.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/src/mode_machine/command/command.dart';
import 'package:map_engine/src/mode_machine/command/scopes.dart';
import 'package:trip_application/trip_application.dart';

sealed class EditTripCommand<R extends Object>
    extends Command<R, TripEditScope> {
  const EditTripCommand();
}

final class UpdateTripOrigin
    extends EditTripCommand<Either<Failure, EditRoutePayload>> {
  const UpdateTripOrigin({required this.position, required this.tripId});
  final WorldOffset position;
  final TripId tripId;

  @override
  Future<Either<Failure, EditRoutePayload>> handle(TripEditScope n) async {
    final LatLng latLng = n.camera.worldOffsetToLatLng(position);
    final route = n.getRoute(tripId);
    if (route == null) {
      return Left(
        NotFoundFailure(resourceId: tripId.toString(), resourceType: "Route"),
      );
    }
    return await n.routeEditor.setTripOrigin(latLng);
  }
}
