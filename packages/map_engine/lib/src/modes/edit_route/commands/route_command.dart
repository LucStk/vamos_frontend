import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';

import 'package:map_engine/src/domain/domain.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/edit_route/slots/sketch_trace.dart';
import 'package:trip_application/trip_application.dart';

extension ListWorldOffsetToListLatLng on List<WorldOffset> {
  List<LatLng> toLatLngList(MapCameraReader camera) =>
      map(camera.worldOffsetToLatLng).toList();
}

sealed class RouteCommand<R extends Object> extends Command<R> {
  const RouteCommand();
}

final class EditRoute extends RouteCommand<Either<Failure, EditRoutePayload>> {
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
