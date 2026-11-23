import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';

import 'package:map_engine/src/domain/domain.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/src/geometry/polyline_dist.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/trip_edit/route/trim_route_mode.dart';
import 'package:trip_application/trip_application.dart';

extension ListWorldOffsetToListLatLng on List<WorldOffset> {
  List<LatLng> toLatLngList(MapCameraReader camera) =>
      map(camera.worldOffsetToLatLng).toList();
}

sealed class RouteCommand<R extends Object> extends Command<R> {
  const RouteCommand();
}

/// Raccourcit la route depuis l'extrémité [end] jusqu'à la position [at]
/// (repère de `RouteHitDetail.position`). Le serveur attend une longueur en
/// mètres : elle est calculée ici, sur la géométrie que le client affiche.
final class TrimRoute
    extends RouteCommand<Either<Failure, EditRoutePayload>> {
  const TrimRoute({required this.tripId, required this.end, required this.at});
  final TripId tripId;
  final RouteEnd end;
  final double at;

  @override
  Future<Either<Failure, EditRoutePayload>> handle(AppCommandScope h) {
    final trip = h.forTrip(tripId);
    // TrimRouteMode ne s'ouvre qu'en saisissant une extrémité de la route.
    final geometry = trip.route!.geometry;
    final (anchor, endPosition) = switch (end) {
      RouteEnd.start => (const StartRouteAnchor(), 0.0),
      RouteEnd.end => (const EndRouteAnchor(), geometry.length - 1.0),
    };
    return trip.routeEditor.trimRoute(
      end: anchor,
      lengthM: lengthBetweenPositionsM(geometry, endPosition, at),
    );
  }
}
