import "package:domain_core/domain_core.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_application/trip_application.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
import "package:vamos_cartographie/notification/injection/error_logger.dart";
import "package:vamos_cartographie/waypoint/data/waypoint_remote_datasource.dart";
import "package:vamos_cartographie/waypoint/data/waypoint_repository_impl.dart";
part "waypoint_store.g.dart";

@riverpod
WaypointRemoteDatasource waypointRemoteDatasource(Ref ref) {
  return WaypointRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
WaypointRepository waypointRepository(Ref ref) {
  return WaypointRepositoryImpl(ref.watch(waypointRemoteDatasourceProvider));
}

@Riverpod(keepAlive: true)
class WaypointStoreNotifier extends _$WaypointStoreNotifier
    with OptimisticRunner<WaypointStore>, WaypointEditor {
  @override
  WaypointStore build(TripId tripId) => WaypointStore.initial();

  // Injection des dépendances requises par le mixin TopologyHandler
  @override
  WaypointRepository get waypointRepo => ref.read(waypointRepositoryProvider);

  @override
  MutationQueue get mutationQueue => ref.read(mutationQueueProvider);

  @override
  ErrorLogger? get errorLogger => ref.read(errorLoggerProvider);
}
