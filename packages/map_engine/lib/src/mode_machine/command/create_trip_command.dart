import 'package:dartz/dartz.dart';
import 'package:domain_core/failures.dart';
import 'package:domain_core/space/offset_type.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/src/mode_machine/command/command.dart';
import 'package:map_engine/src/mode_machine/command/scopes.dart';
import 'package:trip_application/trip_application.dart';

sealed class CreateTripCommand<R extends Object>
    extends Command<R, TripCreateScope> {
  const CreateTripCommand();
}

final class CreateTrip extends CreateTripCommand<Either<Failure, Trip>> {
  const CreateTrip(this.position);
  final WorldOffset position;
  @override
  Future<Either<Failure, Trip>> handle(TripCreateScope n) async {
    final LatLng latLng = n.camera.worldOffsetToLatLng(position);
    return await n.tripEditor.createBlankTrip(latLng);
  }
}
