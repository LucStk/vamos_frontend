import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/scene/trip_origin_item.dart';

part 'tmp_origin_item_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [modeSlot])
TripOriginItem? tmpOriginItem(Ref ref, MapCameraReader camera) {
  final worldPosition = ref.watch(modeSlotProvider(tripOriginSlot))?.point;

  if (worldPosition == null) return null;
  return TripOriginItem<MapTmpOrigin>(
    object: MapTmpOrigin(),
    worldPosition: worldPosition,
  );
}
