# vamos_frontend

Monorepo Flutter du projet **Vamos** — application de planification et visualisation de voyages itinérants.

---

## Structure du monorepo

```
vamos_frontend/
├── api_client/           # Package Dart — client GraphQL généré (Ferry)
├── vamos_cartographie/   # Package Flutter — module carte interactive
└── vamos_ui/             # Application Flutter principale (point d'entrée)
```

### Dépendances entre packages

```
vamos_ui
    └── vamos_cartographie  (path: ../vamos_cartographie)
            └── api_client  (path: ../api_client)
```

`vamos_ui` est l'application finale. Elle s'appuie sur `vamos_cartographie` pour tout ce qui concerne la carte, qui s'appuie lui-même sur `api_client` pour communiquer avec le backend GraphQL.

---

## Prérequis

| Outil | Version minimale |
|---|---|
| Flutter | 3.x (SDK Dart ^3.11.4) |
| Dart | ^3.11.4 |

---

## Installation

Un seul clone suffit pour tout récupérer :

```sh
git clone <url-du-repo> vamos_frontend
cd vamos_frontend
```

Puis installer les dépendances de chaque package dans l'ordre :

```sh
# 1. Le package de base (pas de dépendances locales)
cd api_client && dart pub get && cd ..

# 2. Le module cartographie
cd vamos_cartographie && flutter pub get && cd ..

# 3. L'application principale
cd vamos_ui && flutter pub get && cd ..
```

---

## Lancement

L'application se lance depuis `vamos_ui` :

```sh
cd vamos_ui
flutter run
```

### Mode mock (sans backend)

Par défaut, `vamos_cartographie` utilise des données fictives en mémoire — **aucun serveur requis**.

Le flag est dans `vamos_cartographie/lib/core/config.dart` :

```dart
const bool kUseMock = true;  // ← données fictives
```

### Mode production (avec le backend GraphQL)

1. Lance le backend sur `http://localhost:8000/graphql/`
2. Change le flag dans `vamos_cartographie/lib/core/config.dart` :

```dart
const bool kUseMock = false;  // ← vrai backend
```

---

## Packages

### `api_client`

Package Dart pur — contient le client Ferry et tout le code GraphQL généré automatiquement. Il ne doit jamais être modifié à la main dans `__generated__/`.

```
api_client/lib/src/graphql/
├── schema.graphql              # Schéma GraphQL du backend
├── fragments/trip.graphql      # Fragments réutilisables
├── queries/trip.graphql        # Queries : GetAllTrips, GetTrip
├── mutations/trip.graphql      # Mutations : CreateTrip, UpdateTrip, DeleteTrip
└── __generated__/              # ⚠️ Code généré — ne pas modifier
```

**Régénérer le code après un changement de schéma :**

```sh
cd api_client
dart run build_runner build --delete-conflicting-outputs
```

> Le générateur utilisé est `ferry_generator2`. La configuration est dans `build.yaml`.

---

### `vamos_cartographie`

Module Flutter de cartographie — carte interactive, création et édition de voyages.

```
vamos_cartographie/lib/
├── core/
│   ├── config.dart          # Flag kUseMock (mock vs production)
│   ├── failure.dart         # Types d'erreurs métier
│   └── injection.dart       # Injection de dépendances (GetIt)
├── repository/
│   ├── trip_repository.dart       # Interface abstraite
│   ├── real_trip_repository.dart  # Implémentation Ferry/GraphQL
│   └── mock_trip_repository.dart  # Implémentation en mémoire
├── pages/
│   ├── explorer_page.dart   # Liste des voyages
│   └── map_page.dart        # Carte interactive
├── map/                     # Widgets et logique cartographique
├── widgets/                 # Bottom sheets, formulaires
└── models.dart              # Modèles métier : Trip, Waypoint, Segment
```

**Flux de données :**

```
ExplorerPage / MapPage
    └── TripRepository (interface)
            ├── MockTripRepository   (kUseMock = true)
            └── RealTripRepository   (kUseMock = false)
                    └── Ferry Client → GraphQL API
```

---

### `vamos_ui`

Application Flutter principale — point d'entrée utilisateur, intègre `vamos_cartographie` comme module.

---

## Dépendances principales

| Package | Utilisé dans | Rôle |
|---|---|---|
| `flutter_map` | `vamos_cartographie` | Carte interactive (tuiles OSM) |
| `latlong2` | `vamos_cartographie` | Coordonnées GPS |
| `ferry` | `api_client` | Client GraphQL avec cache normalisé |
| `get_it` | `vamos_cartographie`, `vamos_ui` | Injection de dépendances |
| `dartz` | `vamos_cartographie` | Types fonctionnels (`Either<Failure, T>`) |
| `hive_flutter` | `vamos_ui` | Cache persistant local |
| `gql_tristate_value` | `api_client` | Valeurs optionnelles dans les mutations |

---

## Commits

Les packages étant dans le même repo, tu peux faire des commits granulaires par package :

```sh
# Commit isolé sur api_client
git add api_client/
git commit -m "feat(api_client): add DeleteTrip mutation"

# Commit isolé sur vamos_cartographie
git add vamos_cartographie/
git commit -m "feat(cartographie): add ExplorerPage"

# Commit transversal (changement de schéma + adaptation UI)
git add api_client/ vamos_cartographie/
git commit -m "feat: add trip deletion end-to-end"
```

Filtrer le log par package :

```sh
git log --oneline -- api_client/
git log --oneline -- vamos_cartographie/
```
