// features/waypoints/presentation/providers/waypoints_notifier.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/waypoints/data/data.dart';
import "package:vamos_cartographie/core/injection/client_provider.dart";
part "waypoints_providers.g.dart";

@riverpod
WaypointRemoteDatasource waypointRemoteDatasource(Ref ref) {
  return WaypointRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
WaypointRepository waypointRepository(Ref ref) {
  return WaypointRepository(ref.watch(waypointRemoteDatasourceProvider));
}
