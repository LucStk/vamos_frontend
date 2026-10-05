import 'package:map_engine/application/map_command_resolver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
part 'map_command_resolver.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
MapCommandResolver mapCommandResolver(Ref ref, TripId tripId) {
  final graphEditor = ref.watch(graphStoreProvider(tripId).notifier);
  final waypointEditor = ref.watch(waypointStoreProvider(tripId).notifier);
  return MapCommandResolver(
    graphEditor: graphEditor,
    waypointEditor: waypointEditor,
  );
}
