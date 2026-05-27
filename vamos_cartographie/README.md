# vamos_cartographie

Module Flutter de cartographie du projet **Vamos** — carte interactive, création et édition de voyages itinérants.

> Ce package fait partie du monorepo `vamos_frontend`.
> **Pour l'installation, le lancement et l'architecture globale, voir le [README racine](../README.md).**

---

## Rôle dans le monorepo

```
vamos_ui
    └── vamos_cartographie   ← ce package
            └── api_client
```

`vamos_cartographie` est un module Flutter consommé par `vamos_ui`. Il expose les pages (`ExplorerPage`, `MapPage`) et la logique métier autour des voyages, en s'appuyant sur `api_client` pour la couche réseau.

---

## Architecture interne

```
lib/
├── core/
│   ├── config.dart          # Flag kUseMock (mock vs production)
│   ├── failure.dart         # Types d'erreurs métier
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
└── app.dart                 # Racine MaterialApp (dev standalone)
```

### Flux de données

```
ExplorerPage / MapPage
    └── TripRepository (interface)
            ├── MockTripRepository   (kUseMock = true)
            └── RealTripRepository   (kUseMock = false)
                    └── Ferry Client → GraphQL API
```

---

## Mode mock

Pour développer sans backend, le flag dans `lib/core/config.dart` suffit :

```dart
const bool kUseMock = true;  // ← données fictives en mémoire
```

Les données fictives (3 voyages en France) sont définies dans `mock_trip_repository.dart`.
Avant de lancer la génération, il faut télécharger le schema graphql du backend ->
```
get-graphql-schema http://localhost:8000/graphql/ > lib/graphql/schema.graphql
```
Le client tourne avec ferry generator 2.
Pour lancer la génération automatique des modèles dart :

```
flutter run build_runner build --delete-conflicting-outputs
```

Pour lancer les test
```
dart test
```
