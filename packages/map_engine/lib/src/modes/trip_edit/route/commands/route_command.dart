import 'package:domain_core/domain_core.dart';

import 'package:map_engine/src/domain/domain.dart';
import 'package:latlong2/latlong.dart';
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

final class TrimRoute extends RouteCommand {
  const TrimRoute({required this.tripId, required this.end, required this.at});
  final TripId tripId;
  final RouteEnd end;
  final double at;

  @override
  Future<WaypointId?> handle(AppCommandScope h) {
    return valueOrNull(
      h
          .forTrip(tripId)
          .routeEditor
          .createBlankWaypoint(latLng)
          .then((r) => r.map((v) => v.id)), // Either<Failure, WaypointId>
    );
  }
}
