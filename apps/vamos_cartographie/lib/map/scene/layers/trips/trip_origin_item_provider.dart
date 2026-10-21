import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/scene/items/trip/trip_origin_item.dart';

part 'trip_origin_item_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
TripOriginItem? tripOriginItem(Ref ref, MapCameraReader camera) {
  final origin = ref.watch(
    modeStateProvider.select((m) => m.slots.get(tripOriginSlot)),
  );
  return (origin == null)
      ? null
      : TripOriginItem(object: MapTripOrigin(), worldPosition: origin.point);
}
