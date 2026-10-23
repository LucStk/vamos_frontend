import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/scene/items/trip/trip_origin_item.dart';

part 'trip_origin_item_provider.g.dart';

@Riverpod(keepAlive: true)
TripOriginItem? tripOriginItem(Ref ref, MapCameraReader camera) {
  final mode = ref.watch(modeStateProvider.select((s) => s.mode));

  final worldPosition = switch (mode) {
    CreateTripMode() => ref.watch(
      modeStateProvider.select((s) => s.slots.get(tripOriginSlot)?.point),
    ),
    TripMode() => ref.watch(
      routeStoreProvider(mode.tripId).select((s) {
        final origin = s.route?.current.startPoint;
        return origin == null ? null : camera.latLngToWorldOffset(origin);
      }),
    ),
    _ => null,
  };

  if (worldPosition == null) return null;

  return TripOriginItem(object: MapTripOrigin(), worldPosition: worldPosition);
}
