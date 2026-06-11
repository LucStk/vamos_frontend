// features/waypoints/presentation/providers/waypoints_notifier.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/graph/graph.dart';
import 'package:vamos_cartographie/features/graph/store/graph_store.dart';
import 'package:vamos_cartographie/features/waypoints/data/data.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import "package:riverpod/riverpod.dart";
import "package:vamos_cartographie/core/injection/client_provider.dart";
part "waypoints_providers.dart";

@riverpod
WaypointRemoteDatasource waypointRemoteDatasource(Ref ref) {
  return WaypointRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
WaypointRepository waypointRepository(Ref ref) {
  return WaypointRepository(ref.watch(waypointRemoteDatasourceProvider));
}
