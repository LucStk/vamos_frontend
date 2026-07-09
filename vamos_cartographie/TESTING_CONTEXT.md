# Contexte de génération de tests — `vamos_cartographie`

## À lire en premier

Ce fichier est un contexte persistant à fournir à un LLM avant toute demande de génération de tests sur le projet `vamos_cartographie`. Il décrit l'architecture, les conventions attendues, et les instructions par type de test.

---

## Architecture du projet

Le projet suit une **Clean Architecture** organisée en deux niveaux :

### Packages internes (`lib/packages/`)

Contiennent la logique métier pure, indépendante de Flutter :

| Package | Rôle |
|---|---|
| `domain_core` | Primitives partagées : `Id`, `Geometry`, `Observable`, `CollectionStore`, `OptimisticExecutor` |
| `trip_application` | Entités `Trip`, `Waypoint`, `Segment`, `Vertex` + repositories (ports) + stores runtime |
| `topology_application` | Logique de dessin de graphe topologique, calcul de géométrie, mutation queue |
| `media_application` | Gestion du cycle de vie des images (upload, patch, statuts) |
| `waypoint_application` | (en cours) Application layer pour les waypoints |

### Application principale (`lib/`)

```
lib/
├── backend/          # Couche réseau : client Ferry (GraphQL) + requêtes générées
├── core/             # Config, injection (Riverpod), stores observables, providers
├── features/         # UI par feature (map_ui, map_application, trips, waypoint, carousel)
├── infrastructure/   # Implémentations des repositories (datasources, mappers)
└── packages/         # Packages internes (voir ci-dessus)
```

### Séparation `features/` vs `packages/`

- **`packages/`** : logique pure, pas de Flutter, testable unitairement sans contexte UI.
- **`features/`** : UI, state management Riverpod, widgets. Dépend des packages.

---

## Stack technique

- **Flutter** (Dart)
- **State management** : Riverpod (`@riverpod`, providers générés via `build_runner`)
- **GraphQL** : Ferry client, schéma généré (`__generated__/`)
- **Immutabilité** : `freezed` (`.freezed.dart`)
- **DI** : Riverpod + `ProviderContainer` pour les tests
- **Framework de test** : non encore fixé — **utiliser `flutter_test` + `mocktail`** (préféré pour sa compatibilité null-safety et l'absence de `build_runner` pour les mocks)

---

## Conventions de génération de tests

### Règles générales

1. **Un fichier de test par fichier source**, miroir de la structure `lib/` dans `test/`.
   - Ex : `lib/packages/trip_application/lib/domain/entities/trip.dart` → `test/packages/trip_application/domain/entities/trip_test.dart`
2. **Nommer les groupes** avec `group('NomDeLaClasse', () { ... })`.
3. **Nommer les cas** de façon descriptive en français ou en anglais, de manière cohérente dans un même fichier.
4. **Arrange / Act / Assert** : séparer les trois phases par une ligne vide et un commentaire `// arrange`, `// act`, `// assert`.
5. **Ne pas tester le code généré** (`*.freezed.dart`, `*.g.dart`, `*.ast.gql.dart`, etc.).
6. **Ne pas importer** les fichiers `__generated__/` directement dans les tests.

### Mocks avec `mocktail`

```dart
import 'package:mocktail/mocktail.dart';

class MockTripRepository extends Mock implements TripRepository {}
class MockVertexRepository extends Mock implements VertexRepository {}

// Enregistrer les fallback values pour les types custom
setUpAll(() {
  registerFallbackValue(TripId('fallback'));
});
```

---

## Tests unitaires (domain / application)

### Cibles prioritaires

- Entités et value objects dans `packages/*/lib/domain/`
- Handlers et commands dans `packages/*/lib/application/commands/`
- Stores runtime dans `packages/*/lib/runtime/`
- Mappers dans `lib/infrastructure/*/mappers/`
- Reducers dans `lib/features/map_application/reducers/`

### Template

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trip_application/domain/entities/trip.dart';
import 'package:trip_application/application/repositories/trip_repository.dart';
import 'package:trip_application/application/commands/trip_handler.dart';

class MockTripRepository extends Mock implements TripRepository {}

void main() {
  late MockTripRepository mockRepo;
  late TripHandler handler;

  setUp(() {
    mockRepo = MockTripRepository();
    handler = TripHandler(repository: mockRepo);
  });

  group('TripHandler', () {
    test('createTrip retourne un Trip valide quand le repository réussit', () async {
      // arrange
      final draft = TripDraft(name: 'Test', date: DateTime(2024));
      when(() => mockRepo.create(draft)).thenAnswer((_) async => Trip(id: TripId('1'), name: 'Test'));

      // act
      final result = await handler.createTrip(draft);

      // assert
      expect(result.isRight(), true);
      verify(() => mockRepo.create(draft)).called(1);
    });

    test('createTrip retourne une Failure quand le repository échoue', () async {
      // arrange
      final draft = TripDraft(name: 'Test', date: DateTime(2024));
      when(() => mockRepo.create(draft)).thenThrow(Exception('network error'));

      // act
      final result = await handler.createTrip(draft);

      // assert
      expect(result.isLeft(), true);
    });
  });
}
```

### Points d'attention domaine

- Les entités utilisent `freezed` : tester `copyWith`, l'égalité structurelle (`==`), et `hashCode`.
- `OptimisticExecutor` dans `domain_core` : tester la cohérence optimiste (rollback en cas d'erreur).
- `ObservableCollectionStore` : tester que les listeners sont bien notifiés après mutation.
- Reducers (`map_application/reducers/`) : tester chaque transition d'état (event → nouveau state).

---

## Tests d'intégration

### Cibles prioritaires

- Flux complets via Riverpod : provider → store → repository mock
- Scénarios utilisateur clés : créer un trip, dessiner un segment, ajouter un waypoint

### Setup avec `ProviderContainer`

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  test('flux création de trip complet', () async {
    // arrange
    final mockRepo = MockTripRepository();
    when(() => mockRepo.create(any())).thenAnswer((_) async => fakeTrip);

    final container = ProviderContainer(
      overrides: [
        tripRepositoryProvider.overrideWithValue(mockRepo),
      ],
    );
    addTearDown(container.dispose);

    // act
    final handler = container.read(tripHandlerProvider);
    final result = await handler.createTrip(fakeDraft);

    // assert
    expect(result.isRight(), true);
    final store = container.read(tripStoreProvider);
    expect(store.items, contains(fakeTrip));
  });
}
```

### Scénarios à couvrir en priorité

| Scénario | Providers impliqués |
|---|---|
| Créer un trip | `tripHandlerProvider` → `tripStoreProvider` |
| Ajouter un waypoint à un trip | `waypointHandlerProvider` → `waypointStoreProvider` |
| Dessiner un segment (vertex → segment) | `topologyHandlerProvider` → `graphStoreProvider` |
| Upload d'une image | `mediaHandlerProvider` → `mediaStoreProvider` |
| Transitions du map editor (idle → drawing → idle) | `mapCtrlProvider` + reducers |

---

## Tests de widgets

### Cibles prioritaires

- Dialogs : `TripCreatorDialog`, `TripEditorDialog`, `CreateWaypointDialog`, `SegmentViewerDialog`
- Widgets composites : `TripCard`, `CarouselView`, `MapEditToolbar`
- Boutons d'action : `StartSegmentButton`, `EndSegmentButton`, `CreateWaypointButton`

### Template

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  testWidgets('TripCard affiche le nom du trip', (tester) async {
    // arrange
    final trip = TripUi(id: TripId('1'), name: 'Mon voyage', date: DateTime(2024));

    // act
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: TripCard(trip: trip)),
        ),
      ),
    );

    // assert
    expect(find.text('Mon voyage'), findsOneWidget);
  });

  testWidgets('TripCreatorDialog appelle onCreate à la soumission', (tester) async {
    // arrange
    var called = false;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [tripHandlerProvider.overrideWith((_) => MockTripHandler())],
        child: MaterialApp(
          home: Scaffold(body: TripCreatorDialog(onCreated: (_) => called = true)),
        ),
      ),
    );

    // act
    await tester.enterText(find.byType(TextField).first, 'Nouveau trip');
    await tester.tap(find.byType(ConfirmButton));
    await tester.pumpAndSettle();

    // assert
    expect(called, true);
  });
}
```

### Points d'attention UI

- Toujours wrapper avec `ProviderScope` + overrides des providers nécessaires.
- Utiliser `pumpAndSettle()` pour les animations et les futures.
- Pour les dialogs : tester l'affichage initial, la validation du formulaire, et le callback de retour.
- `CarouselView` : tester les états `loading`, `error`, `empty`, et `populated`.

---

## Ce qu'il ne faut PAS générer

- Tests sur les fichiers `*.g.dart`, `*.freezed.dart`, `*.ast.gql.dart`, `*.data.gql.dart`
- Tests sur `ferry_client.dart` (dépendance réseau réelle)
- Tests sur `storage_datasource.dart` sans abstraction mockable préalable
- Tests de snapshot (trop fragiles sur ce type de projet cartographique)

---

## Exemple de prompt one-shot

Utiliser ce fichier comme contexte système, puis envoyer :

```
Voici le fichier source :

[coller le contenu du fichier source]

Génère les tests unitaires complets pour ce fichier en suivant les conventions du contexte.
Couvre les cas nominaux, les cas limites, et les cas d'erreur.
```
