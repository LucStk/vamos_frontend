import "waypoint_remote_datasource.dart";
import "waypoint_repository.dart";
import "package:riverpod/riverpod.dart";
import "package:vamos_cartographie/core/injection/client_provider.dart";

final waypointRemoteDatasourceProvider = Provider<WaypointRemoteDatasource>((
  ref,
) {
  return WaypointRemoteDatasource(ref.watch(clientProvider));
});

final waypointRepositoryProvider = Provider<WaypointRepository>((ref) {
  return WaypointRepository(ref.watch(waypointRemoteDatasourceProvider));
});
