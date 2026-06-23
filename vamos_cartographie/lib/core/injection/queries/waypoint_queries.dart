import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/stores/waypoint_store.dart';

part 'waypoint_queries.g.dart';

@riverpod
Waypoint? waypoint(Ref ref, WaypointId id) {
  final asyncTrips = ref.watch(waypointStoreProvider);
  return asyncTrips.value?[id];
}
