import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:api_client/api_client.dart';
import 'package:vamos_cartographie/core/config.dart';
import 'package:vamos_cartographie/repository/mock_trip_repository.dart';
import 'package:vamos_cartographie/repository/real_trip_repository.dart';
import 'package:vamos_cartographie/repository/trip_repository.dart';

final getIt = GetIt.instance;

/// Initialise les dépendances de vamos_cartographie.
///
/// [client] : le client Ferry à utiliser pour les requêtes GraphQL.
/// S'il est null et que kUseMock est false, un client par défaut est créé
/// (utile pour lancer vamos_cartographie en standalone).
Future<void> configureDependencies({Client? client}) async {
  if (kUseMock) {
    // Mode mock : pas de réseau, données en mémoire
    getIt.registerLazySingleton<TripRepository>(() => MockTripRepository());
  } else {
    // Mode production : client fourni par l'appelant, ou client par défaut
    final ferryClient =
        client ?? initFerryClient('http://localhost:8000/graphql/');
    getIt.registerLazySingleton<Client>(() => ferryClient);
    getIt.registerLazySingleton<TripRepository>(
      () => RealTripRepository(getIt<Client>()),
    );
  }
}
