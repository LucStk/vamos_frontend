import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/map/objects/route/selection_handle/selection_handle_item.dart';
import 'package:vamos_cartographie/map/objects/route/trip_start/trip_start_item.dart';

part 'selection_handle_provider.g.dart';

@Riverpod(keepAlive: true)
SelectionHandleItem? selectionHandleItem(
  Ref ref,
  TripId tripId,
  MapCameraReader camera,
) {
  final worldPosition = ref.watch(
    slot(tripId).select((s) {
      final origin = s.route?.current.startPoint;
      return origin == null ? null : camera.latLngToWorldOffset(origin);
    }),
  );
  if (worldPosition == null) return null;
  return TripStartItem<MapTripStart>(
    object: MapTripStart(tripId),
    worldPosition: worldPosition,
  );
}
