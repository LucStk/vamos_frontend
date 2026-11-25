# vamos_frontend

Monorepo Flutter du projet **Vamos** — application de planification et de
visualisation de voyages itinérants, construite autour d'une carte
interactive.

---

## Structure

C'est un **workspace Dart** (`workspace:` dans le `pubspec.yaml` racine) : un
seul `pub get` à la racine résout tous les paquets, et un seul
`.dart_tool/package_config.json` les sert tous.

```
vamos_frontend/
├── apps/
│   └── vamos_cartographie/   # l'application (seul exécutable)
├── packages/
│   ├── domain_core/          # identifiants, Failure, géométrie, primitives
│   ├── user_profile_application/
│   ├── stored_file_application/
│   ├── trip_application/     # modèles et cas d'usage du voyage
│   ├── map_engine/           # modes, gestes, caméra, objets de carte
│   └── map_canvas/           # rendu : scène, items, peinture
└── third_party/
    └── device_preview/       # copie patchée, voir pubspec.yaml racine
```

### Dépendances entre paquets

```
vamos_cartographie
├── map_canvas ──────────→ map_engine, trip_application, domain_core
├── map_engine ──────────→ trip_application, user_profile_application, domain_core
├── trip_application ────→ stored_file_application, user_profile_application, domain_core
├── stored_file_application → domain_core
├── user_profile_application → domain_core
└── domain_core                (aucune dépendance locale)
```

Les paquets `*_application` ne dépendent ni de Flutter ni du réseau : ils
portent les modèles et les cas d'usage. `map_engine` porte la machine à modes
(ce que fait un geste selon le contexte) et reste lui aussi sans Flutter.
`map_canvas` dessine. L'application assemble, branche GraphQL et Supabase, et
fournit toute l'UI.

### À l'intérieur de l'application

```
apps/vamos_cartographie/lib/
├── main.dart              # téléphone
├── main_preview.dart      # PC, avec aperçu smartphone (device_preview)
├── bootstrap.dart         # dotenv, Supabase, ProviderContainer, ErrorHandler
├── app.dart               # MaterialApp.router
├── core/                  # réseau (Ferry), erreurs, config, injection
├── domain_features/       # par domaine : data/, providers/, presentation/
├── map/
│   ├── engine/            # machine à modes, gestes, hit-test (côté app)
│   ├── modes/             # une vue et une UI par mode
│   ├── objects/           # items de scène, par entité
│   ├── entities/          # fiches (voyage, étape, jour, route)
│   ├── camera/ rendering/ scene/ layers/
│   └── ui/                # dock, panneaux, dialogs, contrôles
├── routing/               # go_router + MapShell
├── ui_kit/                # thème, boutons, champs, dialogs génériques
└── app_services/          # notifications, localisation, image picker
```

---

## Prérequis

Le dépôt fournit un **flake Nix** avec Flutter, le SDK Android, le NDK et
melos. Avec [direnv](https://direnv.net) :

```sh
direnv allow     # lit .envrc, qui fait « use flake »
```

Sans direnv : `nix develop`.

Sans Nix, il faut Flutter ≥ 3.50 (SDK Dart ^3.9) et un SDK Android 35/36, et
installer melos soi-même (`dart pub global activate melos`).

---

## Installation

```sh
flutter pub get          # à la racine : résout tout le workspace
```

---

## Configuration

L'application lit un fichier `.env` **dans `apps/vamos_cartographie/`** (il
est déclaré dans les `assets` de son `pubspec.yaml`, donc embarqué dans le
binaire). Quatre clés, toutes requises :

```
BACKEND_URL=http://10.0.2.2:8000/graphql/
SUPABASE_URL=...
SUPABASE_PUBLISHABLE_KEY=...
MAPTILER_KEY=...
```

`BACKEND_URL` pointe le endpoint GraphQL du backend (`vamos_backend`).
Depuis un émulateur Android, `localhost` désigne l'émulateur : utiliser
`10.0.2.2`. Depuis un téléphone physique, l'IP de la machine sur le réseau
local.

Il n'y a **pas** de mode mock : l'application a besoin du backend, de
Supabase pour l'authentification et de MapTiler pour les tuiles.

---

## Lancement

```sh
cd apps/vamos_cartographie

flutter run                                   # téléphone ou émulateur
flutter run -d linux -t lib/main_preview.dart  # PC, aperçu smartphone (F2)
```

---

## Scripts melos

Définis dans le `pubspec.yaml` racine (il n'y a pas de `melos.yaml`), à lancer
depuis la racine :

```sh
melos run analyze        # dart analyze sur tous les paquets
melos run test           # dart test là où un test/ existe
melos run generate:all   # build_runner sur tous les paquets éligibles
melos run generate       # build_runner sur un paquet, choisi dans une liste
melos run clean:build    # build_runner clean
```

### Code généré

Trois générateurs tournent ensemble : **ferry_generator2** (GraphQL),
**riverpod_generator** (providers), **freezed** + **json_serializable**
(modèles), **go_router_builder** (routes). Tout ce qui est en `__generated__/`,
`*.g.dart` ou `*.freezed.dart` est produit par eux et ne se modifie pas à la
main : après un changement de requête GraphQL, de provider annoté ou de modèle
freezed, relancer `melos run generate:all`.

Pour rafraîchir le schéma GraphQL depuis un backend qui tourne en local :

```sh
melos run get-graphql-schema
```

---

## Conventions

- `always_use_package_imports` : les imports entre fichiers de la même
  bibliothèque passent par `package:` (voir `analysis_options.yaml`).
- `riverpod_lint` est actif comme plugin de l'analyzer.
- Commentaires et libellés en français, identifiants en anglais.
- Un commit par paquet quand c'est possible ; `git log --oneline -- packages/map_engine/`
  reste alors lisible.
