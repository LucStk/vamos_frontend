import "package:domain_core/domain_core.dart";
import "package:map_engine/map_engine.dart";
import "package:riverpod/riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_application/trip_application.dart";
import "package:vamos_cartographie/domain_features/route/injection/route_store.dart";

part "route_polyline_provider.g.dart";

@Riverpod(keepAlive: true)
RoutePolyline? routePolyline(Ref ref, TripId tripId, MapCameraReader camera) {
  final geometry = ref.watch(
    routeStoreProvider(tripId).select((s) => s.route?.current.geometry),
  );
  if (geometry == null || geometry.length < 2) return null;
  final listWo = geometry.map((m) => camera.latLngToWorldOffset(m)).toList();
  return RoutePolyline(listWo);
}
