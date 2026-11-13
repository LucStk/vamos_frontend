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

/// La route d'un trip et tous ses calques, dans un seul état : les
/// `startIndex` des calques ne sont cohérents qu'avec la géométrie de la même
/// version (voir `RouteStore`).
@Riverpod(keepAlive: true)
class RouteStoreNotifier extends _$RouteStoreNotifier
    with OptimisticRunner<RouteStore>, RouteEditor {
  @override
  RouteStore build(TripId tripId) => RouteStore.empty();

  // Méthode publique dédiée à l'écriture externe contrôlée
  void updateState(RouteStore value) {
    state = value; // ici, state = est légal car on est DANS la classe Notifier
  }

  // Dépendances requises par le mixin RouteEditor
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

/// Vertex de début et de fin de chaque span du calque modalité.
@Riverpod(keepAlive: true)
Map<SpanId, VertexRange> mobilitySpanRanges(Ref ref, TripId tripId) {
  final store = ref.watch(routeStoreProvider(tripId));
  final route = store.route?.current;
  if (route == null) return const {};

  return computeSpanRanges(
    store.mobilitySpans.store.values.map((n) => n.current),
    route.geometry.length,
  );
}

/// Étendue de chaque span du calque modalité.
@Riverpod(keepAlive: true)
Map<SpanId, SpanExtent> mobilitySpanExtents(Ref ref, TripId tripId) {
  final store = ref.watch(routeStoreProvider(tripId));
  final route = store.route?.current;
  if (route == null) return const {};

  return computeSpanExtents(
    store.mobilitySpans.store.values.map((n) => n.current),
    route.geometry.length,
  );
}

/// Vertex de début et de fin de chaque span du calque d'édition.
@Riverpod(keepAlive: true)
Map<SpanId, VertexRange> editSpanRanges(Ref ref, TripId tripId) {
  final store = ref.watch(routeStoreProvider(tripId));
  final route = store.route?.current;
  if (route == null) return const {};

  return computeSpanRanges(store.editSpans, route.geometry.length);
}
