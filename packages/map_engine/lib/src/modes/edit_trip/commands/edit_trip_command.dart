import 'package:dartz/dartz.dart';
import 'package:domain_core/failures.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:trip_application/trip_application.dart';

sealed class EditTripCommand<R extends Object> extends Command<R> {
  const EditTripCommand();
}

final class DeleteRoute
    extends EditTripCommand<Either<Failure, EditRoutePayload>> {
  const DeleteRoute({required this.tripId});
  final TripId tripId;

  @override
  Future<Either<Failure, EditRoutePayload>> handle(AppCommandScope h) async {
    return await h.forTrip(tripId).routeEditor.deleteRoute(tripId: tripId);
  }
}
