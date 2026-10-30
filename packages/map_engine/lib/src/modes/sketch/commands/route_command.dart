import 'package:dartz/dartz.dart';
import 'package:domain_core/failures.dart';
import 'package:domain_core/space/offset_type.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/src/domain/camera/map_camera.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/sketch/slots/sketch_trace.dart';
import 'package:trip_application/trip_application.dart';

extension ListWorldOffsetToListLatLng on List<WorldOffset> {
  List<LatLng> toLatLngList(MapCameraReader camera) =>
      map(camera.worldOffsetToLatLng).toList();
}

sealed class RouteCommand<R extends Object> extends Command<R> {
  const RouteCommand();
}

final class EditRoute extends RouteCommand<Either<Failure, EditRoutePayload>> {
  const EditRoute({required this.tripId, required this.sketch});
  final TripId tripId;
  final SketchTrace sketch;

  @override
  Future<Either<Failure, EditRoutePayload>> handle(AppCommandScope h) async {
    final geometry = sketch.points.toLatLngList(h.camera);

    final startHit = sketch.startAnchor.hit;
    final startAnchor = startHit.object.toRouteAnchor(
      h.camera.worldOffsetToLatLng(startHit.point),
    );

    final endHit = sketch.endAnchor?.hit;
    final endAnchor = endHit?.object.toRouteAnchor(
      h.camera.worldOffsetToLatLng(endHit.point),
    );

    return h
        .forTrip(tripId)
        .routeEditor
        .editRoute(
          geometry: geometry,
          mobilityType: sketch.mobilityType,
          startAnchor: startAnchor,
          endAnchor: endAnchor,
        );
  }
}
