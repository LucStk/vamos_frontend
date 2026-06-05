// features/segments/presentation/providers/segments_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';

part 'segments_notifier.g.dart';

@riverpod
class SegmentsNotifier extends _$SegmentsNotifier {
  SegmentRepository get repository => ref.read(segmentRepositoryProvider);

  // ---------------------------------------------------------------------------
  // Helpers internes
  // ---------------------------------------------------------------------------

  Map<int, Segment> get _current => state.value ?? <int, Segment>{};

  void _emit(Map<int, Segment> next) {
    state = AsyncData(next);
  }

  void _update(Segment segment) {
    final next = Map<int, Segment>.from(_current)..[segment.id] = segment;

    _emit(next);
  }

  void _remove(int id) {
    final next = Map<int, Segment>.from(_current)..remove(id);
    _emit(next);
  }

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  @override
  Future<Map<int, Segment>> build(int tripId) async {
    return _load(tripId);
  }

  Future<Map<int, Segment>> _load(int tripId) async {
    final result = await repository.getSegments(tripId);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (segments) => {for (final s in segments) s.id: s},
    );
  }

  // ---------------------------------------------------------------------------
  // Public API (UI actions)
  // ---------------------------------------------------------------------------

  Future<void> refresh(int tripId) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() => _load(tripId));
  }

  // CREATE
  Future<void> createSegment(int tripId, SegmentDraft draft) async {
    final result = await repository.createSegment(tripId, draft);

    result.fold((_) {}, (segment) => _update(segment));
  }

  // UPDATE (optimistic)
  Future<void> updateSegment(int id, SegmentDraft draft) async {
    final previous = _current;

    final optimistic = draft.toSegment(id);
    _update(optimistic);

    final result = await repository.updateSegment(id, draft);

    result.fold(
      (_) {
        _emit(previous); // rollback
      },
      (server) {
        _update(server); // sync truth serveur
      },
    );
  }

  // DELETE
  Future<void> deleteSegment(int id) async {
    final previous = _current;

    _remove(id);

    final result = await repository.deleteSegment(id);

    result.fold((_) {
      _emit(previous); // rollback
    }, (_) {});
  }
}

@riverpod
List<int> segmentIds(Ref ref, int tripId) {
  // Ce provider ne notifiera que si un identifiant est ajouté ou retiré
  return ref.watch(segmentsProvider(tripId).select((map) => map.keys.toList()));
}

@riverpod
Segment? segment(Ref ref, int tripId, int segmentId) {
  // Ce provider ne rebuilde le marqueur individuel QUE si ses données changent
  return ref.watch(segmentsProvider(tripId).select((map) => map[segmentId]));
}

@riverpod
List<LatLng>? segmentPoints(Ref ref, int tripId, int segmentId) {
  return ref.watch(
    segmentProvider(
      tripId,
      segmentId,
    ).select((s) => s?.middleVertices.map((v) => v.point).toList()),
  );
}

// @riverpod
// SegmentEnum? segmentType(Ref ref, int tripId, int segmentId) {
//   return ref.watch(segmentProvider(tripId, segmentId).select((w) => w!.type));
// }

//   // --- Opérations sur les middleVertices ---

//   /// Met à jour la position d'un middleVertex
//   Future<void> updateMiddleVertexPosition({
//     required String vertexId,
//     required LatLng newPosition,
//   }) async {
//     Segment? segment;
//     try {
//       segment = state.values.firstWhere(
//         (s) => s.middleVertices.any((v) => v.id == vertexId),
//       );
//     } catch (e) {
//       return; // Vertex non trouvé
//     }

//     final updatedVertices = segment.middleVertices.map((v) {
//       if (v.id == vertexId) {
//         return SegmentVertex(id: v.id, point: newPosition);
//       }
//       return v;
//     }).toList();

//     final draft = segment.copyWith(middleVertices: updatedVertices).toDraft();
//     await updateSegmentRemote(segment.id, draft);
//   }

//   /// Ajoute un nouveau middleVertex à un index spécifique
//   Future<void> addMiddleVertex({
//     required int segmentId,
//     required int insertIndex,
//     required LatLng position,
//   }) async {
//     final segment = state[segmentId];
//     if (segment == null) return;

//     // Calcul de l'index dans middleVertices (on retire 1 car insertIndex inclut le waypoint de départ)
//     final middleIndex = insertIndex - 1;

//     final newVertex = SegmentVertex(
//       id: '${segment.id}-${DateTime.now().millisecondsSinceEpoch}',
//       point: position,
//     );

//     final updatedVertices = List<SegmentVertex>.from(segment.middleVertices);
//     updatedVertices.insert(middleIndex, newVertex);

//     final draft = segment.copyWith(middleVertices: updatedVertices).toDraft();
//     await updateSegmentRemote(segment.id, draft);
//   }

//   /// Supprime un middleVertex
//   Future<void> removeMiddleVertex({required String vertexId}) async {
//     Segment? segment;
//     try {
//       segment = state.values.firstWhere(
//         (s) => s.middleVertices.any((v) => v.id == vertexId),
//       );
//     } catch (e) {
//       return; // Vertex non trouvé
//     }

//     final updatedVertices = segment.middleVertices
//         .where((v) => v.id != vertexId)
//         .toList();

//     final draft = segment.copyWith(middleVertices: updatedVertices).toDraft();
//     await updateSegmentRemote(segment.id, draft);
//   }
// }

// --- Providers Sélecteurs pour optimiser l'UI ---
