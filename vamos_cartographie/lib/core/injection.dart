import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:api_client/api_client.dart';
import 'package:vamos_cartographie/core/config.dart';
import 'package:vamos_cartographie/repository/mock_trip_repository.dart';
import 'package:vamos_cartographie/repository/real_trip_repository.dart';
import 'package:vamos_cartographie/repository/trip_repository.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  if (kUseMock) {
    // Mode mock : pas de réseau, données en mémoire
    getIt.registerLazySingleton<TripRepository>(() => MockTripRepository());
  } else {
    // Mode production : vrai backend GraphQL
    final client = initFerryClient('http://localhost:8000/graphql/');
    getIt.registerLazySingleton<Client>(() => client);
    getIt.registerLazySingleton<TripRepository>(
      () => RealTripRepository(getIt<Client>()),
    );
  }
}
