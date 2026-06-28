/// Infrastructure partagée pour les tests de la feature `trips`.
///
/// Importer ce fichier depuis chaque fichier de test de la feature :
/// ```dart
/// import '../helpers/trip_test_helpers.dart';
/// ```
library trip_test_helpers;

import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_application/media_application.dart';
import 'package:trip_domain/trip_domain.dart';

import 'package:vamos_cartographie/core/injection/commands/media_provider.dart';
import 'package:vamos_cartographie/core/injection/commands/trip_provider.dart';
import 'package:vamos_cartographie/core/injection/queries/media_ui_queries.dart';
import 'package:vamos_cartographie/core/injection/stores/trip_store.dart';
import 'package:vamos_cartographie/features/trips/screens/explorer_page.dart';

// ---------------------------------------------------------------------------
// Fakes
// ---------------------------------------------------------------------------

/// Simule [TripHandler] sans dépendances réseau.
/// Toutes les mutations sont répercutées directement sur [store].
/// Chaque méthode peut être surchargée via un hook optionnel (`xxxFn`).
class FakeTripHandler extends Fake implements TripHandler {
  final ObservableTripStore store;

  Future<Either<Failure, Trip>> Function()? createBlankTripFn;
  Future<Either<Failure, Trip>> Function(Trip)? updateTripFn;
  Future<Either<Failure, void>> Function(Id<Trip>)? deleteTripFn;

  int createCalls = 0;
  Trip? lastUpdated;
  Id<Trip>? lastDeleted;

  int _nextId = 100;

  FakeTripHandler(this.store);

  @override
  Future<Either<Failure, void>> loadFromRemote() async => const Right(null);

  @override
  Future<Either<Failure, Trip>> createBlankTrip() async {
    createCalls++;
    if (createBlankTripFn != null) return await createBlankTripFn!();
    final trip = Trip(id: Id<Trip>(_nextId++), title: '');
    store.upsert(trip);
    return Right(trip);
  }

  @override
  Future<Either<Failure, Trip>> updateTrip(Trip trip) async {
    lastUpdated = trip;
    if (updateTripFn != null) return await updateTripFn!(trip);
    store.upsert(trip);
    return Right(trip);
  }

  @override
  Future<Either<Failure, void>> deleteTrip(Id<Trip> id) async {
    lastDeleted = id;
    if (deleteTripFn != null) return deleteTripFn!(id);
    store.remove(id);
    return Right(null);
  }
}

/// Simule [MediaHandler] en enregistrant les appels sans réseau.
class FakeMediaHandler extends Fake implements MediaHandler {
  final List<({dynamic id, FileKey key})> removeCalls = [];
  final List<({dynamic id, PatchImageMedia patch})> addCalls = [];

  @override
  Future<Either<Failure, void>> removeImage<T>(
    Id<T> id,
    FileKey key,
    MediaOwnerType ownerType,
  ) async {
    removeCalls.add((id: id, key: key));
    return Right(null);
  }

  @override
  Future<Either<Failure, void>> uploadPatchImage<T>(
    Id<T> id,
    PatchImageMedia patch,
    MediaOwnerType ownerType,
  ) async {
    addCalls.add((id: id, patch: patch));
    return Right(null);
  }

  @override
  ObservableMediaPatchStore get patchStore => ObservableMediaPatchStore();

  @override
  OptimisticExecutor get executor => OptimisticExecutor();
}

// ---------------------------------------------------------------------------
// Factories
// ---------------------------------------------------------------------------

Trip makeTrip({int id = 1, String title = 'Voyage test', String desc = ''}) =>
    Trip(id: Id<Trip>(id), title: title, description: desc);

ImageUiModel makeImageUiModel({
  String key = 'key-1',
  String url = 'https://example.com/img.jpg',
}) => ImageUiModel(
  fileKey: FileKey(key),
  imageLocation: RemoteUrl(Url(url)),
  uploadStatus: UploadStatus.success,
);

// ---------------------------------------------------------------------------
// Builder de widget de test
// ---------------------------------------------------------------------------

/// Construit l'arbre complet `ProviderScope → MaterialApp → ExplorerPage`
/// avec les overrides minimaux nécessaires pour que la page s'affiche.
///
/// Paramètres optionnels :
/// - [loadTripsOverride] : contrôle l'état du chargement initial
/// - [imagesOverride]    : contrôle les images retournées par le carousel
Widget buildExplorerApp({
  required ObservableTripStore tripStore,
  required FakeTripHandler fakeTripHandler,
  required FakeMediaHandler fakeMediaHandler,
  Future<void> Function(Ref ref)? loadTripsOverride,
  List<ImageUiModel> Function(Ref, Id)? imagesOverride,
}) {
  return ProviderScope(
    overrides: [
      loadTripsProvider.overrideWith(
        loadTripsOverride ?? (ref) => Future<void>.value(),
      ),
      rawTripStoreProvider.overrideWith((ref) => tripStore),
      tripHandlerProvider.overrideWith((ref) => fakeTripHandler),
      mediaHandlerProvider.overrideWith((ref) => fakeMediaHandler),
      visibleImagesProvider.overrideWith(imagesOverride ?? (ref, id) => []),
    ],
    child: const MaterialApp(home: ExplorerPage()),
  );
}

// ---------------------------------------------------------------------------
// Helpers de timing pour les dialogues
// ---------------------------------------------------------------------------

/// Laisse l'animation d'entrée du [DialogRoute] se terminer.
///
/// On utilise `pump(500ms)` plutôt que `pumpAndSettle()` pour éviter que
/// des timers internes de Riverpod (invalidateSelf) ne provoquent une boucle
/// infinie dans `pumpAndSettle`.
Future<void> openDialog(WidgetTester tester) =>
    tester.pump(const Duration(milliseconds: 500));

/// Attend que la propagation Riverpod (invalidateSelf → rebuild) soit
/// effective. Riverpod 3.x traite `invalidateSelf` en deux frames.
Future<void> pumpRiverpod(WidgetTester tester) async {
  await tester.pump();
  await tester.pump();
}
