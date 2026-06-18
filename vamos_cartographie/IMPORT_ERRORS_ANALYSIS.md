# Analyse Détaillée des Erreurs d'Import - Projet vamos_cartographie

## Résumé Exécutif
Le projet contient **nombreuses erreurs d'import** réparties sur plusieurs catégories:
1. **Classes undefined** (Vertex, Segment, MobilityType) - problèmes d'imports manquants
2. **Imports URI invalides** - chemins d'imports incorrects
3. **Providers manquants** - providers Riverpod non trouvés
4. **Ambigüités d'export** - classes exportées depuis plusieurs modules

---

## 📋 FICHIERS AVEC ERREURS D'IMPORT IMPORTANTS

### 1. **lib/backend/core/fake_graphql_store.dart**
**Chemin complet:** `/home/luc/Code/Vamos/vamos_frontend/vamos_cartographie/lib/backend/core/fake_graphql_store.dart`

**Erreurs:**
| Ligne | Erreur | Classe Manquante | Solution |
|------|--------|------------------|----------|
| 19 | `non_type_as_type_argument` | `Segment` | Ajouter import `package:topology_engine/domain/domain.dart` |
| 20 | `non_type_as_type_argument` | `Vertex` | Ajouter import `package:topology_engine/domain/domain.dart` |
| 43 | `undefined_class` | `Vertex` | Même import |
| 50 | `undefined_class` | `Segment` | Même import |

**Import manquant:**
```dart
import 'package:topology_engine/domain/domain.dart';  // Déjà présent ligne 5
```
✅ **FIX:** L'import EST présent mais `Vertex` et `Segment` ne sont peut-être pas exportés correctement par la barrel file.

**Vérification nécessaire:** `/lib/packages/topology_engine/domain/domain.dart` exporte-t-il `Vertex` et `Segment`?
- ✅ Confiré: OUI - `export 'entities/entities.dart'` qui exporte `vertex.dart` et `segment.dart`

**Cause réelle:** Les classes sont définies dans `lib/packages/topology_engine/domain/entities/` mais l'import utilise `package:topology_engine/...` qui est incorrect (chemin relatif mal configuré).

---

### 2. **lib/backend/mapping/gql_mappers.dart**
**Chemin complet:** `/home/luc/Code/Vamos/vamos_frontend/vamos_cartographie/lib/backend/mapping/gql_mappers.dart`

**Erreurs:**
| Ligne | Type d'erreur | Classe Manquante |
|------|---|---|
| 21 | `undefined_class` | `Vertex` |
| 29 | `undefined_class` | `Vertex` |
| 43 | `undefined_class` | `Vertex` |
| 50 | `undefined_class` | `Segment` |

**Import actuel ligne 3:**
```dart
import 'package:topology_engine/domain/domain.dart';
```

**Status:** Même problème que fake_graphql_store.dart - `Vertex` et `Segment` non résolus.

---

### 3. **lib/backend/core/fake_seeds.dart**
**Chemin complet:** `/home/luc/Code/Vamos/vamos_frontend/vamos_cartographie/lib/backend/core/fake_seeds.dart`

**Erreurs:**
| Ligne | Erreur | Classe Manquante |
|------|--------|------------------|
| 8 | `non_type_as_type_argument` | `Vertex` |
| 9 | `non_type_as_type_argument` | `Segment` |

**Import existant ligne 1:**
```dart
import 'package:topology_engine/domain/domain.dart';
```

**Status:** Même problème d'export de `Vertex` et `Segment`.

---

### 4. **lib/backend/resolvers/topology_resolver.dart**
**Chemin complet:** `/home/luc/Code/Vamos/vamos_frontend/vamos_cartographie/lib/backend/resolvers/topology_resolver.dart`

**Erreurs principales:**
| Ligne | Type d'erreur | Détail |
|------|---|---|
| 57-58 | `unchecked_use_of_nullable_value` | `startVertexId` peut être null |
| 72 | `unchecked_use_of_nullable_value` | `.id` peut être null |
| 115 | `non_type_as_type_argument` | Type `Vertex` not resolved |
| 116 | `undefined_method` | `Vertex()` constructor not found |
| 159 | `undefined_method` | `Segment()` constructor not found |
| 163, 199 | `undefined_method` | `.toDomain()` sur `GMobilityType` |

**Imports existants:**
```dart
import 'package:topology_engine/domain/domain.dart';  // Ligne 3
import 'package:topology_engine/data/mappers/mobility_type_mapper.dart';  // Ligne 4
```

**Problèmes identifiés:**
1. `Vertex` et `Segment` non importés (même problème précédent)
2. `GMobilityType.toDomain()` - vérifie si le mapper fournit cette méthode

---

### 5. **lib/backend/resolvers/waypoint_resolver.dart**
**Chemin complet:** `/home/luc/Code/Vamos/vamos_frontend/vamos_cartographie/lib/backend/resolvers/waypoint_resolver.dart`

**Erreurs:**
| Ligne | Type d'erreur | Problème |
|------|---|---|
| 79 | `non_type_as_type_argument` | `Vertex` not a type |
| 82, 90 | `non_type_as_type_argument` | `Vertex` type argument |
| 93 | `undefined_method` | `Vertex()` constructor |

**Import existant ligne 4:**
```dart
import 'package:topology_engine/domain/domain.dart';
```

**Status:** Même problème - `Vertex` non résolu.

---

### 6. **lib/features/map/presentation/screens/map_screen.dart**
**Chemin complet:** `/home/luc/Code/Vamos/vamos_frontend/vamos_cartographie/lib/features/map/presentation/screens/map_screen.dart`

**Erreur critique ligne 8:**
```
error • Target of URI doesn't exist: 'package:vamos_cartographie/features/map/application/events/ui_events.dart'
```

**Import problématique:**
```dart
import 'package:vamos_cartographie/features/map/application/events/ui/ui_events.dart';  // Ligne 8 ❌ FAUX CHEMIN
```

**Chemin correct:**
```dart
import 'package:vamos_cartographie/features/map/application/events/ui/ui_events.dart';  // ✅ Correct
```

**Note:** Le fichier `ui_events.dart` existe et exporte la classe `MapTapped` à la ligne 17.

**Ligne 56 erreur secondaire:**
```
error • The method 'MapTapped' isn't defined for the type '_MapScreenState'
```
Ceci est une conséquence du problème d'import ci-dessus.

---

### 7. **lib/features/trips/application/command_handlers/trip_handler.dart**
**Chemin complet:** `/home/luc/Code/Vamos/vamos_frontend/vamos_cartographie/lib/features/trips/application/command_handlers/trip_handler.dart`

**Erreur ligne 15:**
```
error • Undefined class 'OptimisticExecutor'
error • Undefined name 'optimisticExecutorProvider'
```

**Import manquant:**
```dart
// À ajouter:
import 'package:topology_engine/application/pipeline/graph_executor.dart';
import 'package:topology_engine/infrastructure/providers/topology_providers.dart';
```

**Status actuel:**
- Ligne 7 importe `topology_providers.dart` ✅
- Mais `OptimisticExecutor` est défini dans `graph_executor.dart` ❌

---

### 8. **lib/features/waypoints/command_handlers/waypoint_handler.dart**
**Chemin complet:** `/home/luc/Code/Vamos/vamos_frontend/vamos_cartographie/lib/features/waypoints/command_handlers/waypoint_handler.dart`

**Erreurs:**
| Ligne | Erreur | Détail |
|------|--------|--------|
| 14 | `undefined_class` | `GraphStore` |
| 14 | `undefined_method` | `.tripGraphProvider()` |
| 15 | `undefined_class` | `OptimisticExecutor` |
| 15 | `undefined_name` | `optimisticExecutorProvider` |
| 23 | `non_type_as_type_argument` | `Vertex` type not resolved |

**Imports manquants:**
```dart
// À ajouter:
import 'package:topology_engine/runtime/store/graph_store.dart';
import 'package:topology_engine/infrastructure/providers/topology_providers.dart';
import 'package:topology_engine/application/pipeline/graph_executor.dart';
```

**Note:** `GraphStore` est défini en `/lib/packages/topology_engine/runtime/store/graph_store.dart`

---

## 🔧 CLASSE D'IMPORTS CRITIQUES À CORRIGER

### **Problème Principal: Vertex & Segment**

**Location:** `lib/packages/topology_engine/domain/entities/`
- `vertex.dart` - définit la classe `Vertex`
- `segment.dart` - définit la classe `Segment` et `SegmentDraft`

**Chemin d'import actuel:** `package:topology_engine/domain/domain.dart`

**Problème:** Le package `topology_engine` est défini comme chemin local dans `pubspec.yaml`:
```yaml
topology_engine:
  path: lib/packages/topology_engine
```

**Vérifier les re-exports:**
1. `/lib/packages/topology_engine/domain/domain.dart` - exporte correctement?
2. `/lib/packages/topology_engine/topology.dart` - barrel file principal?

---

### **Problème Secondaire: OptimisticExecutor & GraphStore**

**OptimisticExecutor:**
- **Location:** `lib/packages/topology_engine/application/pipeline/graph_executor.dart`
- **Export via:** `lib/packages/topology_engine/infrastructure/providers/topology_providers.dart` (ligne 46)
- **Import à utiliser:** `import 'package:topology_engine/application/pipeline/graph_executor.dart';`

**GraphStore:**
- **Location:** `lib/packages/topology_engine/runtime/store/graph_store.dart`
- **Import à utiliser:** `import 'package:topology_engine/runtime/store/graph_store.dart';`

**tripGraphProvider:**
- **Location:** `lib/packages/topology_engine/infrastructure/providers/topology_providers.dart` (ligne 13)
- **Accès:** `ref.watch(tripGraphProvider(tripId))`

---

## 📊 RÉSUMÉ PAR CATÉGORIE

### Classe 1: Vertex & Segment Non Résolus (8 fichiers)
```
fake_graphql_store.dart
mapping/gql_mappers.dart
core/fake_seeds.dart
resolvers/topology_resolver.dart
resolvers/waypoint_resolver.dart
features/waypoints/command_handlers/waypoint_handler.dart
packages/topology_engine/data/mappers/segment_mappers.dart
packages/topology_engine/data/mappers/vertex_mappers.dart
```

### Classe 2: URI Import Invalides (1 fichier)
```
features/map/presentation/screens/map_screen.dart (ligne 8)
```

### Classe 3: Providers Manquants (3 fichiers)
```
features/trips/application/command_handlers/trip_handler.dart (OptimisticExecutor)
features/waypoints/command_handlers/waypoint_handler.dart (GraphStore, tripGraphProvider, OptimisticExecutor)
```

### Classe 4: MobilityType.toDomain() (2 fichiers)
```
backend/resolvers/topology_resolver.dart (lignes 163, 199)
```

---

## ✅ PLAN DE CORRECTION

### Étape 1: Vérifier les exports barrel
[ ] Vérifier `/lib/packages/topology_engine/domain/domain.dart`
[ ] Vérifier `/lib/packages/topology_engine/topology.dart`
[ ] Ajouter les exports manquants si nécessaire

### Étape 2: Corriger les imports de base
[ ] **fake_graphql_store.dart** - S'assurer que `Vertex` et `Segment` sont importés
[ ] **gql_mappers.dart** - Même chose
[ ] **fake_seeds.dart** - Même chose

### Étape 3: Corriger les imports spécialisés
[ ] **waypoint_handler.dart** - Ajouter imports pour `GraphStore`, `OptimisticExecutor`
[ ] **trip_handler.dart** - Ajouter import pour `OptimisticExecutor`
[ ] **topology_resolver.dart** - Ajouter imports pour constructeurs `Vertex()` et `Segment()`

### Étape 4: Corriger les chemins d'import
[ ] **map_screen.dart** - Corriger le chemin d'import pour `ui_events.dart`

### Étape 5: Résoudre les méthodes manquantes
[ ] Vérifier `GMobilityType.toDomain()` dans `topology_engine/data/mappers/mobility_type_mapper.dart`

---

## 📌 FICHIERS CLÉS À VÉRIFIER

| Fichier | Rôle | Status |
|---------|------|--------|
| `lib/packages/topology_engine/domain/domain.dart` | Re-exporte entités | À vérifier |
| `lib/packages/topology_engine/domain/entities/entities.dart` | Exporte Vertex & Segment | ✅ OK |
| `lib/packages/topology_engine/topology.dart` | Barrel file principal | À vérifier |
| `lib/packages/topology_engine/infrastructure/providers/topology_providers.dart` | Providers Riverpod | ✅ OK (OptimisticExecutor ligne 46) |
| `lib/packages/topology_engine/application/pipeline/graph_executor.dart` | OptimisticExecutor | ✅ OK |
| `lib/packages/topology_engine/runtime/store/graph_store.dart` | GraphStore | ✅ OK |

