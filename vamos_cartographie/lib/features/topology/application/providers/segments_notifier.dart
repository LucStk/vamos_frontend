// features/segments/presentation/providers/segments_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';

import 'package:vamos_cartographie/core/state/entity_store_helpers.dart';
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

    result.fold((_) {}, (w) {
      final next = EntityStoreHelpers.set(_current, w.id, w);
      _emit(next);
    });
  }

  // UPDATE (optimistic)
  Future<void> updateSegment(int id, SegmentDraft draft) async {
    final previous = _current;

    final existing = previous[id];
    if (existing == null) return;

    final optimistic = existing.copyWith(
      startVertexId: draft.startVertexId,
      endVertexId: draft.startVertexId,
      geometry: draft.geometry != null ? draft.geometry! : [],
    );
    _emit(EntityStoreHelpers.update(previous, id, optimistic));

    final result = await repository.updateSegment(id, draft);

    result.fold(
      (_) => _emit(previous), // rollback
      (server) {
        final next = EntityStoreHelpers.set(_current, server.id, server);
        _emit(next);
      },
    );
  }

  // DELETE
  Future<void> deleteSegment(int id) async {
    final previous = _current;

    _emit(EntityStoreHelpers.remove(_current, id));

    final result = await repository.deleteSegment(id);

    result.fold(
      (_) => _emit(previous), // rollback
      (_) {},
    );
  }
}

@riverpod
Map<int, Segment> segmentMap(Ref ref, int tripId) {
  return ref.watch(segmentsProvider(tripId)).value ?? const {};
}

@riverpod
Iterable<int> segmentsIds(Ref ref, int tripId) {
  return ref.watch(segmentMapProvider(tripId).select((map) => map.keys));
}

@riverpod
Segment? segment(Ref ref, int tripId, int segmentId) {
  return ref.watch(segmentMapProvider(tripId).select((map) => map[segmentId]));
}
