import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/map/modes/shared/scene/trip_origin_item.dart';

part 'trip_origin_item_provider.g.dart';

@Riverpod(keepAlive: true)
TripOriginItem? tripOriginItem(Ref ref, TripId tripId, MapCameraReader camera) {
  final worldPosition = ref.watch(
    routeStoreProvider(tripId).select((s) {
      final origin = s.route?.current.startPoint;
      return origin == null ? null : camera.latLngToWorldOffset(origin);
    }),
  );
  if (worldPosition == null) return null;
  return TripOriginItem<MapTripOrigin>(
    object: MapTripOrigin(tripId),
    worldPosition: worldPosition,
  );
}
