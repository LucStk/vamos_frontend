import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:api_client/api_client.dart';
import 'package:vamos_cartographie/core/config.dart';
import 'package:vamos_cartographie/data/datasources/trip_remote_datasource.dart';
import 'package:vamos_cartographie/data/repositories/repositories.dart';
import 'package:vamos_cartographie/mocks/mock_trip_repository.dart';
import 'package:vamos_cartographie/mocks/mock_upload_img_repository.dart';

final getIt = GetIt.instance;

/// Initialise les dépendances de vamos_cartographie.
///
/// [client] : le client Ferry à utiliser pour les requêtes GraphQL.
/// S'il est null et que kUseMock est false, un client par défaut est créé
/// (utile pour lancer vamos_cartographie en standalone).
Future<void> configureDependencies({Client? client}) async {
  if (kUseMock) {
    // Mode mock : pas de réseau, données en mémoire
    getIt.registerLazySingleton<ITripRepository>(() => MockTripRepository());
    getIt.registerLazySingleton<UploadImgRepository>(
      () => MockUploadImgRepository(),
    );
    // getIt.registerLazySingleton<AppConfig>(
    // () => const AppConfig(imageBaseUrl: "https://picsum.photos/seed/"),
    // );
  } else {
    // Mode production : client fourni par l'appelant, ou client par défaut
    final ferryClient =
        client ?? initFerryClient('http://localhost:8000/graphql/');
    getIt.registerLazySingleton<Client>(() => ferryClient);
    getIt.registerLazySingleton<TripRemoteDatasource>(
      () => TripRemoteDatasource(getIt<Client>()),
    );
    getIt.registerLazySingleton<UploadImgRepository>(
      () => UploadImgRepository(getIt<Client>()),
    );
    getIt.registerLazySingleton<ITripRepository>(
      () => TripRepository(
        getIt<TripRemoteDatasource>(),
        getIt<UploadImgRepository>(),
      ),
    );
    // getIt.registerLazySingleton<AppConfig>(
    //   () => const AppConfig(imageBaseUrl: ""),
    // );
  }
}
