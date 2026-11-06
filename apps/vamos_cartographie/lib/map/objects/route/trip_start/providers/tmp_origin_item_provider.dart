import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';
import 'package:vamos_cartographie/map/objects/route/trip_start/trip_start.dart';

part 'tmp_origin_item_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [modeSlot])
TripStartItem? tmpOriginItem(Ref ref, MapCameraReader camera) {
  final worldPosition = ref.watch(modeSlotProvider(tripOriginSlot))?.point;

  if (worldPosition == null) return null;
  return TripStartItem<MapTmpOrigin>(
    object: MapTmpOrigin(),
    worldPosition: worldPosition,
  );
}
