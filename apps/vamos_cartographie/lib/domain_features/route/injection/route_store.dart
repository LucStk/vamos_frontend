import "package:domain_core/domain_core.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_application/trip_application.dart";
import "package:vamos_cartographie/core/injection/client_provider.dart";
import "package:vamos_cartographie/core/injection/error_logger.dart";
import "package:vamos_cartographie/core/injection/mutation_queue_provider.dart";
import "package:vamos_cartographie/domain_features/route/data/route_remote_datasource.dart";
import "package:vamos_cartographie/domain_features/route/data/route_repository_impl.dart";

part "route_store.g.dart";

@Riverpod(keepAlive: true)
RouteRemoteDatasource routeRemoteDatasource(Ref ref) {
  return RouteRemoteDatasource(ref.watch(clientProvider));
}

@Riverpod(keepAlive: true)
RouteRepository routeRepository(Ref ref) {
  return RouteRepositoryImpl(ref.watch(routeRemoteDatasourceProvider));
}

@Riverpod(keepAlive: true)
class RouteStoreNotifier extends _$RouteStoreNotifier
    with OptimisticRunner<RouteStore>, RouteEditor {
  @override
  RouteStore build(TripId tripId) => RouteStore.empty();

  // Méthode publique dédiée à l'écriture externe contrôlée
  void updateState(RouteStore value) {
    state = value; // ici, state = est légal car on est DANS la classe Notifier
  }

  // Injection des dépendances requises par le mixin TopologyHandler
  @override
  RouteRepository get routeRepo => ref.read(routeRepositoryProvider);

  @override
  MutationQueue get mutationQueue => ref.read(mutationQueueProvider);

  @override
  ErrorLogger? get errorLogger => ref.read(errorLoggerProvider);

  void emit(RouteStore newGraphStore) {
    state = newGraphStore;
  }

  void patchRoute(RoutePatchModel value) => state = state.patchRoute(value);

  void rollbackRoute() => state = state.rollbackRoute();
}

@Riverpod(keepAlive: true)
Map<SectionId, VertexRange> sectionRanges(Ref ref, TripId tripId) {
  final store = ref.watch(routeStoreProvider(tripId));
  final route = store.route?.current;
  if (route == null) return const {};

  return computeSectionRanges(
    store.sectionStore.store.values.map((n) => n.current),
    route.geometry.length,
  );
}
