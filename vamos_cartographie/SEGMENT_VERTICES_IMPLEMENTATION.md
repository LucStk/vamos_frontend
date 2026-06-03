# Implémentation des SegmentVertex avec middleVertices draggables et Ghost Markers

## 📋 Vue d'ensemble

Cette mise à jour intègre complètement les `SegmentVertex` dans l'application de cartographie, en ajoutant :

1. **MiddleVertices draggables** : Points intermédiaires sur les segments que vous pouvez déplacer
2. **Ghost markers** : Marqueurs semi-transparents au milieu de chaque paire de vertices qui, quand déplacés, créent de nouveaux middleVertices

## 🏗️ Architecture

### Modèle de données

Le modèle `Segment` a été mis à jour :

```dart
@freezed
abstract class Segment with _$Segment {
  const factory Segment({
    required int id,
    required int startWaypointId,
    required int endWaypointId,
    required List<SegmentVertex> middleVertices, // ← Nouveau !
    @Default(SegmentType.bike) SegmentType type,
  }) = _Segment;
}
```

`SegmentVertex` est défini comme :

```dart
@freezed
abstract class SegmentVertex with _$SegmentVertex {
  const factory SegmentVertex({
    required String id,
    required LatLng point,
  }) = _SegmentVertex;
}
```

### Providers Riverpod

#### 1. `segment_vertices_notifier.dart`

Nouveau fichier contenant :

- **`segmentAllVerticesProvider`** : Retourne tous les vertices d'un segment (start waypoint + middleVertices + end waypoint)
- **`segmentGhostMarkersProvider`** : Calcule automatiquement les positions des ghost markers entre chaque paire de vertices
- **`GhostMarkerData`** : Classe contenant les informations d'un ghost marker

#### 2. Méthodes ajoutées à `SegmentsStore`

Dans `segments_notifier.dart`, trois nouvelles méthodes ont été ajoutées :

```dart
// Met à jour la position d'un middleVertex
Future<void> updateMiddleVertexPosition({
  required String vertexId,
  required LatLng newPosition,
}) async

// Ajoute un nouveau middleVertex à une position spécifique
Future<void> addMiddleVertex({
  required int segmentId,
  required int insertIndex,
  required LatLng position,
}) async

// Supprime un middleVertex
Future<void> removeMiddleVertex({
  required String vertexId,
}) async
```

### Composants UI

#### Nouveaux widgets

1. **`MiddleVertexMarkerView`** (`markers/middle_vertex_marker_view.dart`)
   - Apparence visuelle d'un middleVertex
   - Cercle coloré selon le type de segment avec bordure blanche

2. **`buildMiddleVertexMarkers()`** (`middle_vertex_marker_factory.dart`)
   - Factory function qui crée les markers draggables pour les middleVertices
   - Supporte le drag & drop
   - Long press pour supprimer un vertex

3. **`buildGhostMarkersV2()`** (`ghost_marker_factory_v2.dart`)
   - Factory function qui crée les ghost markers
   - Markers semi-transparents entre chaque vertex
   - Supporte le drag & drop pour créer de nouveaux vertices

#### Mise à jour de `SegmentsLayer`

Le composant `SegmentsLayer` a été mis à jour pour afficher :

```dart
Stack(
  children: [
    PolylineLayer(polylines: polylines),        // Les lignes
    MarkerLayer(markers: ghostMarkers),         // Ghost markers (en dessous)
    MarkerLayer(markers: middleVertexMarkers),  // MiddleVertices (au milieu)
    MarkerLayer(markers: typeMarkers),          // Type markers (au dessus)
  ],
)
```

### États et types

Le fichier `segment_states.dart` a été enrichi avec :

```dart
@freezed
sealed class LineNode with _$LineNode {
  const factory LineNode.waypoint({...}) = WaypointNode;
  const factory LineNode.intermediate({...}) = IntermediateNode;
  const factory LineNode.middleVertex({      // ← Nouveau !
    required String uid,
    required String vertexId,
    required LatLng latLng,
  }) = MiddleVertexNode;
}
```

## 🎯 Utilisation

### Manipulation des middleVertices

#### Déplacer un vertex

Les middleVertices sont automatiquement draggables. Le déplacement mettra à jour le segment via GraphQL.

```dart
// Appel automatique lors du drag & drop
ref.read(segmentsStoreProvider(tripId).notifier)
   .updateMiddleVertexPosition(
     vertexId: 'vertex-id',
     newPosition: newLatLng,
   );
```

#### Supprimer un vertex

Long press sur un middleVertex ouvre une dialog de confirmation.

```dart
ref.read(segmentsStoreProvider(tripId).notifier)
   .removeMiddleVertex(vertexId: 'vertex-id');
```

#### Ajouter un vertex via ghost marker

Drag & drop un ghost marker crée un nouveau middleVertex.

```dart
ref.read(segmentsStoreProvider(tripId).notifier)
   .addMiddleVertex(
     segmentId: segmentId,
     insertIndex: ghostData.insertIndex,
     position: dropPosition,
   );
```

## 🔄 Changements de rupture

### Champs renommés

- `Segment.geometry` → `Segment.middleVertices`
- Les éléments sont maintenant de type `SegmentVertex` au lieu de `LatLng`

### Mappers mis à jour

- `SegmentMapper.fromGQL()` : Convertit `data.geometry` en `middleVertices`
- `SegmentDraftMapper.toGQLInput()` : Convertit `middleVertices` en `geometry` pour GraphQL
- `SegmentDraftMapper.toGQLUpdateInput()` : Idem pour les updates

### Providers mis à jour

- `segmentPolylinePointsProvider` : Utilise maintenant `middleVertices.map((v) => v.point)`
- `segmentNodesProvider` : Retourne des `MiddleVertexNode` au lieu de `IntermediateNode`
- `segmentPointsProvider` : Extrait les points depuis `middleVertices`

## 📝 Notes techniques

### Gestion des IDs

- Les IDs de middleVertices sont générés au format : `"{segmentId}-{timestamp}"`
- Cela garantit l'unicité tout en permettant d'identifier le segment parent

### Performance

- Les ghost markers sont recalculés automatiquement quand les vertices changent
- Utilisation de `select()` dans les providers pour minimiser les rebuilds
- Chaque marker est indépendant pour éviter les rebuilds inutiles

### Synchronisation GraphQL

- Toutes les modifications de vertices déclenchent une requête GraphQL
- Le backend stocke les middleVertices dans le champ `geometry`
- La conversion est transparente via les mappers

## 🐛 Points d'attention

### Drag & Drop

Pour l'instant, le drag & drop des markers nécessite une implémentation complète avec `DragTarget` sur la carte. Les `onDragEnd` callbacks sont en place mais doivent être connectés au `MapController` pour convertir les positions d'écran en coordonnées lat/lng.

### Ordre des vertices

L'ordre des middleVertices dans la liste est crucial car il détermine le chemin du segment. Lors de l'insertion/suppression, l'index doit être correctement calculé.

### Tests

Tous les tests ont été mis à jour pour utiliser `middleVertices` au lieu de `geometry`. Les mocks utilisent maintenant des listes de `SegmentVertex`.

## 🚀 Prochaines étapes suggérées

1. **Implémenter le DragTarget global** sur la map pour gérer les drops de markers
2. **Ajouter des animations** lors de l'ajout/suppression de vertices
3. **Optimiser le calcul des ghost markers** pour de très longues routes
4. **Ajouter un mode édition** pour activer/désactiver les ghost markers
5. **Implémenter un undo/redo** pour les modifications de vertices

## 📚 Fichiers modifiés

### Domain
- `lib/features/segments/domain/entities/segment.dart`
- `lib/features/segments/domain/entities/segment_vertex.dart`

### Data
- `lib/features/segments/data/mappers/segment_mappers.dart`
- `lib/features/segments/data/mappers/segment_mappers_draft.dart`

### Application
- `lib/features/map/application/providers/segments_notifier.dart` (+ méthodes vertices)
- `lib/features/map/application/providers/segments_polyline_notifier.dart`
- `lib/features/map/application/providers/segment_vertices_notifier.dart` (nouveau)
- `lib/features/map/application/providers/map_notifier.dart`
- `lib/features/map/application/states/segment_states.dart`

### Presentation
- `lib/features/map/presentation/layers/segments/segment_layer.dart`
- `lib/features/map/presentation/layers/segments/markers/middle_vertex_marker_view.dart` (nouveau)
- `lib/features/map/presentation/layers/segments/middle_vertex_marker_factory.dart` (nouveau)
- `lib/features/map/presentation/layers/segments/ghost_marker_factory_v2.dart` (nouveau)

### Tests & Mocks
- `test/fixtures/segment_fixtures.dart`
- `test/features/segment/mappers/segment_mappers_test.dart`
- `lib/features/trips/data/mocks/seeds/mock_trips_data.dart`
- `lib/features/segments/data/mocks/mock_segment_repository.dart`
- Tous les tests passent ✅
