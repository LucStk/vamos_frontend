import 'package:domain_core/domain_core.dart';

import 'package:map_engine/src/domain/domain.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';

extension ListWorldOffsetToListLatLng on List<WorldOffset> {
  List<LatLng> toLatLngList(MapCameraReader camera) =>
      map(camera.worldOffsetToLatLng).toList();
}

sealed class RouteCommand<R extends Object> extends Command<R> {
  const RouteCommand();
}

final class TrimRoute extends RouteCommand {
  const TrimRoute({required this.tripId, required this.position});
  final OffsetType position;
  final TripId tripId;

  @override
  Future<WaypointId?> handle(AppCommandScope h) {
    final latLng = switch (position) {
      WorldOffset d => h.camera.worldOffsetToLatLng(d),
      ScreenOffset d => h.camera.screenOffsetToLatLng(d),
    };
    return valueOrNull(
      h
          .forTrip(tripId)
          .waypointEditor
          .createBlankWaypoint(latLng)
          .then((r) => r.map((v) => v.id)), // Either<Failure, WaypointId>
    );
  }
}
