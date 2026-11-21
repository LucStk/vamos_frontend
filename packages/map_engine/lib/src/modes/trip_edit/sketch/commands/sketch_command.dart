import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';

import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/trip_edit/route/commands/route_command.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/slots/sketch_trace.dart';
import 'package:trip_application/trip_application.dart';

sealed class SketchCommand<R extends Object> extends Command<R> {
  const SketchCommand();
}

final class EditRoute extends SketchCommand<Either<Failure, EditRoutePayload>> {
  const EditRoute({
    required this.tripId,
    required this.mobilityType,
    required this.sketch,
  });
  final TripId tripId;
  final MobilityType mobilityType;
  final SketchTrace sketch;

  @override
  Future<Either<Failure, EditRoutePayload>> handle(AppCommandScope h) async => h
      .forTrip(tripId)
      .routeEditor
      .editRoute(
        geometry: sketch.points.toLatLngList(h.camera),
        mobilityType: mobilityType,
        startAnchor: sketch.startAnchor.toRouteAnchor(h.camera),
        endAnchor: sketch.endAnchor?.toRouteAnchor(h.camera),
      );
}
