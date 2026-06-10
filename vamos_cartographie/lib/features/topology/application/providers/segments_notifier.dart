import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/state/state.dart';

import 'package:vamos_cartographie/features/topology/topology.dart';
part 'segments_notifier.g.dart';

@riverpod
class SegmentsNotifier extends _$SegmentsNotifier with EntityNotifier<Segment> {
  SegmentRepository get repo => ref.read(segmentRepositoryProvider);

  Future<Map<int, Segment>> _load() async {
    final result = await repo.getSegments(tripId);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (segments) => {for (final segment in segments) segment.id: segment},
    );
  }

  @override
  Future<Map<int, Segment>> build(int tripId) async {
    return await _load();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await _load());
  }

  Future<void> createSegment(SegmentDraft draft) async {
    final result = await repo.createSegment(tripId, draft);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (segment) => upsertLocal(segment),
    );
  }

  Future<void> updateSegment(int id, SegmentDraft draft) async {
    final old = getOrThrow(id);
    await optimistic(
      spec: OptimisticSpec(
        apply: () => updateLocal(draft.toSegment(id)),
        rollback: () => updateLocal(old),
        reconcile: upsertLocal,
      ),
      remote: () => repo.updateSegment(id, draft),
    );
  }

  Future<void> deleteSegment(int id) async {
    final old = getOrThrow(id);
    await optimistic(
      spec: OptimisticSpec(
        apply: () => removeLocal(id),
        rollback: () => upsertLocal(old),
      ),
      remote: () => repo.deleteSegment(id),
    );
  }
}

@riverpod
Map<int, Segment> segmentMap(Ref ref, int tripId) {
  return ref.watch(segmentsProvider(tripId)).value ?? const {};
}

@riverpod
List<int> segmentIds(Ref ref, int tripId) {
  return ref.watch(
    segmentMapProvider(tripId).select((map) => map.keys.toList()),
  );
}

@riverpod
Segment? segmentById(Ref ref, int tripId, int segmentId) {
  return ref.watch(segmentMapProvider(tripId).select((map) => map[segmentId]));
}
