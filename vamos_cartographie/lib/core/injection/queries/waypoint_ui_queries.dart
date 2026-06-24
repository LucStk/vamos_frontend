import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/stores/waypoint_store.dart';
import '/features/features.dart';

part 'waypoint_ui_queries.g.dart';

@riverpod
WaypointUi? waypointUi(Ref ref, WaypointUiId id) {
  final waypointStore = ref.watch(waypointStoreProvider);
  final w = waypointStore.get(id as WaypointId);
  return (w != null) ? WaypointUi(w) : null;
}
