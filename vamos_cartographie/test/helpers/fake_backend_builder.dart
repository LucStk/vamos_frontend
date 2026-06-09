import 'package:ferry/ferry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/injection/client_provider.dart';
import 'package:vamos_cartographie/dev_backend/core/fake_graphql_store.dart';
import 'package:vamos_cartographie/dev_backend/core/fake_seeds.dart';
import 'package:vamos_cartographie/dev_backend/transport/fake_link.dart';
import 'package:vamos_cartographie/features/trips/data/trip_remote_datasource.dart';
import 'package:vamos_cartographie/features/trips/data/trip_repository.dart';
import 'package:vamos_cartographie/features/waypoints/data/waypoint_remote_datasource.dart';
import 'package:vamos_cartographie/features/waypoints/data/waypoint_repository.dart';

/// Contexte complet du fake backend exposant le [Client] Ferry et le
/// [FakeGraphQLStore] sous-jacent (utile pour injecter des pannes dans les tests
/// de rollback).
typedef FakeBackend = ({Client client, FakeGraphQLStore store});

/// Construit un [Client] Ferry backed par un [FakeGraphQLStore] in-memory.
FakeBackend buildFakeBackend(List<Seed> seeds) {
  final store = FakeGraphQLStore(seeds);
  final link = FakeGraphQLLink(store);
  final client = Client(link: link);
  return (client: client, store: store);
}

/// Construit un [ProviderContainer] Riverpod avec le fake client injecté.
/// À disposer dans [tearDown].
ProviderContainer buildContainer(List<Seed> seeds, {FakeBackend? backend}) {
  final b = backend ?? buildFakeBackend(seeds);
  return ProviderContainer(
    overrides: [clientProvider.overrideWithValue(b.client)],
  );
}

/// Construit un [TripRepository] directement connecté au fake backend.
/// Retourne aussi le store pour les tests de rollback.
({TripRepository repo, FakeGraphQLStore store}) buildTripRepo(
  List<Seed> seeds,
) {
  final (:client, :store) = buildFakeBackend(seeds);
  final repo = TripRepository(TripRemoteDatasource(client));
  return (repo: repo, store: store);
}

/// Construit un [WaypointRepository] directement connecté au fake backend.
({WaypointRepository repo, FakeGraphQLStore store}) buildWaypointRepo(
  List<Seed> seeds,
) {
  final (:client, :store) = buildFakeBackend(seeds);
  final repo = WaypointRepository(WaypointRemoteDatasource(client));
  return (repo: repo, store: store);
}
