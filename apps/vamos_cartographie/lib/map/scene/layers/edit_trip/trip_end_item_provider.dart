import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/map/scene/items/trip/trip_end_item.dart';

part 'trip_end_item_provider.g.dart';

@Riverpod(keepAlive: true)
TripEndItem? tripEndItem(Ref ref, TripId tripId, MapCameraReader camera) {
  final geometry = ref.watch(
    routeStoreProvider(tripId).select((s) => s.route?.current.geometry),
  );
  if (geometry == null || geometry.isEmpty) return null;
  final wOffset = camera.latLngToWorldOffset(geometry.last);
  return TripEndItem(object: MapTripOrigin(), worldPosition: wOffset);
}
