import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/scene/items/trip/trip_origin_item.dart';

part 'trip_origin_item_provider.g.dart';

@Riverpod(keepAlive: true)
TripOriginItem? tripOriginItem(
  Ref ref,
  MapRouteOrigin o,
  MapCameraReader camera,
) {
  final worldPosition = switch (o) {
    MapTripOrigin t => ref.watch(
      routeStoreProvider(t.tripId).select((s) {
        final origin = s.route?.current.startPoint;
        return origin == null ? null : camera.latLngToWorldOffset(origin);
      }),
    ),
    MapTmpOrigin _ => ref.watch(
      modeStateProvider.select((s) => s.slots.get(tripOriginSlot)?.point),
    ),
  };

  if (worldPosition == null) return null;
  return TripOriginItem(object: o, worldPosition: worldPosition);
}
