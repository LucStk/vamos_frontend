import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/providers/waypoint_store.dart';

part 'waypoint_ui_queries.g.dart';

@riverpod
Waypoint? waypointUi(Ref ref, WaypointId id) {
  final waypointStore = ref.watch(waypointStoreProvider);
  return waypointStore.get(id);
}
