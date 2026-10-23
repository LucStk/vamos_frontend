import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/map/scene/items/trip/trip_origin_item.dart';

part 'trip_origin_item_provider.g.dart';

@Riverpod(keepAlive: true)
TripOriginItem? tripOriginItem(Ref ref, TripId tripId, MapCameraReader camera) {
  final origin = ref.watch(
    routeStoreProvider(tripId).select((s) => s.route?.current.startPoint),
  );
  if (origin == null) return null;
  final wOffset = camera.latLngToWorldOffset(origin);
  return TripOriginItem(object: MapTripOrigin(), worldPosition: wOffset);
}
