# vamos_cartographie

Module Flutter de cartographie du projet **Vamos** — permet de créer, visualiser et éditer des voyages itinérants sur une carte interactive.

---

## Prérequis

| Outil | Version minimale |
|---|---|
| Flutter | 3.x (SDK Dart ^3.11.4) |
| Dart | ^3.11.4 |

---

## Structure du dépôt

Ce module dépend d'un package local `api_client` qui doit se trouver **au même niveau** dans le système de fichiers :

```
vamos_frontend/
├── vamos_cartographie/   ← ce projet Flutter
└── api_client/           ← package Dart local (client GraphQL généré)
```

Le lien est déclaré dans `pubspec.yaml` via un chemin relatif :

```yaml
dependencies:
  api_client:
    path: ../api_client
```

> **Si tu clones ce projet seul**, le `flutter pub get` échouera car `../api_client` sera introuvable.
> Voir la section [Installation](#installation) pour la marche à suivre.

---

## Installation

### 1. Cloner les deux packages ensemble

Les deux projets doivent être frères dans un même dossier parent :

```sh
mkdir vamos_frontend && cd vamos_frontend
git clone <url-du-repo-vamos_cartographie>
git clone <url-du-repo-api_client>
```

Ou si tu utilises un **monorepo** (recommandé, voir [plus bas](#monorepo--git-recommandé)) :

```sh
git clone <url-du-monorepo> vamos_frontend
```

### 2. Installer les dépendances de `api_client`

`api_client` est un package Dart pur (pas Flutter), ses dépendances s'installent avec :

```sh
cd api_client
dart pub get
```

### 3. Installer les dépendances de `vamos_cartographie`

```sh
cd ../vamos_cartographie
flutter pub get
```

---

## Lancement

### Mode mock (sans backend)

Par défaut, l'application utilise des données fictives en mémoire — **aucun serveur requis**.

```sh
flutter run
```

Le flag est dans `lib/core/config.dart` :

```dart
const bool kUseMock = true;  // ← données fictives
```

### Mode production (avec le backend GraphQL)

1. Lance le backend sur `http://localhost:8000/graphql/`
2. Change le flag :

```dart
const bool kUseMock = false;  // ← vrai backend
```

3. Lance l'application :

```sh
flutter run
```

---

## Architecture

```
lib/
├── core/
│   ├── config.dart          # Flag kUseMock (mock vs production)
│   ├── failure.dart         # Types d'erreurs (ServerFailure, ConnectionFailure…)
│   └── injection.dart       # Injection de dépendances (GetIt)
│
├── repository/
│   ├── trip_repository.dart       # Interface abstraite (contrat)
│   ├── real_trip_repository.dart  # Implémentation Ferry/GraphQL
│   └── mock_trip_repository.dart  # Implémentation en mémoire (3 voyages fictifs)
│
├── pages/
│   ├── explorer_page.dart   # Liste des voyages (page d'accueil)
│   └── map_page.dart        # Carte interactive (création / édition / lecture)
│
├── map/
│   ├── map_view.dart                      # Widget carte (flutter_map)
│   ├── customPolyEditor.dart              # Éditeur de tracé interactif
│   ├── waypoint_markers_builder.dart      # Marqueurs de points de passage
│   ├── segment_layers_builder.dart        # Couches de segments (lignes)
│   ├── segment_type_markers_builder.dart  # Marqueurs de type de segment
│   └── segment_intermediatePoints.dart    # Points intermédiaires d'un segment
│
├── widgets/
│   ├── trip_info_sheet.dart         # Bottom sheet infos du voyage
│   ├── waypoint_bottom_sheet.dart   # Bottom sheet d'un point de passage
│   ├── segment_bottom_sheet.dart    # Bottom sheet d'un segment
│   ├── image_carousel_picker.dart   # Carrousel de photos
│   └── text_area_counter.dart       # Champ texte avec compteur de caractères
│
├── models.dart              # Modèles métier : Trip, Waypoint, Segment
└── app.dart                 # Racine MaterialApp
```

### Flux de données

```
ExplorerPage
    └── TripRepository (interface)
            ├── MockTripRepository   (kUseMock = true)
            └── RealTripRepository   (kUseMock = false)
                    └── Ferry Client → GraphQL API
```

---

## `api_client` — le package GraphQL

`api_client` contient le client Ferry et **tout le code GraphQL généré automatiquement** (types, requêtes, mutations). Il ne doit jamais être modifié à la main dans `__generated__/`.

### Structure

```
api_client/lib/src/graphql/
├── schema.graphql            # Schéma GraphQL du backend
├── fragments/trip.graphql    # Fragments réutilisables (TripFields, WaypointFields…)
├── queries/trip.graphql      # Queries : GetAllTrips, GetTrip
├── mutations/trip.graphql    # Mutations : CreateTrip, UpdateTrip, DeleteTrip
└── __generated__/            # ⚠️ Code généré — ne pas modifier
```

### Régénérer le code après un changement de schéma

Si le schéma GraphQL du backend évolue, il faut regénérer les types Dart :

```sh
cd api_client
dart run build_runner build --delete-conflicting-outputs
```

> Le générateur utilisé est `ferry_generator2`. La configuration est dans `build.yaml`.

---

## Dépendances principales

| Package | Rôle |
|---|---|
| `flutter_map` | Carte interactive (tuiles OSM) |
| `latlong2` | Coordonnées GPS |
| `ferry` | Client GraphQL avec cache normalisé |
| `get_it` | Injection de dépendances |
| `dartz` | Types fonctionnels (`Either<Failure, T>`) |
| `equatable` | Comparaison de valeurs |
| `gql_tristate_value` | Valeurs optionnelles dans les mutations GraphQL |

---

## Monorepo & Git (recommandé)

### Pourquoi un monorepo ?

`vamos_cartographie` et `api_client` sont **couplés** : une modification du schéma GraphQL dans `api_client` impacte directement `vamos_cartographie`. Les gérer dans des repos séparés crée de la friction (synchronisation manuelle des versions, risques de divergence).

Un **monorepo** — un seul repo Git contenant les deux — résout ça simplement, sans outil externe.

### Structure recommandée

```
vamos_frontend/          ← repo Git racine
├── .git/
├── .gitignore
├── README.md            # (optionnel) doc du monorepo
├── api_client/
│   ├── pubspec.yaml
│   └── ...
└── vamos_cartographie/
    ├── pubspec.yaml
    └── ...
```

### Mise en place

```sh
# Depuis le dossier parent vamos_frontend/
git init
```

Crée un `.gitignore` à la racine :

```gitignore
# Flutter / Dart
**/build/
**/.dart_tool/
**/pubspec.lock

# IDE
.idea/
.vscode/
*.iml

# OS
.DS_Store
Thumbs.db
```

C'est tout — Git versionne les deux packages ensemble, les `path:` relatifs continuent de fonctionner, et un seul `git clone` suffit pour tout avoir.

### Alternative : Git submodules

Si tu veux garder des repos séparés (par exemple parce que `api_client` est partagé avec d'autres projets), tu peux utiliser les **Git submodules** :

```sh
# Dans vamos_frontend/
git submodule add <url-api_client> api_client
git submodule add <url-vamos_cartographie> vamos_cartographie
```

Mais pour un usage interne mono-équipe, le **monorepo simple est largement suffisant et moins complexe**.
